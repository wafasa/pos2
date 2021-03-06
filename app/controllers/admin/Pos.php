<?php defined('BASEPATH') or exit('No direct script access allowed');

class Pos extends MY_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->library('cart');
        if (!$this->loggedIn) {
            $this->session->set_userdata('requested_page', $this->uri->uri_string());
            $this->sma->md('login');
        }
        if ($this->Customer || $this->Supplier) {
            $this->session->set_flashdata('warning', lang('access_denied'));
            redirect($_SERVER["HTTP_REFERER"]);
        }

        $this->load->admin_model('pos_model');
        $this->load->admin_model('code_model');
        $this->load->admin_model('sales_model');
        $this->load->helper('text');
        $this->pos_settings = $this->pos_model->getSetting();
        $this->pos_settings->pin_code = $this->pos_settings->pin_code ? md5($this->pos_settings->pin_code) : NULL;
        $this->data['pos_settings'] = $this->pos_settings;
        $this->session->set_userdata('last_activity', now());
        $this->lang->admin_load('pos', $this->Settings->user_language);
        $this->load->library('form_validation');
    }

	public function add_excel()
    {
        if (isset($_FILES["userfile"])) {

            $date = date('Y-m-d H:i:s');

            # upload file
            $config['upload_path'] = './files/';
            $config['allowed_types'] = 'xls|xlsx';
            $config['encrypt_name'] = true;
            $config['overwrite'] = false;

            $foto = '';
            $this->load->library('upload', $config);
			
            if (!$this->upload->do_upload('userfile')) {
                $d['error_foto'] = $this->upload->display_errors();				
            } else {
                # hapus session sebelumnya
                //Head : id_kasir, sess_id, tanggal, sales_id, acak
                //Detail : id_detail, id_kasir, id_produk, qty

                $data = $this->upload->data();
                $foto = $data['file_name'];
                // load library Excell_Reader
                $this->load->library('Excel_reader');

                //tentukan file
                $this->excel_reader->setOutputEncoding('230787');
                $file = $data['full_path'];
                $this->excel_reader->read($file);
                error_reporting(E_ALL ^ E_NOTICE);

                // array data
                $dt = $this->excel_reader->sheets[0];
                $dataexcel = Array();
                $buat_head = 0;
                $warehouse_id = 0;
                for ($i = 2; $i <= $dt['numRows']; $i++) {
					if ($dt['cells'][$i][1] != null && $dt['cells'][$i][2] != null) {
                        $date = DateTime::createFromFormat('d/m/Y H:i', $dt['cells'][$i][1])->format('Y-m-d H:i:s');						
						$ndate=DateTime::createFromFormat('d/m/Y H:i', $dt['cells'][$i][1])->format('Y-m-d');
                        $reference_no = $dt['cells'][$i][2];
                        $biller = $dt['cells'][$i][3];
                        $customer = $dt['cells'][$i][5];
                        $grand_total = $dt['cells'][$i][6];
                        $paid = $dt['cells'][$i][7];
                        $payment_status = $dt['cells'][$i][8];
                        $warehouse_id = $dt['cells'][$i][10];
                        $pos = $dt['cells'][$i][10];
                        $paid_by = $this->validate_payments($dt['cells'][$i][12]);

                        $datasx = array(
							'date'=>$date,
                            'reference_no' => $reference_no,
							'biller_id' => $this->site->getCompanyByName($biller),
                            'biller' => $biller,
							'customer_id' => $this->site->getCompanyByName($customer),
                            'customer' => $customer,
                            'total' => $grand_total,
							'grand_total' => $grand_total,
                            'paid' => $paid,
							'sale_status' => 'completed',
                            'payment_status' => strtolower($payment_status),
                            'warehouse_id' => $warehouse_id,
                            'pos' => $pos,
                        );
                        // IF REFERENCE = DELETE -> NEW INSERT
                        $validate_reference_no = $this->db->select("*")->where("reference_no", $reference_no)->get("sales")->result_array();
                        foreach ($validate_reference_no as $key => $value) {
							$this->db->delete("sales", array("id"=> $value["id"]));
                            $sale_items_delete = $this->db->select("*")->from("sale_items")->where(array("sale_id" => $value["id"]))->get()->result_array();
                            $this->db->delete("sale_items", array("sale_id" => $value["id"]));
							$this->db->delete("payments", array("sale_id" => $value["id"]));
							$this->db->delete("costing", array("sale_id"=> $value["id"]));
                            foreach ($sale_items_delete as $key => $value) {
                                $get_purchase_items = $this->db->select("*")->from("purchase_items")->where(array("product_id" => $value["product_id"], "warehouse_id" => $value["warehouse_id"]))->get()->row();
                                $this->db->update("purchase_items", array("quantity_balance" => ($get_purchase_items->quantity_balance + $value["quantity"])), array("id" => $get_purchase_items->id));
                            }
                            // $this->sma->print_arrays($sale_items_delete);
                            // echo $this->db->last_query();die;
							
                        }
                        // print_r($validate_reference_no);
                        // echo $this->db->last_query();
                        // die;
						
                        $this->db->insert('sales', $datasx);
                        $sale_id = $this->db->insert_id();
						$datapy=array(
							'date'=>$date,
							'reference_no' => $this->site->getReference('pay'),
							'sale_id' => $sale_id,
							'paid_by' => $paid_by,
							'created_by' => $this->site->getCompanyByName($customer),
							'type' =>'received',
							'amount' =>$grand_total,
							'pos_paid' =>$grand_total,
							'pos_balance'=>0
						);
						$this->site->updateReference('pay');
                        $this->site->updateReference('pos');
						$this->db->insert('payments', $datapy);
                        // echo $this->db->last_query();die;
						$this->site->syncSalePayments($sale_id);
                    } elseif ($dt['cells'][$i][1] == null && $dt['cells'][$i][2] != null) {
						if($dt['cells'][$i][3]==='Description') $i+=1;
						if($dt['cells'][$i][3]===null) echo "ABC";
                        $product_code = $dt['cells'][$i][3];
                        $product_name = $dt['cells'][$i][4];
                        $unit_quantity = $dt['cells'][$i][5];
                        $product_unit_code = $dt['cells'][$i][6];
                        $item_tax = $dt['cells'][$i][7];
                        $real_unit_price = $dt['cells'][$i][9];
                        $subtotal = $dt['cells'][$i][10];

                        $get_product = $this->db->select("*")->where(array("code" => $product_code))->get("products")->row();
                        // die;
                        // var_dump($get_product);
                        // die;
                        $datas = array(
                            'product_id' => $get_product->id,
                            'warehouse_id' => $warehouse_id,
                            'product_code' => $product_code,
                            'product_name' => $product_name,
                            'unit_quantity' => $unit_quantity,
                            'quantity' => $unit_quantity,
							'net_unit_price' => $real_unit_price,
							'unit_price' => $real_unit_price,
                            'product_unit_code' => $product_unit_code,
                            'item_tax' => $item_tax,
                            'real_unit_price' => $real_unit_price,
                            'subtotal' => $subtotal,
                            'sale_id' => $sale_id,

                        );
                        $this->db->insert('sale_items', $datas);
						$saleitem_id = $this->db->insert_id();
						$get_product->sale_item_id=$saleitem_id;						
                    } 
                    else {


                    }

                    if (!empty($get_product)) {
                        // $this->sma->print_arrays($get_product);
                        $item["product_id"]   = $get_product->id;
                        $item["product_code"] = $get_product->product_code;
                        $item["product_name"] = $get_product->product_name;
                        $item["product_type"] = $get_product->type;
						$item["option_id"] = "";
                        $item["warehouse_id"] = $warehouse_id;
                        $item["net_unit_price"] = $real_unit_price;
                        $item["unit_price"] = $real_unit_price;
                        $item["quantity"] = $unit_quantity;
                        // $this->sma->print_arrays($item);
						
                        $item_costs = $this->site->item_costing($item);
                        foreach ($item_costs as $key => $item_cost) {
                  		$cost = $this->site->costing(array($item));
                            $item_cost['sale_item_id'] = $get_product->sale_item_id;
                            $item_cost['sale_id'] = $sale_id;
                            $item_cost['date'] = $ndate;
							
							$this->db->insert('costing', $item_cost);
                            $this->site->syncPurchaseItems($cost);
                            
                        }
					$get_product=null;	
                    }
					
                }
		$this->site->syncQuantity($sale_id);
                for ($i = 1; $i < count($dataexcel); $i++) {

                    $nik = '';
                    if ($dataexcel[$i]['nik'] <> '') {
                        $nik = $dataexcel[$i]['nik'];
                    }
                    echo $nik . '<br/>';
                }
            }
			
            $this->session->set_userdata('remove_slls', 1);
            $this->session->set_flashdata('message', lang("sale_added"));
            // echo "string";die;
            admin_redirect("pos/sales");
        } else {
            $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => admin_url('pos'), 'page' => lang('pos')), array('link' => '#', 'page' => lang('pos_sales')));
            $meta = array('page_title' => lang('pos_sales'), 'bc' => $bc);
            $this->page_construct('pos/pos_by_excel', $meta, $this->data);
        }
    }

    public function validate_payments($string = '')
    {
        $default_payment = "cash";
        $payments = array("debit", "cash" , "CC", "Cheque");
        foreach ($payments as $key => $value) {
            if (strtolower($value) == strtolower($string)) {
                return $value;
            }
        }
        return $default_payment;
    }

    public function _add_excel()
    {
        if (isset($_FILES["userfile"])) {

            $date = date('Y-m-d H:i:s');

            # upload file
            $config['upload_path'] = './files/';
            $config['allowed_types'] = 'xls|xlsx';
            $config['encrypt_name'] = true;
            $config['overwrite'] = false;

            $foto = '';
            $this->load->library('upload', $config);
            if (!$this->upload->do_upload('userfile')) {
                $d['error_foto'] = $this->upload->display_errors();
            } else {
                # hapus session sebelumnya
                //Head : id_kasir, sess_id, tanggal, sales_id, acak
                //Detail : id_detail, id_kasir, id_produk, qty

                $data = $this->upload->data();
                $foto = $data['file_name'];
                // load library Excell_Reader
                $this->load->library('Excel_reader');

                //tentukan file
                $this->excel_reader->setOutputEncoding('230787');
                $file = $data['full_path'];
                $this->excel_reader->read($file);
                error_reporting(E_ALL ^ E_NOTICE);

                // array data
                $dt = $this->excel_reader->sheets[0];
                $dataexcel = Array();
                $buat_head = 0;
                $warehouse_id = 0;
                for ($i = 1; $i <= $dt['numRows']; $i++) {
                    if ($dt['cells'][$i][1] != null && $dt['cells'][$i][2] != null) {
                        $date = $dt['cells'][$i][1];
                        $reference_no = $dt['cells'][$i][2];
                        $biller = $dt['cells'][$i][3];
                        $customer = $dt['cells'][$i][5];
                        $grand_total = $dt['cells'][$i][6];
                        $paid = $dt['cells'][$i][7];
                        $payment_status = $dt['cells'][$i][8];
                        $warehouse_id = $dt['cells'][$i][10];
                        $pos = $dt['cells'][$i][10];

                        $datasx = array(
                            'reference_no' => $reference_no,
                            'biller' => $biller,
                            'customer' => $customer,
                            'grand_total' => $grand_total,
                            'paid' => $paid,
                            'payment_status' => $payment_status,
                            'warehouse_id' => $warehouse_id,
                            'pos' => $pos,
                        );
                        // IF REFERENCE = DELETE -> NEW INSERT
                        $validate_reference_no = $this->db->select("*")->where("reference_no", $reference_no)->get("sales")->result_array();
                        foreach ($validate_reference_no as $key => $value) {
                          $this->db->delete("sales", array("id"=> $value["id"]));
                          $this->db->delete("sales_item", array("sales_id" => $value["id"]));
                        }
                        // print_r($validate_reference_no);
                        // echo $this->db->last_query();
                        // die;
                        $this->db->insert('sales', $datasx);
                        $sale_id = $this->db->insert_id();

                        $this->site->updateReference('pos');

                    } elseif ($dt['cells'][$i][1] == null && $dt['cells'][$i][2] != null) {
                        $product_code = $dt['cells'][$i][3];
                        $product_name = $dt['cells'][$i][4];
                        $unit_quantity = $dt['cells'][$i][5];
                        $product_unit_code = $dt['cells'][$i][6];
                        $item_tax = $dt['cells'][$i][7];
                        $real_unit_price = $dt['cells'][$i][9];
                        $subtotal = $dt['cells'][$i][10];

                        $get_product = $this->db->select("*")->where(array("code" => $product_code))->get("products")->row();
                        // die;
                        // var_dump($get_product);
                        // die;
                        $datas = array(
                            'product_id' => $get_product->id,
                            'warehouse_id' => $warehouse_id,
                            'product_code' => $product_code,
                            'product_name' => $product_name,
                            'unit_quantity' => $unit_quantity,
                            'quantity' => $unit_quantity,
                            'product_unit_code' => $product_unit_code,
                            'item_tax' => $item_tax,
                            'real_unit_price' => $real_unit_price,
                            'subtotal' => $subtotal,
                            'sale_id' => $sale_id,

                        );
                        $this->db->insert('sale_items', $datas);


                    } 
                    else {


                    }
                  
                    if (!empty($get_product)) {
                        // $this->sma->print_arrays($get_product);
                        $item["product_id"]   = $get_product->id;
                        $item["product_code"] = $get_product->product_code;
                        $item["product_name"] = $get_product->product_name;
                        $item["product_type"] = $get_product->type;
                        $item["warehouse_id"] = $warehouse_id;
                        $item["option_id"] = "";
                        $item["net_unit_price"] = $real_unit_price;
                        $item["unit_price"] = $real_unit_price;
                        $item["quantity"] = $unit_quantity;
                        // $this->sma->print_arrays($item);
                        

                        $item_costs = $this->site->item_costing($item);
                        foreach ($item_costs as $key => $item_cost) {
                            $cost = $this->site->costing(array($item));
                            $item_cost['sale_item_id'] = $sale_item_id;
                            $item_cost['sale_id'] = $sale_id;
                            $item_cost['date'] = $date;
                  
                            $this->db->insert('costing', $item_cost);

                            $this->site->syncPurchaseItems($cost);
                            $this->site->syncQuantity($sale_id);
                        }
                    }
                }

                for ($i = 1; $i < count($dataexcel); $i++) {

                    $nik = '';
                    if ($dataexcel[$i]['nik'] <> '') {
                        $nik = $dataexcel[$i]['nik'];
                    }
                    echo $nik . '<br/>';
                }
            }

            $this->session->set_userdata('remove_slls', 1);
            $this->session->set_flashdata('message', lang("sale_added"));
            admin_redirect("pos/sales");
        } else {
            $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => admin_url('pos'), 'page' => lang('pos')), array('link' => '#', 'page' => lang('pos_sales')));
            $meta = array('page_title' => lang('pos_sales'), 'bc' => $bc);
            $this->page_construct('pos/pos_by_excel', $meta, $this->data);
        }
    }

	
    public function sales($warehouse_id = NULL)
    {
        $this->sma->checkPermissions('index');

        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        if ($this->Owner) {
            $this->data['warehouses'] = $this->site->getAllWarehouses();
            $this->data['warehouse_id'] = $warehouse_id;
            $this->data['warehouse'] = $warehouse_id ? $this->site->getWarehouseByID($warehouse_id) : NULL;
        } else {
            $user = $this->site->getUser();
            $this->data['warehouses'] = NULL;
            $this->data['warehouse_id'] = $this->session->userdata('warehouse_id');
            $this->data['warehouse'] = $this->session->userdata('warehouse_id') ? $this->site->getWarehouseByID($this->session->userdata('warehouse_id')) : NULL;
        }
        
        $this->data['result'] = $this->code_model->getCode();
        
        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => admin_url('pos'), 'page' => lang('pos')), array('link' => '#', 'page' => lang('pos_sales')));
        $meta = array('page_title' => lang('pos_sales'), 'bc' => $bc);
        $this->page_construct('pos/sales', $meta, $this->data);
    }

    public function getSales($warehouse_id = NULL)
    {
        $this->sma->checkPermissions('index');

        if ((!$this->Owner || !$this->Admin) && !$warehouse_id) {
            $user = $this->site->getUser();
            $warehouse_id = $user->warehouse_id;
        }

        $start_date = $this->input->get('start_date') ? $this->input->get('start_date') : NULL;
        $end_date = $this->input->get('end_date') ? $this->input->get('end_date') : NULL;
        $paid_by = $this->input->get('paid_by') ? $this->input->get('paid_by') : NULL;


        if ($start_date) {
            $start_date = $this->sma->fld($start_date);
            $end_date = $this->sma->fld($end_date);
        }

        $duplicate_link = anchor('admin/pos/?duplicate=$1', '<i class="fa fa-plus-square"></i> ' . lang('duplicate_sale'), 'class="duplicate_pos"');
        $detail_link = anchor('admin/pos/view/$1', '<i class="fa fa-file-text-o"></i> ' . lang('view_receipt'));
        $detail_link2 = anchor('admin/sales/modal_view/$1', '<i class="fa fa-file-text-o"></i> ' . lang('sale_details_modal'), 'data-toggle="modal" data-target="#myModal"');
        $detail_link3 = anchor('admin/sales/view/$1', '<i class="fa fa-file-text-o"></i> ' . lang('sale_details'));
        $payments_link = anchor('admin/sales/payments/$1', '<i class="fa fa-money"></i> ' . lang('view_payments'), 'data-toggle="modal" data-target="#myModal"');
        $add_payment_link = anchor('admin/pos/add_payment/$1', '<i class="fa fa-money"></i> ' . lang('add_payment'), 'data-toggle="modal" data-target="#myModal"');
        $packagink_link = anchor('admin/sales/packaging/$1', '<i class="fa fa-archive"></i> ' . lang('packaging'), 'data-toggle="modal" data-target="#myModal"');
        $add_delivery_link = anchor('admin/sales/add_delivery/$1', '<i class="fa fa-truck"></i> ' . lang('add_delivery'), 'data-toggle="modal" data-target="#myModal"');
        $email_link = anchor('admin/#', '<i class="fa fa-envelope"></i> ' . lang('email_sale'), 'class="email_receipt" data-id="$1" data-email-address="$2"');
        $edit_link = anchor('admin/sales/edit/$1', '<i class="fa fa-edit"></i> ' . lang('edit_sale'), 'class="sledit"');
        $return_link = anchor('admin/sales/return_sale/$1', '<i class="fa fa-angle-double-left"></i> ' . lang('return_sale'));
        
        $return_link = "<a href='" . admin_url('sales/return_sale/$1') . "' class='po-return_sale' title='<b>" . lang("return_sale") . "</b>' data-content=\"<p>"
            . lang('r_u_sure') . "</p><a class='btn btn-danger po-return_sale' href='" . admin_url('sales/return_sale/$1') . "'>"
            . lang('i_m_sure') . "</a> <button class='btn po-close'>" . lang('no') . "</button>\"  rel='popover'><i class=\"fa fa-angle-double-left\"></i> "
            . lang('return_sale') . "</a>";
        $delete_link = "<a href='" . admin_url('sales/delete/$1') . "' class='po-cancel' title='<b>" . lang("delete_sale") . "</b>' data-content=\"<p>"
            . lang('r_u_sure') . "</p><a class='btn btn-danger po-delete' href='" . admin_url('sales/delete/$1') . "'>"
            . lang('i_m_sure') . "</a> <button class='btn po-close'>" . lang('no') . "</button>\"  rel='popover'><i class=\"fa fa-trash-o\"></i> "
            . lang('delete_sale') . "</a>";
        $action = '<div class="text-center"><div class="btn-group text-left">'
            . '<button type="button" class="btn btn-default btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">'
            . lang('actions') . ' <span class="caret"></span></button>
            <ul class="dropdown-menu pull-right" role="menu">
                <li>' . $duplicate_link . '</li>
                <li>' . $detail_link . '</li>
                <li>' . $detail_link2 . '</li>
                <li>' . $detail_link3 . '</li>
                <li>' . $payments_link . '</li>
                <li>' . $add_payment_link . '</li>
                <li>' . $packagink_link . '</li>
                <li>' . $add_delivery_link . '</li>
                <li>' . $edit_link . '</li>
                <li>' . $email_link . '</li>
                <li>' . $return_link . '</li>
                <li>' . $delete_link . '</li>
            </ul>
        </div></div>';

        $this->load->library('datatables');
        if ($warehouse_id) {
            $this->datatables
                ->select($this->db->dbprefix('sales') . ".id as id, DATE_FORMAT(sma_sales.date, '%Y-%m-%d %T') as date, sma_sales.reference_no, biller, customer, (grand_total+COALESCE(rounding, 0)), paid, (grand_total-paid) as balance, sale_status, payment_status, companies.email as cemail")
                ->from('sales')
                ->join('companies', 'companies.id=sales.customer_id', 'left')
                ->join('payments', 'payments.sale_id=sales.id', '')
                ->where('warehouse_id', $warehouse_id)
                ->group_by('sales.id');
        } else {
            $this->datatables
                ->select($this->db->dbprefix('sales') . ".id as id, DATE_FORMAT(sma_sales.date, '%Y-%m-%d %T') as date, sma_sales.reference_no, biller, customer, (grand_total+COALESCE(rounding, 0)), paid, (grand_total+rounding-paid) as balance, sale_status, payment_status, companies.email as cemail")
                ->from('sales')
                ->join('companies', 'companies.id=sales.customer_id', 'left')
                ->join('payments', 'payments.sale_id=sales.id', '')
                ->group_by('sales.id');
        }
        // $this->db->where('pos', 1);
        if (!$this->Customer && !$this->Supplier && !$this->Owner && !$this->Admin && !$this->session->userdata('view_right')) {
            $this->datatables->where('created_by', $this->session->userdata('user_id'));
        } elseif ($this->Customer) {
            $this->datatables->where('customer_id', $this->session->userdata('user_id'));
        }
        if ($start_date) {
            $this->datatables->where($this->db->dbprefix('sales').'.date BETWEEN "' . $start_date . '" and "' . $end_date . '"');
        }
        if ($paid_by) {
            $this->datatables->where('payments.paid_by', $paid_by);
        }

        // echo $this->db->get();
        // echo $this->db->last_query();die;

        $this->datatables->add_column("Actions", $action, "id, cemail")->unset_column('cemail');
        echo $this->datatables->generate();
    }

    /* ---------------------------------------------------------------------------------------------------- */
    // OLD
    // public function index($sid = NULL)
    // {
    //     $this->sma->checkPermissions();

    //     if (!$this->pos_settings->default_biller || !$this->pos_settings->default_customer || !$this->pos_settings->default_category) {
    //         $this->session->set_flashdata('warning', lang('please_update_settings'));
    //         admin_redirect('pos/settings');
    //     }
    //     if ($register = $this->pos_model->registerData($this->session->userdata('user_id'))) {
    //         $register_data = array('register_id' => $register->id, 'cash_in_hand' => $register->cash_in_hand, 'register_open_time' => $register->date);
    //         $this->session->set_userdata($register_data);
    //     } else {
    //         $this->session->set_flashdata('error', lang('register_not_open'));
    //         admin_redirect('pos/open_register');
    //     }

    //     $this->data['sid'] = $this->input->get('suspend_id') ? $this->input->get('suspend_id') : $sid;
    //     $did = $this->input->post('delete_id') ? $this->input->post('delete_id') : NULL;
    //     $suspend = $this->input->post('suspend') ? TRUE : FALSE;
    //     $count = $this->input->post('count') ? $this->input->post('count') : NULL;

    //     $duplicate_sale = $this->input->get('duplicate') ? $this->input->get('duplicate') : NULL;

    //     //validate form input
    //     $this->form_validation->set_rules('customer', $this->lang->line("customer"), 'trim|required');
    //     $this->form_validation->set_rules('warehouse', $this->lang->line("warehouse"), 'required');
    //     $this->form_validation->set_rules('biller', $this->lang->line("biller"), 'required');

    //     if ($this->form_validation->run() == TRUE) {
    //         $cart = $this->session->userdata("cart");
    //         unset($cart[$this->input->post("cart")]);
    //         $this->session->set_userdata("cart", $cart);

    //         $date = date('Y-m-d H:i:s');
    //         $warehouse_id = $this->input->post('warehouse');
    //         $customer_id = $this->input->post('customer');
    //         $biller_id = $this->input->post('biller');
    //         $total_items = $this->input->post('total_items');
    //         $sale_status = 'completed';
    //         $payment_status = 'due';
    //         $payment_term = 0;
    //         $due_date = date('Y-m-d', strtotime('+' . $payment_term . ' days'));
    //         $shipping = $this->input->post('shipping') ? $this->input->post('shipping') : 0;
    //         $customer_details = $this->site->getCompanyByID($customer_id);
    //         $customer = $customer_details->company != '-'  ? $customer_details->company : $customer_details->name;
    //         $biller_details = $this->site->getCompanyByID($biller_id);
    //         $biller = $biller_details->company != '-' ? $biller_details->company : $biller_details->name;
    //         $note = $this->sma->clear_tags($this->input->post('pos_note'));
    //         $staff_note = $this->sma->clear_tags($this->input->post('staff_note'));
    //         $reference = $this->site->getReference('pos');

    //         $total = 0;
    //         $product_tax = 0;
    //         $order_tax = 0;
    //         $product_discount = 0;
    //         $order_discount = 0;
    //         $percentage = '%';
    //         $digital = FALSE;
    //         $i = isset($_POST['product_code']) ? sizeof($_POST['product_code']) : 0;
    //         for ($r = 0; $r < $i; $r++) {
    //             $item_id = $_POST['product_id'][$r];
    //             $item_type = $_POST['product_type'][$r];
    //             $item_code = $_POST['product_code'][$r];
    //             $item_name = $_POST['product_name'][$r];
    //             $item_comment = $_POST['product_comment'][$r];
    //             $item_option = isset($_POST['product_option'][$r]) && $_POST['product_option'][$r] != 'false' ? $_POST['product_option'][$r] : NULL;
    //             $real_unit_price = $this->sma->formatDecimal($_POST['real_unit_price'][$r]);
    //             $unit_price = $this->sma->formatDecimal($_POST['unit_price'][$r]);
    //             $item_unit_quantity = $_POST['quantity'][$r];
    //             $item_serial = isset($_POST['serial'][$r]) ? $_POST['serial'][$r] : '';
    //             $item_tax_rate = isset($_POST['product_tax'][$r]) ? $_POST['product_tax'][$r] : NULL;
    //             $item_discount = isset($_POST['product_discount'][$r]) ? $_POST['product_discount'][$r] : NULL;
    //             $item_unit = $_POST['product_unit'][$r];
    //             $item_quantity = $_POST['product_base_quantity'][$r];

    //             if (isset($item_code) && isset($real_unit_price) && isset($unit_price) && isset($item_quantity)) {
    //                 $product_details = $item_type != 'manual' ? $this->pos_model->getProductByCode($item_code) : NULL;
    //                 // $unit_price = $real_unit_price;
    //                 $pr_discount = 0;
    //                 if ($item_type == 'digital') {
    //                     $digital = TRUE;
    //                 }

    //                 if (isset($item_discount)) {
    //                     $discount = $item_discount;
    //                     $dpos = strpos($discount, $percentage);
    //                     if ($dpos !== FALSE) {
    //                         $pds = explode("%", $discount);
    //                         $pr_discount = $this->sma->formatDecimal(((($this->sma->formatDecimal($unit_price)) * (Float)($pds[0])) / 100), 4);
    //                     } else {
    //                         $pr_discount = $this->sma->formatDecimal($discount);
    //                     }
    //                 }

    //                 $unit_price = $this->sma->formatDecimal($unit_price - $pr_discount);
    //                 $item_net_price = $unit_price;
    //                 $pr_item_discount = $this->sma->formatDecimal($pr_discount * $item_unit_quantity);
    //                 $product_discount += $pr_item_discount;
    //                 $pr_item_tax = 0;
    //                 $item_tax = 0;
    //                 $tax = "";

    //                 if (isset($item_tax_rate) && $item_tax_rate != 0) {
   
    //                     $tax_details = $this->site->getTaxRateByID($item_tax_rate);
    //                     $ctax = $this->site->calculateTax($product_details, $tax_details, $unit_price);
    //                     $item_tax = $ctax['amount'];
    //                     $tax = $ctax['tax'];
    //                     if (!empty($product_details) && $product_details->tax_method != 1) {
    //                         $item_net_price = $unit_price - $item_tax;
    //                     }
    //                     $pr_item_tax = $this->sma->formatDecimal(($item_tax * $item_unit_quantity), 4);

    //                 }

    //                 $product_tax += $pr_item_tax;
    //                 $subtotal = (($item_net_price * $item_unit_quantity) + $pr_item_tax);
    //                 $unit = $this->site->getUnitByID($item_unit);

    //                 $products[] = array(
    //                     'product_id'      => $item_id,
    //                     'product_code'    => $item_code,
    //                     'product_name'    => $item_name,
    //                     'product_type'    => $item_type,
    //                     'option_id'       => $item_option,
    //                     'net_unit_price'  => $item_net_price,
    //                     'unit_price'      => $this->sma->formatDecimal($item_net_price + $item_tax),
    //                     'quantity'        => $item_quantity,
    //                     'product_unit_id' => $unit ? $unit->id : NULL,
    //                     'product_unit_code' => $unit ? $unit->code : NULL,
    //                     'unit_quantity' => $item_unit_quantity,
    //                     'warehouse_id'    => $warehouse_id,
    //                     'item_tax'        => $pr_item_tax,
    //                     'tax_rate_id'     => $item_tax_rate,
    //                     'tax'             => $tax,
    //                     'discount'        => $item_discount,
    //                     'item_discount'   => $pr_item_discount,
    //                     'subtotal'        => $this->sma->formatDecimal($subtotal),
    //                     'serial_no'       => $item_serial,
    //                     'real_unit_price' => $real_unit_price,
    //                     'comment'         => $item_comment,
    //                 );

    //                 $total += $this->sma->formatDecimal(($item_net_price * $item_unit_quantity), 4);
    //             }
    //         }
    //         if (empty($products)) {
    //             $this->form_validation->set_rules('product', lang("order_items"), 'required');
    //         } elseif ($this->pos_settings->item_order == 1) {
    //             krsort($products);
    //         }

    //         if ($this->input->post('discount')) {
    //             $order_discount_id = $this->input->post('discount');
    //             $opos = strpos($order_discount_id, $percentage);
    //             if ($opos !== FALSE) {
    //                 $ods = explode("%", $order_discount_id);
    //                 $order_discount = $this->sma->formatDecimal(((($total + $product_tax) * (Float)($ods[0])) / 100), 4);
    //             } else {
    //                 $order_discount = $this->sma->formatDecimal($order_discount_id);
    //             }
    //         } else {
    //             $order_discount_id = NULL;
    //         }
    //         $total_discount = $this->sma->formatDecimal($order_discount + $product_discount);

    //         if ($this->Settings->tax2) {
    //             $order_tax_id = $this->input->post('order_tax');
    //             if ($order_tax_details = $this->site->getTaxRateByID($order_tax_id)) {
    //                 if ($order_tax_details->type == 2) {
    //                     $order_tax = $this->sma->formatDecimal($order_tax_details->rate);
    //                 }
    //                 if ($order_tax_details->type == 1) {
    //                     $order_tax = $this->sma->formatDecimal(((($total + $product_tax - $order_discount) * $order_tax_details->rate) / 100), 4);
    //                 }
    //             }
    //         } else {
    //             $order_tax_id = NULL;
    //         }

    //         $total_tax = $this->sma->formatDecimal(($product_tax + $order_tax), 4); 
    //         $grand_total = $this->sma->formatDecimal(($total + $total_tax + $this->sma->formatDecimal($shipping) - $order_discount), 4);
    //         $rounding = 0;
    //         if ($this->pos_settings->rounding) {
    //             $round_total = $this->sma->roundNumber($grand_total, $this->pos_settings->rounding);
    //             $rounding = $this->sma->formatMoney($round_total - $grand_total);
    //         }
    //         $data = array('date'              => $date,
    //                       'reference_no'      => $reference,
    //                       'customer_id'       => $customer_id,
    //                       'customer'          => $customer,
    //                       'biller_id'         => $biller_id,
    //                       'biller'            => $biller,
    //                       'warehouse_id'      => $warehouse_id,
    //                       'note'              => $note,
    //                       'staff_note'        => $staff_note,
    //                       'total'             => $total,
    //                       'product_discount'  => $product_discount,
    //                       'order_discount_id' => $order_discount_id,
    //                       'order_discount'    => $order_discount,
    //                       'total_discount'    => $total_discount,
    //                       'product_tax'       => $product_tax,
    //                       'order_tax_id'      => $order_tax_id,
    //                       'order_tax'         => $order_tax,
    //                       'total_tax'         => $total_tax,
    //                       'shipping'          => $this->sma->formatDecimal($shipping),
    //                       'grand_total'       => $grand_total,
    //                       'total_items'       => $total_items,
    //                       'sale_status'       => $sale_status,
    //                       'payment_status'    => $payment_status,
    //                       'payment_term'      => $payment_term,
    //                       'rounding'          => $rounding,
    //                       'suspend_note'      => $this->input->post('suspend_note'),
    //                       'pos'               => 1,
    //                       'paid'              => $this->input->post('amount-paid') ? $this->input->post('amount-paid') : 0,
    //                       'created_by'        => $this->session->userdata('user_id'),
    //                       'hash'              => hash('sha256', microtime() . mt_rand()),
    //         );

    //         if (!$suspend) {
    //             $p = isset($_POST['amount']) ? sizeof($_POST['amount']) : 0;
    //             $paid = 0;
    //             for ($r = 0; $r < $p; $r++) {
    //                 if (isset($_POST['amount'][$r]) && !empty($_POST['amount'][$r]) && isset($_POST['paid_by'][$r]) && !empty($_POST['paid_by'][$r])) {
    //                     $amount = $this->sma->formatDecimal($_POST['balance_amount'][$r] > 0 ? $_POST['amount'][$r] - $_POST['balance_amount'][$r] : $_POST['amount'][$r]);
    //                     if ($_POST['paid_by'][$r] == 'deposit') {
    //                         if ( ! $this->site->check_customer_deposit($customer_id, $amount)) {
    //                             $this->session->set_flashdata('error', lang("amount_greater_than_deposit"));
    //                             redirect($_SERVER["HTTP_REFERER"]);
    //                         }
    //                     } 
    //                     if ($_POST['paid_by'][$r] == 'gift_card') {
    //                         $gc = $this->site->getGiftCardByNO($_POST['paying_gift_card_no'][$r]);
    //                         $amount_paying = $_POST['amount'][$r] >= $gc->balance ? $gc->balance : $_POST['amount'][$r];
    //                         $gc_balance = $gc->balance - $amount_paying;
    //                         $payment[] = array(
    //                             'date'         => $date,
    //                             // 'reference_no' => $this->site->getReference('pay'),
    //                             'amount'       => $amount,
    //                             'paid_by'      => $_POST['paid_by'][$r],
    //                             'cheque_no'    => $_POST['cheque_no'][$r],
    //                             'cc_no'        => $_POST['paying_gift_card_no'][$r],
    //                             'cc_holder'    => $_POST['cc_holder'][$r],
    //                             'cc_month'     => $_POST['cc_month'][$r],
    //                             'cc_year'      => $_POST['cc_year'][$r],
    //                             'cc_type'      => $_POST['cc_type'][$r],
    //                             'cc_cvv2'      => $_POST['cc_cvv2'][$r],
    //                             'created_by'   => $this->session->userdata('user_id'),
    //                             'type'         => 'received',
    //                             'note'         => $_POST['payment_note'][$r],
    //                             'pos_paid'     => $_POST['amount'][$r],
    //                             'pos_balance'  => $_POST['balance_amount'][$r],
    //                             'gc_balance'  => $gc_balance,
    //                             );

    //                     } else {
    //                         $payment[] = array(
    //                             'date'         => $date,
    //                             // 'reference_no' => $this->site->getReference('pay'),
    //                             'amount'       => $amount,
    //                             'paid_by'      => $_POST['paid_by'][$r],
    //                             'cheque_no'    => $_POST['cheque_no'][$r],
    //                             'cc_no'        => $_POST['cc_no'][$r],
    //                             'cc_holder'    => $_POST['cc_holder'][$r],
    //                             'cc_month'     => $_POST['cc_month'][$r],
    //                             'cc_year'      => $_POST['cc_year'][$r],
    //                             'cc_type'      => $_POST['cc_type'][$r],
    //                             'cc_cvv2'      => $_POST['cc_cvv2'][$r],
    //                             'created_by'   => $this->session->userdata('user_id'),
    //                             'type'         => 'received',
    //                             'note'         => $_POST['payment_note'][$r],
    //                             'pos_paid'     => $_POST['amount'][$r],
    //                             'pos_balance'  => $_POST['balance_amount'][$r],
    //                             );

    //                     }
 
    //                 }
    //             }
    //         }
    //         if (!isset($payment) || empty($payment)) {
    //             $payment = array();
    //         }

    //         // $this->sma->print_arrays($data, $products, $payment);
    //     }

    //     if ($this->form_validation->run() == TRUE && !empty($products) && !empty($data)) {
    //         if ($suspend) {
    //             if ($this->pos_model->suspendSale($data, $products, $did)) {
				// 	 $ip = $_SERVER['REMOTE_ADDR'];
				// 	$id = $this->session->userdata('user_id');

				// 	$this->db->query("INSERT INTO sma_logs (log_act, log_table, log_ip, log_user) VALUES ('Suspend Bill $did', 'sma_suspended_bill', '$ip', '$id')");
				
    //                 $this->session->set_userdata('remove_posls', 1);
    //                 $this->session->set_flashdata('message', $this->lang->line("sale_suspended"));
    //                 admin_redirect("pos");
    //             }
    //         } else {
    //             if ($sale = $this->pos_model->addSale($data, $products, $payment, $did)) {
				// 	$ip = $_SERVER['REMOTE_ADDR'];
				// 	$id = $this->session->userdata('user_id');

				// 	$this->db->query("INSERT INTO sma_logs (log_act, log_table, log_ip, log_user) VALUES ('Add Sale $did', 'sma_sale', '$ip', '$id')");
				
    //                 $this->session->set_userdata('remove_posls', 1);
    //                 $msg = $this->lang->line("sale_added");
    //                 if (!empty($sale['message'])) {
    //                     foreach ($sale['message'] as $m) {
    //                         $msg .= '<br>' . $m;
    //                     }
    //                 }
    //                 $this->session->set_flashdata('message', $msg);
    //                 $redirect_to = $this->pos_settings->after_sale_page ? "pos" : "pos/view/" . $sale['sale_id'];
    //                 if ($this->pos_settings->auto_print) {
    //                     if ($this->Settings->remote_printing != 1) {
    //                         $redirect_to .= '?print='.$sale['sale_id'];
    //                     }
    //                 }
    //                 // die;
    //                 admin_redirect($redirect_to);
    //             }
    //         }
    //     } else {
    //         $this->data['old_sale'] = NULL;
    //         $this->data['oid'] = NULL;
    //         if ($duplicate_sale) {
    //             if ($old_sale = $this->pos_model->getInvoiceByID($duplicate_sale)) {
    //                 $inv_items = $this->pos_model->getSaleItems($duplicate_sale);
    //                 $this->data['oid'] = $duplicate_sale;
    //                 $this->data['old_sale'] = $old_sale;
    //                 $this->data['message'] = lang('old_sale_loaded');
    //                 $this->data['customer'] = $this->pos_model->getCompanyByID($old_sale->customer_id);
    //             } else {
    //                 $this->session->set_flashdata('error', lang("bill_x_found"));
    //                 admin_redirect("pos");
    //             }
    //         }
    //         $this->data['suspend_sale'] = NULL;
    //         if ($sid) {
    //             if ($suspended_sale = $this->pos_model->getOpenBillByID($sid)) {
    //                 $inv_items = $this->pos_model->getSuspendedSaleItems($sid);
    //                 $this->data['sid'] = $sid;
    //                 $this->data['suspend_sale'] = $suspended_sale;
    //                 $this->data['message'] = lang('suspended_sale_loaded');
    //                 $this->data['customer'] = $this->pos_model->getCompanyByID($suspended_sale->customer_id);
    //                 $this->data['reference_note'] = $suspended_sale->suspend_note;
    //             } else {
    //                 $this->session->set_flashdata('error', lang("bill_x_found"));
    //                 admin_redirect("pos");
    //             }
    //         }

    //         if (($sid || $duplicate_sale) && $inv_items) {
    //                 krsort($inv_items);
    //                 $c = rand(100000, 9999999);
    //                 foreach ($inv_items as $item) {
    //                     $row = $this->site->getProductByID($item->product_id);
    //                     if (!$row) {
    //                         $row = json_decode('{}');
    //                         $row->tax_method = 0;
    //                         $row->quantity = 0;
    //                     } else {
    //                         $category = $this->site->getCategoryByID($row->category_id);
    //                         $row->category_name = $category->name;
    //                         unset($row->cost, $row->details, $row->product_details, $row->image, $row->barcode_symbology, $row->cf1, $row->cf2, $row->cf3, $row->cf4, $row->cf5, $row->cf6, $row->supplier1price, $row->supplier2price, $row->cfsupplier3price, $row->supplier4price, $row->supplier5price, $row->supplier1, $row->supplier2, $row->supplier3, $row->supplier4, $row->supplier5, $row->supplier1_part_no, $row->supplier2_part_no, $row->supplier3_part_no, $row->supplier4_part_no, $row->supplier5_part_no);
    //                     }
    //                     $pis = $this->site->getPurchasedItems($item->product_id, $item->warehouse_id, $item->option_id);
    //                     if ($pis) {
    //                         foreach ($pis as $pi) {
    //                             $row->quantity += $pi->quantity_balance;
    //                         }
    //                     }
    //                     $row->id = $item->product_id;
    //                     $row->code = $item->product_code;
    //                     $row->name = $item->product_name;
    //                     $row->type = $item->product_type;            
    //                     $row->quantity += $item->quantity;
    //                     $row->discount = $item->discount ? $item->discount : '0';
    //                     $row->price = $this->sma->formatDecimal($item->net_unit_price + $this->sma->formatDecimal($item->item_discount / $item->quantity));
    //                     $row->unit_price = $row->tax_method ? $item->unit_price + $this->sma->formatDecimal($item->item_discount / $item->quantity) + $this->sma->formatDecimal($item->item_tax / $item->quantity) : $item->unit_price + ($item->item_discount / $item->quantity);
    //                     $row->real_unit_price = $item->real_unit_price;
    //                     $row->base_quantity = $item->quantity;
    //                     $row->base_unit = isset($row->unit) ? $row->unit : $item->product_unit_id;
    //                     $row->base_unit_price = $row->price ? $row->price : $item->unit_price;
    //                     $row->unit = $item->product_unit_id;
    //                     $row->qty = $item->unit_quantity;
    //                     $row->tax_rate = $item->tax_rate_id;
    //                     $row->serial = $item->serial_no;
    //                     $row->option = $item->option_id;
    //                     $options = $this->pos_model->getProductOptions($row->id, $item->warehouse_id);

    //                     if ($options) {
    //                         $option_quantity = 0;
    //                         foreach ($options as $option) {
    //                             $pis = $this->site->getPurchasedItems($row->id, $item->warehouse_id, $item->option_id);
    //                             if ($pis) {
    //                                 foreach ($pis as $pi) {
    //                                     $option_quantity += $pi->quantity_balance;
    //                                 }
    //                             }
    //                             if ($option->quantity > $option_quantity) {
    //                                 $option->quantity = $option_quantity;
    //                             }
    //                         }
    //                     }

    //                     $row->comment = isset($item->comment) ? $item->comment : '';
    //                     $row->ordered = 1;
    //                     $combo_items = false;
    //                     if ($row->type == 'combo') {
    //                         $combo_items = $this->pos_model->getProductComboItems($row->id, $item->warehouse_id);
    //                     }
    //                     $units = $this->site->getUnitsByBUID($row->base_unit);
    //                     $tax_rate = $this->site->getTaxRateByID($row->tax_rate);
    //                     $ri = $this->Settings->item_addition ? $row->id : $c;
                        
    //                     $pr[$ri] = array('id' => $c, 'item_id' => $row->id, 'label' => $row->name . " (" . $row->code . ")", 
    //                             'row' => $row, 'combo_items' => $combo_items, 'tax_rate' => $tax_rate, 'units' => $units, 'options' => $options);
    //                     $c++;
    //                 }

    //                 $this->data['items'] = json_encode($pr);
 
    //         } else {
    //             $this->data['customer'] = $this->pos_model->getCompanyByID($this->pos_settings->default_customer);
    //             $this->data['reference_note'] = NULL;
    //         }

    //         $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
    //         $this->data['message'] = isset($this->data['message']) ? $this->data['message'] : $this->session->flashdata('message');

    //         // $this->data['biller'] = $this->site->getCompanyByID($this->pos_settings->default_biller);
    //         $this->data['billers'] = $this->site->getAllCompanies('biller');
    //         $this->data['warehouses'] = $this->site->getAllWarehouses();
    //         $this->data['tax_rates'] = $this->site->getAllTaxRates();
    //         $this->data['user'] = $this->site->getUser();
    //         $this->data["tcp"] = $this->pos_model->products_count($this->pos_settings->default_category);
    //         $this->data['products'] = $this->ajaxproducts($this->pos_settings->default_category);
    //         $this->data['categories'] = $this->site->getAllCategories();
    //         $this->data['brands'] = $this->site->getAllBrands();
    //         $this->data['subcategories'] = $this->site->getSubCategories($this->pos_settings->default_category);
    //         $this->data['printer'] = $this->pos_model->getPrinterByID($this->pos_settings->printer);
    //         $order_printers = json_decode($this->pos_settings->order_printers);
    //         $printers = array();
    //         if (!empty($order_printers)) {
    //             foreach ($order_printers as $printer_id) {
    //                 $printers[] = $this->pos_model->getPrinterByID($printer_id);
    //             }
    //         }
    //         $this->data['order_printers'] = $printers;
    //         $this->data['pos_settings'] = $this->pos_settings;

    //         if ($this->pos_settings->after_sale_page && $saleid = $this->input->get('print', true)) {
    //             if ($inv = $this->pos_model->getInvoiceByID($saleid)) {
    //                 $this->load->helper('pos');
    //                 if (!$this->session->userdata('view_right')) {
    //                     $this->sma->view_rights($inv->created_by, true);
    //                 }
    //                 $this->data['rows'] = $this->pos_model->getAllInvoiceItems($inv->id);
    //                 $this->data['biller'] = $this->pos_model->getCompanyByID($inv->biller_id);
    //                 $this->data['customer'] = $this->pos_model->getCompanyByID($inv->customer_id);
    //                 $this->data['payments'] = $this->pos_model->getInvoicePayments($inv->id);
    //                 $this->data['return_sale'] = $inv->return_id ? $this->pos_model->getInvoiceByID($inv->return_id) : NULL;
    //                 $this->data['return_rows'] = $inv->return_id ? $this->pos_model->getAllInvoiceItems($inv->return_id) : NULL;
    //                 $this->data['return_payments'] = $this->data['return_sale'] ? $this->pos_model->getInvoicePayments($this->data['return_sale']->id) : NULL;
    //                 $this->data['inv'] = $inv;
    //                 $this->data['print'] = $inv->id;
    //                 $this->data['created_by'] = $this->site->getUser($inv->created_by);
    //             }
    //         }

    //         $this->load->view($this->theme . 'pos/add', $this->data);
    //     }
    // }
    
    public function index($sid = NULL)
    {
      // $this->sma->print_arrays($_POST);
      // die;
        $this->sma->checkPermissions();

        if (!$this->pos_settings->default_biller || !$this->pos_settings->default_customer || !$this->pos_settings->default_category) {
            $this->session->set_flashdata('warning', lang('please_update_settings'));
            admin_redirect('pos/settings');
        }
        if ($register = $this->pos_model->registerData($this->session->userdata('user_id'))) {
            $register_data = array('register_id' => $register->id, 'cash_in_hand' => $register->cash_in_hand, 'register_open_time' => $register->date);
            $this->session->set_userdata($register_data);
        } else {
            $this->session->set_flashdata('error', lang('register_not_open'));
            admin_redirect('pos/open_register');
        }

        $this->data['sid'] = $this->input->get('suspend_id') ? $this->input->get('suspend_id') : $sid;
        $did = $this->input->post('delete_id') ? $this->input->post('delete_id') : NULL;
        $suspend = $this->input->post('suspend') ? TRUE : FALSE;
        $count = $this->input->post('count') ? $this->input->post('count') : NULL;

        $duplicate_sale = $this->input->get('duplicate') ? $this->input->get('duplicate') : NULL;

        //validate form input
        $this->form_validation->set_rules('customer', $this->lang->line("customer"), 'trim|required');
        $this->form_validation->set_rules('warehouse', $this->lang->line("warehouse"), 'required');
        $this->form_validation->set_rules('biller', $this->lang->line("biller"), 'required');

        if ($this->form_validation->run() == TRUE) {
            $cart = $this->session->userdata("cart");
            unset($cart[$this->input->post("cart")]);
            $this->session->set_userdata("cart", $cart);

            $date = date('Y-m-d H:i:s');
            $warehouse_id = $this->input->post('warehouse');
            $customer_id = $this->input->post('customer');
            $biller_id = $this->input->post('biller');
            $total_items = $this->input->post('total_items');
            $sale_status = 'completed';
            $payment_status = 'due';
            $payment_term = 0;
            $due_date = date('Y-m-d', strtotime('+' . $payment_term . ' days'));
            $shipping = $this->input->post('shipping') ? $this->input->post('shipping') : 0;
            $customer_details = $this->site->getCompanyByID($customer_id);
            $customer = $customer_details->company != '-'  ? $customer_details->company : $customer_details->name;
            $biller_details = $this->site->getCompanyByID($biller_id);
            $biller = $biller_details->company != '-' ? $biller_details->company : $biller_details->name;
            $note = $this->sma->clear_tags($this->input->post('pos_note'));
            $staff_note = $this->sma->clear_tags($this->input->post('staff_note'));
            $reference = $this->site->getReference('pos');

            $total = 0;
            $product_tax = 0;
            $order_tax = 0;
            $product_discount = 0;
            $order_discount = 0;
            $percentage = '%';
            $digital = FALSE;
            $i = isset($_POST['product_code']) ? sizeof($_POST['product_code']) : 0;
            for ($r = 0; $r < $i; $r++) {
                $item_id = $_POST['product_id'][$r];
                $item_type = $_POST['product_type'][$r];
                $item_code = $_POST['product_code'][$r];
                $item_name = $_POST['product_name'][$r];
                $item_comment = $_POST['product_comment'][$r];
                $item_option = isset($_POST['product_option'][$r]) && $_POST['product_option'][$r] != 'false' ? $_POST['product_option'][$r] : NULL;
                $real_unit_price = $this->sma->formatDecimal($_POST['real_unit_price'][$r]);
                $unit_price = $this->sma->formatDecimal($_POST['unit_price'][$r]);
                $item_unit_quantity = $_POST['quantity'][$r];
                $item_serial = isset($_POST['serial'][$r]) ? $_POST['serial'][$r] : '';
                $item_tax_rate = isset($_POST['product_tax'][$r]) ? $_POST['product_tax'][$r] : NULL;
                $item_discount = isset($_POST['product_discount'][$r]) ? $_POST['product_discount'][$r] : NULL;
                $item_unit = $_POST['product_unit'][$r];
                $item_quantity = $_POST['product_base_quantity'][$r];

                if (isset($item_code) && isset($real_unit_price) && isset($unit_price) && isset($item_quantity)) {
                    $product_details = $item_type != 'manual' ? $this->pos_model->getProductByCode($item_code) : NULL;
                    // $unit_price = $real_unit_price;
                    $pr_discount = 0;
                    if ($item_type == 'digital') {
                        $digital = TRUE;
                    }

                    if (isset($item_discount)) {
                        $discount = $item_discount;
                        $dpos = strpos($discount, $percentage);
                        if ($dpos !== FALSE) {
                            $pds = explode("%", $discount);
                            $pr_discount = $this->sma->formatDecimal(((($this->sma->formatDecimal($unit_price)) * (Float)($pds[0])) / 100), 4);
                        } else {
                            $pr_discount = $this->sma->formatDecimal($discount);
                        }
                    }

                    $unit_price = $this->sma->formatDecimal($unit_price - $pr_discount);
                    $item_net_price = $unit_price;
                    $pr_item_discount = $this->sma->formatDecimal($pr_discount * $item_unit_quantity);
                    $product_discount += $pr_item_discount;
                    $pr_item_tax = 0;
                    $item_tax = 0;
                    $tax = "";

                    if (isset($item_tax_rate) && $item_tax_rate != 0) {
   
                        $tax_details = $this->site->getTaxRateByID($item_tax_rate);
                        $ctax = $this->site->calculateTax($product_details, $tax_details, $unit_price);
                        $item_tax = $ctax['amount'];
                        $tax = $ctax['tax'];
                        if (!empty($product_details) && $product_details->tax_method != 1) {
                            $item_net_price = $unit_price - $item_tax;
                        }
                        $pr_item_tax = $this->sma->formatDecimal(($item_tax * $item_unit_quantity), 4);

                    }

                    $product_tax += $pr_item_tax;
                    $subtotal = (($item_net_price * $item_unit_quantity) + $pr_item_tax);
                    $unit = $this->site->getUnitByID($item_unit);
        
                    $products[] = array(
                        'product_id'      => $item_id,
                        'product_code'    => $item_code,
                        'product_name'    => $item_name,
                        'product_type'    => $item_type,
                        'option_id'       => $item_option,
                        'net_unit_price'  => $item_net_price,
                        'unit_price'      => $this->sma->formatDecimal($item_net_price + $item_tax),
                        'quantity'        => $item_quantity,
                        'product_unit_id' => $unit ? $unit->id : NULL,
                        'product_unit_code' => $unit ? $unit->code : NULL,
                        'unit_quantity' => $item_unit_quantity,
                        'warehouse_id'    => $warehouse_id,
                        'item_tax'        => $pr_item_tax,
                        'tax_rate_id'     => $item_tax_rate,
                        'tax'             => $tax,
                        'discount'        => $item_discount,
                        'item_discount'   => $pr_item_discount,
                        'subtotal'        => $this->sma->formatDecimal($subtotal),
                        'serial_no'       => $item_serial,
                        'real_unit_price' => $real_unit_price,
                        'comment'         => $item_comment,
                    );
                    // var_dump($item_id);die;
                    // SAMUEL
                    $get_discount_product = $this->sales_model->getDiscount($item_id, $this->input->post("amount")[0]);
                    if (!empty($get_discount_product)) {
                        
                        // LOOP DISCOUNT YANG DIDAPAT ATAS ITEM PRODUCT
                        foreach ($get_discount_product as $key_discount_product => $value_discount_product) {
                          // IF DISCOUNT == FREE ITEM, ADD TO SALES_ITEM
                          if (count($value_discount_product->free_item_id) == 1) {
                              
                              $get_product = $this->site->getProductByID($value_discount_product->free_item_id);
                            //   echo "<pre>";
                            //   print_r($products);
                            //   echo "</pre>";
                              // $this->sma->print_arrays($get_product);
                              $products[] = array(
                                  'product_id'      => $get_product->id,
                                  'product_code'    => $get_product->code,
                                  'product_name'    => $get_product->name,
                                  'product_type'    => $get_product->type,
                                  'option_id'       => "",
                                  'net_unit_price'  => 0,
                                  'unit_price'      => 0,
                                  'quantity'        => 1,
                                  'product_unit_id' => $get_product->unit,
                                  'product_unit_code' => "",
                                  'unit_quantity' => 1,
                                  'warehouse_id'    => $warehouse_id,
                                  'item_tax'        => 0,
                                  'tax_rate_id'     => 0,
                                  'tax'             => 0,
                                  'discount'        => 0,
                                  'item_discount'   => 0,
                                  'subtotal'        => 0,
                                  'serial_no'       => "",
                                  'real_unit_price' => 0,
                                  'comment'         => "",
                              );
                          }
                        }
                    }
                    // echo "<pre>";
                    // print_r($products);
                    // echo "</pre>";
                    // die;
                    // echo $this->db->last_query();die;
                    // echo "<pre>";
                    // print_r($get_discount_product);
                    // echo "</pre>";

                    $total += $this->sma->formatDecimal(($item_net_price * $item_unit_quantity), 4);
                }
            }
            if (empty($products)) {
                $this->form_validation->set_rules('product', lang("order_items"), 'required');
            } elseif ($this->pos_settings->item_order == 1) {
                krsort($products);
            }

            if ($this->input->post('discount')) {
                $order_discount_id = $this->input->post('discount');
                $opos = strpos($order_discount_id, $percentage);
                if ($opos !== FALSE) {
                    $ods = explode("%", $order_discount_id);
                    $order_discount = $this->sma->formatDecimal(((($total + $product_tax) * (Float)($ods[0])) / 100), 4);
                } else {
                    $order_discount = $this->sma->formatDecimal($order_discount_id);
                }
            } else {
                $order_discount_id = NULL;
            }
            $total_discount = $this->sma->formatDecimal($order_discount + $product_discount);

            if ($this->Settings->tax2) {
                $order_tax_id = $this->input->post('order_tax');
                if ($order_tax_details = $this->site->getTaxRateByID($order_tax_id)) {
                    if ($order_tax_details->type == 2) {
                        $order_tax = $this->sma->formatDecimal($order_tax_details->rate);
                    }
                    if ($order_tax_details->type == 1) {
                        $order_tax = $this->sma->formatDecimal(((($total + $product_tax - $order_discount) * $order_tax_details->rate) / 100), 4);
                    }
                }
            } else {
                $order_tax_id = NULL;
            }

            $total_tax = $this->sma->formatDecimal(($product_tax + $order_tax), 4); 
            $grand_total = $this->sma->formatDecimal(($total + $total_tax + $this->sma->formatDecimal($shipping) - $order_discount), 4);
            $rounding = 0;
            if ($this->pos_settings->rounding) {
                $round_total = $this->sma->roundNumber($grand_total, $this->pos_settings->rounding);
                $rounding = $this->sma->formatMoney($round_total - $grand_total);
            }
            // var_dump($grand_total);die;
            $data = array('date'              => $date,
                          'reference_no'      => $reference,
                          'customer_id'       => $customer_id,
                          'customer'          => $customer,
                          'biller_id'         => $biller_id,
                          'biller'            => $biller,
                          'warehouse_id'      => $warehouse_id,
                          'note'              => $note,
                          'staff_note'        => $staff_note,
                          'total'             => $total,
                          'product_discount'  => $product_discount,
                          'order_discount_id' => $order_discount_id,
                          'order_discount'    => $order_discount,
                          'total_discount'    => $total_discount,
                          'product_tax'       => $product_tax,
                          'order_tax_id'      => $order_tax_id,
                          'order_tax'         => $order_tax,
                          'total_tax'         => $total_tax,
                          'shipping'          => $this->sma->formatDecimal($shipping),
                          'grand_total'       => $grand_total,
                          'total_items'       => $total_items,
                          'sale_status'       => $sale_status,
                          'payment_status'    => $payment_status,
                          'payment_term'      => $payment_term,
                          'rounding'          => $rounding,
                          'suspend_note'      => $this->input->post('suspend_note'),
                          'pos'               => 1,
                          'paid'              => $this->input->post('amount-paid') ? $this->input->post('amount-paid') : 0,
                          'created_by'        => $this->session->userdata('user_id'),
                          'hash'              => hash('sha256', microtime() . mt_rand()),
            );

            if (!$suspend) {
              // echo "<pre>";
              // print_r($_POST);
              // echo "</pre>";
                $p = isset($_POST['amount']) ? sizeof($_POST['amount']) : 0;
                // var_dump($p);die;
                $paid = 0;
                for ($r = 0; $r < $p; $r++) {
                    if (isset($_POST['amount'][$r]) && !empty($_POST['amount'][$r]) && isset($_POST['paid_by'][$r]) && !empty($_POST['paid_by'][$r])) {
                        $amount = $this->sma->formatDecimal($_POST['balance_amount'][$r] > 0 ? $_POST['amount'][$r] - $_POST['balance_amount'][$r] : $_POST['amount'][$r]);
                        if ($_POST['paid_by'][$r] == 'deposit') {
                            if ( ! $this->site->check_customer_deposit($customer_id, $amount)) {
                                $this->session->set_flashdata('error', lang("amount_greater_than_deposit"));
                                redirect($_SERVER["HTTP_REFERER"]);
                            }
                        } 
                        if ($_POST['paid_by'][$r] == 'gift_card') {
                            $gc = $this->site->getGiftCardByNO($_POST['paying_gift_card_no'][$r]);
                            $amount_paying = $_POST['amount'][$r] >= $gc->balance ? $gc->balance : $_POST['amount'][$r];
                            $gc_balance = $gc->balance - $amount_paying;
                            $payment[] = array(
                                'date'         => $date,
                                // 'reference_no' => $this->site->getReference('pay'),
                                'amount'       => $amount,
                                'paid_by'      => $_POST['paid_by'][$r],
                                'cheque_no'    => $_POST['cheque_no'][$r],
                                'cc_no'        => $_POST['paying_gift_card_no'][$r],
                                'cc_holder'    => $_POST['cc_holder'][$r],
                                'cc_month'     => $_POST['cc_month'][$r],
                                'cc_year'      => $_POST['cc_year'][$r],
                                'cc_type'      => $_POST['cc_type'][$r],
                                'cc_cvv2'      => $_POST['cc_cvv2'][$r],
                                'created_by'   => $this->session->userdata('user_id'),
                                'type'         => 'received',
                                'note'         => $_POST['payment_note'][$r],
                                'pos_paid'     => $_POST['amount'][$r],
                                'pos_balance'  => $_POST['balance_amount'][$r],
                                'gc_balance'  => $gc_balance,
                                );

                        } else {
                            $payment[] = array(
                                'date'         => $date,
                                // 'reference_no' => $this->site->getReference('pay'),
                                'amount'       => $amount,
                                'paid_by'      => $_POST['paid_by'][$r],
                                'cheque_no'    => $_POST['cheque_no'][$r],
                                'cc_no'        => $_POST['cc_no'][$r],
                                'cc_holder'    => $_POST['cc_holder'][$r],
                                'cc_month'     => $_POST['cc_month'][$r],
                                'cc_year'      => $_POST['cc_year'][$r],
                                'cc_type'      => $_POST['cc_type'][$r],
                                'cc_cvv2'      => $_POST['cc_cvv2'][$r],
                                'created_by'   => $this->session->userdata('user_id'),
                                'type'         => 'received',
                                'note'         => $_POST['payment_note'][$r],
                                'pos_paid'     => $_POST['amount'][$r],
                                'pos_balance'  => $_POST['balance_amount'][$r],
                                );

                        }
 
                    }
                }
            }
            if (!isset($payment) || empty($payment)) {
                $payment = array();
            }

            // $this->sma->print_arrays($data, $products, $payment);
        }
        // die;
        if ($this->form_validation->run() == TRUE && !empty($products) && !empty($data)) {
            if ($suspend) {
                if ($this->pos_model->suspendSale($data, $products, $did)) {
                     $ip = $_SERVER['REMOTE_ADDR'];
                    $id = $this->session->userdata('user_id');

                    $this->db->query("INSERT INTO sma_logs (log_act, log_table, log_ip, log_user) VALUES ('Suspend Bill $did', 'sma_suspended_bill', '$ip', '$id')");
                
                    $this->session->set_userdata('remove_posls', 1);
                    $this->session->set_flashdata('message', $this->lang->line("sale_suspended"));
                    admin_redirect("pos");
                }
            } else {
                if ($sale = $this->pos_model->addSale($data, $products, $payment, $did)) {
                    // echo "MASUK";die;
                    $ip = $_SERVER['REMOTE_ADDR'];
                    $id = $this->session->userdata('user_id');

                    $this->db->query("INSERT INTO sma_logs (log_act, log_table, log_ip, log_user) VALUES ('Add Sale $did', 'sma_sale', '$ip', '$id')");
                
                    $this->session->set_userdata('remove_posls', 1);
                    $msg = $this->lang->line("sale_added");
                    if (!empty($sale['message'])) {
                        foreach ($sale['message'] as $m) {
                            $msg .= '<br>' . $m;
                        }
                    }
                    $this->session->set_flashdata('message', $msg);
                    $redirect_to = $this->pos_settings->after_sale_page ? "pos" : "pos/view/" . $sale['sale_id'];
                    if ($this->pos_settings->auto_print) {
                        if ($this->Settings->remote_printing != 1) {
                            $redirect_to .= '?print='.$sale['sale_id'];
                        }
                    }
                    // die;
                    admin_redirect($redirect_to);
                }
            }
        } else {
            $this->data['old_sale'] = NULL;
            $this->data['oid'] = NULL;
            if ($duplicate_sale) {
                if ($old_sale = $this->pos_model->getInvoiceByID($duplicate_sale)) {
                    $inv_items = $this->pos_model->getSaleItems($duplicate_sale);
                    $this->data['oid'] = $duplicate_sale;
                    $this->data['old_sale'] = $old_sale;
                    $this->data['message'] = lang('old_sale_loaded');
                    $this->data['customer'] = $this->pos_model->getCompanyByID($old_sale->customer_id);
                } else {
                    $this->session->set_flashdata('error', lang("bill_x_found"));
                    admin_redirect("pos");
                }
            }
            $this->data['suspend_sale'] = NULL;
            if ($sid) {
                if ($suspended_sale = $this->pos_model->getOpenBillByID($sid)) {
                    $inv_items = $this->pos_model->getSuspendedSaleItems($sid);
                    $this->data['sid'] = $sid;
                    $this->data['suspend_sale'] = $suspended_sale;
                    $this->data['message'] = lang('suspended_sale_loaded');
                    $this->data['customer'] = $this->pos_model->getCompanyByID($suspended_sale->customer_id);
                    $this->data['reference_note'] = $suspended_sale->suspend_note;
                } else {
                    $this->session->set_flashdata('error', lang("bill_x_found"));
                    admin_redirect("pos");
                }
            }

            if (($sid || $duplicate_sale) && $inv_items) {
                    krsort($inv_items);
                    $c = rand(100000, 9999999);
                    foreach ($inv_items as $item) {
                        $row = $this->site->getProductByID($item->product_id);
                        if (!$row) {
                            $row = json_decode('{}');
                            $row->tax_method = 0;
                            $row->quantity = 0;
                        } else {
                            $category = $this->site->getCategoryByID($row->category_id);
                            $row->category_name = $category->name;
                            unset($row->cost, $row->details, $row->product_details, $row->image, $row->barcode_symbology, $row->cf1, $row->cf2, $row->cf3, $row->cf4, $row->cf5, $row->cf6, $row->supplier1price, $row->supplier2price, $row->cfsupplier3price, $row->supplier4price, $row->supplier5price, $row->supplier1, $row->supplier2, $row->supplier3, $row->supplier4, $row->supplier5, $row->supplier1_part_no, $row->supplier2_part_no, $row->supplier3_part_no, $row->supplier4_part_no, $row->supplier5_part_no);
                        }
                        $pis = $this->site->getPurchasedItems($item->product_id, $item->warehouse_id, $item->option_id);
                        if ($pis) {
                            foreach ($pis as $pi) {
                                $row->quantity += $pi->quantity_balance;
                            }
                        }
                        $row->id = $item->product_id;
                        $row->code = $item->product_code;
                        $row->name = $item->product_name;
                        $row->type = $item->product_type;            
                        $row->quantity += $item->quantity;
                        $row->discount = $item->discount ? $item->discount : '0';
                        $row->price = $this->sma->formatDecimal($item->net_unit_price + $this->sma->formatDecimal($item->item_discount / $item->quantity));
                        $row->unit_price = $row->tax_method ? $item->unit_price + $this->sma->formatDecimal($item->item_discount / $item->quantity) + $this->sma->formatDecimal($item->item_tax / $item->quantity) : $item->unit_price + ($item->item_discount / $item->quantity);
                        $row->real_unit_price = $item->real_unit_price;
                        $row->base_quantity = $item->quantity;
                        $row->base_unit = isset($row->unit) ? $row->unit : $item->product_unit_id;
                        $row->base_unit_price = $row->price ? $row->price : $item->unit_price;
                        $row->unit = $item->product_unit_id;
                        $row->qty = $item->unit_quantity;
                        $row->tax_rate = $item->tax_rate_id;
                        $row->serial = $item->serial_no;
                        $row->option = $item->option_id;
                        $options = $this->pos_model->getProductOptions($row->id, $item->warehouse_id);

                        if ($options) {
                            $option_quantity = 0;
                            foreach ($options as $option) {
                                $pis = $this->site->getPurchasedItems($row->id, $item->warehouse_id, $item->option_id);
                                if ($pis) {
                                    foreach ($pis as $pi) {
                                        $option_quantity += $pi->quantity_balance;
                                    }
                                }
                                if ($option->quantity > $option_quantity) {
                                    $option->quantity = $option_quantity;
                                }
                            }
                        }

                        $row->comment = isset($item->comment) ? $item->comment : '';
                        $row->ordered = 1;
                        $combo_items = false;
                        if ($row->type == 'combo') {
                            $combo_items = $this->pos_model->getProductComboItems($row->id, $item->warehouse_id);
                        }
                        $units = $this->site->getUnitsByBUID($row->base_unit);
                        $tax_rate = $this->site->getTaxRateByID($row->tax_rate);
                        $ri = $this->Settings->item_addition ? $row->id : $c;
                        
                        $pr[$ri] = array('id' => $c, 'item_id' => $row->id, 'label' => $row->name . " (" . $row->code . ")", 
                                'row' => $row, 'combo_items' => $combo_items, 'tax_rate' => $tax_rate, 'units' => $units, 'options' => $options);
                        $c++;
                    }

                    $this->data['items'] = json_encode($pr);
 
            } else {
                $this->data['customer'] = $this->pos_model->getCompanyByID($this->pos_settings->default_customer);
                $this->data['reference_note'] = NULL;
            }

            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $this->data['message'] = isset($this->data['message']) ? $this->data['message'] : $this->session->flashdata('message');

            // $this->data['biller'] = $this->site->getCompanyByID($this->pos_settings->default_biller);
            $this->data['billers'] = $this->site->getAllCompanies('biller');
            $this->data['warehouses'] = $this->site->getAllWarehouses();
            $this->data['tax_rates'] = $this->site->getAllTaxRates();
            $this->data['user'] = $this->site->getUser();
            $this->data["tcp"] = $this->pos_model->products_count($this->pos_settings->default_category);
            $this->data['products'] = $this->ajaxproducts($this->pos_settings->default_category);
            $this->data['categories'] = $this->site->getAllCategories();
            $this->data['brands'] = $this->site->getAllBrands();
            $this->data['subcategories'] = $this->site->getSubCategories($this->pos_settings->default_category);
            $this->data['printer'] = $this->pos_model->getPrinterByID($this->pos_settings->printer);
            $order_printers = json_decode($this->pos_settings->order_printers);
            $printers = array();
            if (!empty($order_printers)) {
                foreach ($order_printers as $printer_id) {
                    $printers[] = $this->pos_model->getPrinterByID($printer_id);
                }
            }
            $this->data['order_printers'] = $printers;
            $this->data['pos_settings'] = $this->pos_settings;

            if ($this->pos_settings->after_sale_page && $saleid = $this->input->get('print', true)) {
                if ($inv = $this->pos_model->getInvoiceByID($saleid)) {
                    $this->load->helper('pos');
                    if (!$this->session->userdata('view_right')) {
                        $this->sma->view_rights($inv->created_by, true);
                    }
                    $this->data['rows'] = $this->pos_model->getAllInvoiceItems($inv->id);
                    $this->data['biller'] = $this->pos_model->getCompanyByID($inv->biller_id);
                    $this->data['customer'] = $this->pos_model->getCompanyByID($inv->customer_id);
                    $this->data['payments'] = $this->pos_model->getInvoicePayments($inv->id);
                    $this->data['return_sale'] = $inv->return_id ? $this->pos_model->getInvoiceByID($inv->return_id) : NULL;
                    $this->data['return_rows'] = $inv->return_id ? $this->pos_model->getAllInvoiceItems($inv->return_id) : NULL;
                    $this->data['return_payments'] = $this->data['return_sale'] ? $this->pos_model->getInvoicePayments($this->data['return_sale']->id) : NULL;
                    $this->data['inv'] = $inv;
                    $this->data['print'] = $inv->id;
                    $this->data['created_by'] = $this->site->getUser($inv->created_by);
                }
            }

            $this->load->view($this->theme . 'pos/add', $this->data);
            // $this->load->view($this->theme . 'footer');
        }
    }
    public function view_bill()
    {
        $this->sma->checkPermissions('index');
        $this->data['tax_rates'] = $this->site->getAllTaxRates();
        $this->load->view($this->theme . 'pos/view_bill', $this->data);
    }

    public function save_barcode($text = null, $bcs = 'code128', $height = 56, $stext = 1, $get_be = false)
    {
        $drawText = ($stext != 1) ? false : true;
        $this->load->library('zend');
        $this->zend->load('Zend/Barcode');
        $barcodeOptions = array('text' => $text, 'barHeight' => $height, 'drawText' => $drawText, 'factor' => ($get_be ? 2 : 1));
        if ($this->Settings->barcode_img && $get_be) {
            $rendererOptions = array('imageType' => 'jpg', 'horizontalPosition' => 'center', 'verticalPosition' => 'middle');
            $imageResource = Zend_Barcode::draw($bcs, 'image', $barcodeOptions, $rendererOptions);
            ob_start();
            imagepng($imageResource);
            $imagedata = ob_get_contents();
            ob_end_clean();
            if ($get_be) {
                echo 'data:image/png;base64,'.base64_encode($imagedata);
            }
            echo "<img src='data:image/png;base64,".base64_encode($imagedata)."' alt='{$text}' class='bcimg' />";
        } else {
            $rendererOptions = array('renderer' => 'svg', 'horizontalPosition' => 'center', 'verticalPosition' => 'middle');
            // $imageResource = Zend_Barcode::render($bcs, 'svg', $barcodeOptions, $rendererOptions);
            // echo $imageResource;
            ob_start();
            Zend_Barcode::render($bcs, 'svg', $barcodeOptions, $rendererOptions);
            $imagedata = ob_get_contents();
            ob_end_clean();
            echo "<img src='data:image/svg+xml;base64,".base64_encode($imagedata)."' alt='{$text}' class='bcimg' />";
        }
        echo FALSE;
    }

    public function stripe_balance()
    {
        if (!$this->Owner) {
            return FALSE;
        }
        $this->load->admin_model('stripe_payments');

        return $this->stripe_payments->get_balance();
    }

    public function paypal_balance()
    {
        if (!$this->Owner) {
            return FALSE;
        }
        $this->load->admin_model('paypal_payments');

        return $this->paypal_payments->get_balance();
    }

    public function registers()
    {
        $this->sma->checkPermissions();

        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->data['registers'] = $this->pos_model->getOpenRegisters();
        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => admin_url('pos'), 'page' => lang('pos')), array('link' => '#', 'page' => lang('open_registers')));
        $meta = array('page_title' => lang('open_registers'), 'bc' => $bc);
        $this->page_construct('pos/registers', $meta, $this->data);
    }

    public function open_register()
    {
        $this->sma->checkPermissions('index');
        $this->form_validation->set_rules('cash_in_hand', lang("cash_in_hand"), 'trim|required|numeric');

        if ($this->form_validation->run() == TRUE) {
            $data = array(
                'date' => date('Y-m-d H:i:s'),
                'cash_in_hand' => $this->input->post('cash_in_hand'),
                'user_id'      => $this->session->userdata('user_id'),
                'status'       => 'open',
                );
        }
        if ($this->form_validation->run() == TRUE && $this->pos_model->openRegister($data)) {			
            $ip = $_SERVER['REMOTE_ADDR'];
            $id = $this->session->userdata('user_id');

            $this->db->query("INSERT INTO sma_logs (log_act, log_table, log_ip, log_user) VALUES ('Membuka POS Register', 'sma_pos_register', '$ip', '$id')");
		
            $this->session->set_flashdata('message', lang("welcome_to_pos"));
            admin_redirect("pos");
        } else {

            $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
            $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('open_register')));
            $meta = array('page_title' => lang('open_register'), 'bc' => $bc);
            $this->page_construct('pos/open_register', $meta, $this->data);
        }
    }

    public function close_register($user_id = NULL)
    {
        $this->sma->checkPermissions('index');
        if (!$this->Owner && !$this->Admin) {
            $user_id = $this->session->userdata('user_id');
        }
        $this->form_validation->set_rules('total_cash', lang("total_cash"), 'trim|required|numeric');
        $this->form_validation->set_rules('total_cheques', lang("total_cheques"), 'trim|required|numeric');
        $this->form_validation->set_rules('total_cc_slips', lang("total_cc_slips"), 'trim|required|numeric');

        if ($this->form_validation->run() == TRUE) {
            if ($this->Owner || $this->Admin) {
                $user_register = $user_id ? $this->pos_model->registerData($user_id) : NULL;
                $rid = $user_register ? $user_register->id : $this->session->userdata('register_id');
                $user_id = $user_register ? $user_register->user_id : $this->session->userdata('user_id');
            } else {
                $rid = $this->session->userdata('register_id');
                $user_id = $this->session->userdata('user_id');
            }
            $data = array(
                'closed_at'                => date('Y-m-d H:i:s'),
                'total_cash'               => $this->input->post('total_cash'),
                'total_cheques'            => $this->input->post('total_cheques'),
                'total_cc_slips'           => $this->input->post('total_cc_slips'),
                'total_cash_submitted'     => $this->input->post('total_cash_submitted'),
                'total_cheques_submitted'  => $this->input->post('total_cheques_submitted'),
                'total_cc_slips_submitted' => $this->input->post('total_cc_slips_submitted'),
                'note'                     => $this->input->post('note'),
                'status'                   => 'close',
                'transfer_opened_bills'    => $this->input->post('transfer_opened_bills'),
                'closed_by'                => $this->session->userdata('user_id'),
                );
        } elseif ($this->input->post('close_register')) {
            $this->session->set_flashdata('error', (validation_errors() ? validation_errors() : $this->session->flashdata('error')));
            admin_redirect("pos");
        }

        if ($this->form_validation->run() == TRUE && $this->pos_model->closeRegister($rid, $user_id, $data)) {
            $this->session->set_flashdata('message', lang("register_closed"));
			
			$ip = $_SERVER['REMOTE_ADDR'];
            $id = $this->session->userdata('user_id');

            $this->db->query("INSERT INTO sma_logs (log_act, log_table, log_ip, log_user) VALUES ('Menutup POS Register', 'sma_pos_register', '$ip', '$id')");
			
            admin_redirect("welcome");
        } else {
            if ($this->Owner || $this->Admin) {
                $user_register = $user_id ? $this->pos_model->registerData($user_id) : NULL;
                $register_open_time = $user_register ? $user_register->date : NULL;
                $this->data['cash_in_hand'] = $user_register ? $user_register->cash_in_hand : NULL;
                $this->data['register_open_time'] = $user_register ? $register_open_time : NULL;
            } else {
                $register_open_time = $this->session->userdata('register_open_time');
                $this->data['cash_in_hand'] = NULL;
                $this->data['register_open_time'] = NULL;
            }
            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $this->data['ccsales'] = $this->pos_model->getRegisterCCSales($register_open_time, $user_id);
            $this->data['cashsales'] = $this->pos_model->getRegisterCashSales($register_open_time, $user_id);
            $this->data["debitsales"] = $this->pos_model->getRegisterDebitSales($register_open_time, $user_id);
            $this->data['chsales'] = $this->pos_model->getRegisterChSales($register_open_time, $user_id);
            // echo $this->db->last_query();die;
            $this->data['gcsales'] = $this->pos_model->getRegisterGCSales($register_open_time);
            $this->data['pppsales'] = $this->pos_model->getRegisterPPPSales($register_open_time, $user_id);
            $this->data['stripesales'] = $this->pos_model->getRegisterStripeSales($register_open_time, $user_id);
            $this->data['authorizesales'] = $this->pos_model->getRegisterAuthorizeSales($register_open_time, $user_id);
            $this->data['totalsales'] = $this->pos_model->getRegisterSales($register_open_time, $user_id);
            $this->data['refunds'] = $this->pos_model->getRegisterRefunds($register_open_time, $user_id);
            $this->data['cashrefunds'] = $this->pos_model->getRegisterCashRefunds($register_open_time, $user_id);
            $this->data['expenses'] = $this->pos_model->getRegisterExpenses($register_open_time, $user_id);
            $this->data['users'] = $this->pos_model->getUsers($user_id);
            $this->data['suspended_bills'] = $this->pos_model->getSuspendedsales($user_id);
            $this->data['user_id'] = $user_id;
            $this->data['modal_js'] = $this->site->modal_js();
            // $this->sma->print_arrays($this->data);
            $this->load->view($this->theme . 'pos/close_register', $this->data);
        }
    }

    public function getProductDataByCode($code = NULL, $warehouse_id = NULL)
    {
        $total_transaksi = str_replace(",", "", $this->input->get("total_transaksi"));
        $this->sma->checkPermissions('index');
        if ($this->input->get('code')) {
            $code = $this->input->get('code', TRUE);
        }
        if ($this->input->get('warehouse_id')) {
            $warehouse_id = $this->input->get('warehouse_id', TRUE);
        }
        if ($this->input->get('customer_id')) {
            $customer_id = $this->input->get('customer_id', TRUE);
        }
        if (!$code) {
            echo NULL;
            die();
        }
        $warehouse = $this->site->getWarehouseByID($warehouse_id);
        $customer = $this->site->getCompanyByID($customer_id);
        $customer_group = $this->site->getCustomerGroupByID($customer->customer_group_id);
        $row = $this->pos_model->getWHProduct($code, $warehouse_id);
        $option = false;
        if ($row) {
            unset($row->cost, $row->details, $row->product_details, $row->image, $row->barcode_symbology, $row->cf1, $row->cf2, $row->cf3, $row->cf4, $row->cf5, $row->cf6, $row->supplier1price, $row->supplier2price, $row->cfsupplier3price, $row->supplier4price, $row->supplier5price, $row->supplier1, $row->supplier2, $row->supplier3, $row->supplier4, $row->supplier5, $row->supplier1_part_no, $row->supplier2_part_no, $row->supplier3_part_no, $row->supplier4_part_no, $row->supplier5_part_no);
            $row->item_tax_method = $row->tax_method;
            $row->qty = 1;
            $row->discount = '0';
            $row->serial = '';
            $options = $this->pos_model->getProductOptions($row->id, $warehouse_id);
            if ($options) {
                $opt = current($options);
                if (!$option) {
                    $option = $opt->id;
                }
            } else {
                $opt = json_decode('{}');
                $opt->price = 0;
            }
            $row->option = $option;
            $row->quantity = 0;
            $pis = $this->site->getPurchasedItems($row->id, $warehouse_id, $row->option);
            if ($pis) {
                foreach ($pis as $pi) {
                    $row->quantity += $pi->quantity_balance;
                }
            }
            if ($row->type == 'standard' && (!$this->Settings->overselling && $row->quantity < 1)) {
                echo NULL; die();
            }
            if ($options) {
                $option_quantity = 0;
                foreach ($options as $option) {
                    $pis = $this->site->getPurchasedItems($row->id, $warehouse_id, $row->option);
                    if ($pis) {
                        foreach ($pis as $pi) {
                            $option_quantity += $pi->quantity_balance;
                        }
                    }
                    if ($option->quantity > $option_quantity) {
                        $option->quantity = $option_quantity;
                    }
                }
            }
            if ($row->promotion) {
                $row->price = $row->promo_price;
            } elseif ($customer->price_group_id) {
                if ($pr_group_price = $this->site->getProductGroupPrice($row->id, $customer->price_group_id)) {
                    $row->price = $pr_group_price->price;
                }
            } elseif ($warehouse->price_group_id) {
                if ($pr_group_price = $this->site->getProductGroupPrice($row->id, $warehouse->price_group_id)) {
                    $row->price = $pr_group_price->price;
                }
            }
            $row->price = $row->price + (($row->price * $customer_group->percent) / 100);
        
            $row->real_unit_price = $row->price;
            $save_price = $row->price;
            // echo $save_price;die;
            $total_transaksi += $save_price;
            // $sql = "select discount, free_item_id from sma_product_discounts where current_date between start_date and end_date and (product_id =$row->id or product_id = -1) and status = 1 ";
            // $rx = $this->db->query($sql)->result();
            $rx = $this->sales_model->getDiscount($row->id, $total_transaksi);
            foreach($rx as $rx2)
            {
               if($rx2->discount ) {
                $row->price = $row->price - ($row->price * $rx2->discount / 100);
              
                $row->name = $row->name . "<br/>(Normal Price : " . number_format( $row->real_unit_price) . ", Discount : $rx2->discount%)";
               }
               if($rx2->free_item_id)
               {
                   $sql2 = "select * from sma_products where id = $rx2->free_item_id limit 1";
                   $rx3 = $this->db->query($sql2)->result();
                   foreach($rx3 as $rx4)
                   {
                        $row->name = $row->name . "<br/>(Free Item : $rx4->name)";
                   }
                    
               }
            }
            $row->real_unit_price = $row->price;
            $row->price = $save_price;
         
            
            $row->base_quantity = 1;
            $row->base_unit = $row->unit;
            $row->base_unit_price = $row->price;
            $row->unit = $row->sale_unit ? $row->sale_unit : $row->unit;
            $row->comment = '';
            $combo_items = false;
            if ($row->type == 'combo') {
                $combo_items = $this->pos_model->getProductComboItems($row->id, $warehouse_id);
            }
            $units = $this->site->getUnitsByBUID($row->base_unit);
            $tax_rate = $this->site->getTaxRateByID($row->tax_rate);

            $pr = array('id' => str_replace(".", "", microtime(true)), 'item_id' => $row->id, 'label' => $row->name . " (" . $row->code . ")", 'category' => $row->category_id, 'row' => $row, 'combo_items' => $combo_items, 'tax_rate' => $tax_rate, 'units' => $units, 'options' => $options);

            $this->sma->send_json($pr);
        } else {
            echo NULL;
        }
    }

    public function ajaxproducts($category_id = NULL, $brand_id = NULL)
    {
        $this->sma->checkPermissions('index');
        if ($this->input->get('brand_id')) {
            $brand_id = $this->input->get('brand_id');
        }
        if ($this->input->get('category_id')) {
            $category_id = $this->input->get('category_id');
        } else {
            $category_id = $this->pos_settings->default_category;
        }
        if ($this->input->get('subcategory_id')) {
            $subcategory_id = $this->input->get('subcategory_id');
        } else {
            $subcategory_id = NULL;
        }
        if ($this->input->get('per_page') == 'n') {
            $page = 0;
        } else {
            $page = $this->input->get('per_page');
        }

        $this->load->library("pagination");

        $config = array();
        $config["base_url"] = base_url() . "pos/ajaxproducts";
        $config["total_rows"] = $this->pos_model->products_count($category_id, $subcategory_id, $brand_id);
        $config["per_page"] = $this->pos_settings->pro_limit;
        $config['prev_link'] = FALSE;
        $config['next_link'] = FALSE;
        $config['display_pages'] = FALSE;
        $config['first_link'] = FALSE;
        $config['last_link'] = FALSE;

        $this->pagination->initialize($config);

        $products = $this->pos_model->fetch_products($category_id, $config["per_page"], $page, $subcategory_id, $brand_id);
        $pro = 1;
        $prods = '<div>';
        if (!empty($products)) {
            foreach ($products as $product) {
                $count = $product->id;
                if ($count < 10) {
                    $count = "0" . ($count / 100) * 100;
                }
                if ($category_id < 10) {
                    $category_id = "0" . ($category_id / 100) * 100;
                }

                $prods .= "<button id=\"product-" . $category_id . $count . "\" type=\"button\" value='" . $product->code . "' title=\"" . $product->name . "\" class=\"btn-prni btn-" . $this->pos_settings->product_button_color . " product-add product pos-tip\" data-container=\"body\"><img src=\"" . base_url() . "assets/uploads/thumbs/" . $product->image . "\" alt=\"" . $product->name . "\" style='width:" . $this->Settings->twidth . "px;height:" . $this->Settings->theight . "px;' class='img-rounded' /><span>" . character_limiter($product->name, 40) . "</span></button>";

                $pro++;
            }
        }
        $prods .= "</div>";

        if ($this->input->get('per_page')) {
            echo $prods;
        } else {
            return $prods;
        }
    }

    public function ajaxcategorydata($category_id = NULL)
    {
        $this->sma->checkPermissions('index');
        if ($this->input->get('category_id')) {
            $category_id = $this->input->get('category_id');
        } else {
            $category_id = $this->pos_settings->default_category;
        }

        $subcategories = $this->site->getSubCategories($category_id);
        $scats = '';
        if ($subcategories) {
            foreach ($subcategories as $category) {
                $scats .= "<button id=\"subcategory-" . $category->id . "\" type=\"button\" value='" . $category->id . "' class=\"btn-prni subcategory\" ><img src=\"" . base_url() ."assets/uploads/thumbs/" . ($category->image ? $category->image : 'no_image.png') . "\" style='width:" . $this->Settings->twidth . "px;height:" . $this->Settings->theight . "px;' class='img-rounded img-thumbnail' /><span>" . $category->name . "</span></button>";
            }
        }

        $products = $this->ajaxproducts($category_id);

        if (!($tcp = $this->pos_model->products_count($category_id))) {
            $tcp = 0;
        }

        $this->sma->send_json(array('products' => $products, 'subcategories' => $scats, 'tcp' => $tcp));
    }

    public function ajaxbranddata($brand_id = NULL)
    {
        $this->sma->checkPermissions('index');
        if ($this->input->get('brand_id')) {
            $brand_id = $this->input->get('brand_id');
        }

        $products = $this->ajaxproducts(FALSE, $brand_id);

        if (!($tcp = $this->pos_model->products_count(FALSE, FALSE, $brand_id))) {
            $tcp = 0;
        }

        $this->sma->send_json(array('products' => $products, 'tcp' => $tcp));
    }

    /* ------------------------------------------------------------------------------------ */

    public function view($sale_id = NULL, $modal = NULL)
    {
        $this->sma->checkPermissions('index');
        if ($this->input->get('id')) {
            $sale_id = $this->input->get('id');
        }
        $this->load->helper('pos');
        $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
        $this->data['message'] = $this->session->flashdata('message');
        $inv = $this->pos_model->getInvoiceByID($sale_id);
        if (!$this->session->userdata('view_right')) {
            $this->sma->view_rights($inv->created_by, true);
        }
        $rs = $this->pos_model->getAllInvoiceItems($sale_id);
        
       /* foreach($rs as $row){
              $sql = "select discount, free_item_id from sma_product_discounts where current_date between start_date and end_date and (product_id =$row->id or product_id = -1) and status = 1 ";
           
                $rx = $this->db->query($sql)->result();
                foreach($rx as $rx2)
                {
                   if($rx2->discount ) {
                    $row->price = $row->price - ($row->price * $rx2->discount / 100);
                  
                    $row->name = $row->name . "<br/>(Normal Price : " . number_format( $row->real_unit_price) . ", Discount : $rx2->discount%)";
                   }
                   if($rx2->free_item_id)
                   {
                       $sql2 = "select * from sma_products where id = $rx2->free_item_id limit 1";
                       $rx3 = $this->db->query($sql2)->result();
                       foreach($rx3 as $rx4)
                       {
                            $row->name = $row->name . "<br/>(Free Item : $rx4->name)";
                       }
                        
                   }
                }
        }*/
      
        $this->data['rows'] = $rs;
        $biller_id = $inv->biller_id;
        $customer_id = $inv->customer_id;
        $this->data['biller'] = $this->pos_model->getCompanyByID($biller_id);
        $this->data['customer'] = $this->pos_model->getCompanyByID($customer_id);
        $this->data['payments'] = $this->pos_model->getInvoicePayments($sale_id);
        $this->data['pos'] = $this->pos_model->getSetting();
        $this->data['barcode'] = $this->barcode($inv->reference_no, 'code128', 30);
        $this->data['return_sale'] = $inv->return_id ? $this->pos_model->getInvoiceByID($inv->return_id) : NULL;
        $this->data['return_rows'] = $inv->return_id ? $this->pos_model->getAllInvoiceItems($inv->return_id) : NULL;
  
        
        $this->data['return_payments'] = $this->data['return_sale'] ? $this->pos_model->getInvoicePayments($this->data['return_sale']->id) : NULL;
        $this->data['inv'] = $inv;
        $this->data['sid'] = $sale_id;
        $this->data['modal'] = $modal;
        $this->data['created_by'] = $this->site->getUser($inv->created_by);
        $this->data['printer'] = $this->pos_model->getPrinterByID($this->pos_settings->printer);
        $this->data['page_title'] = $this->lang->line("invoice");
        $this->load->view($this->theme . 'pos/view', $this->data);
    }

    public function register_details()
    {
        $this->sma->checkPermissions('index');
        $register_open_time = $this->session->userdata('register_open_time');
        $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
        $this->data['ccsales'] = $this->pos_model->getRegisterCCSales($register_open_time);
        $this->data['cashsales'] = $this->pos_model->getRegisterCashSales($register_open_time);
        $this->data['chsales'] = $this->pos_model->getRegisterChSales($register_open_time);
        $this->data['gcsales'] = $this->pos_model->getRegisterGCSales($register_open_time);
        $this->data['pppsales'] = $this->pos_model->getRegisterPPPSales($register_open_time);
        $this->data['stripesales'] = $this->pos_model->getRegisterStripeSales($register_open_time);
        $this->data['authorizesales'] = $this->pos_model->getRegisterAuthorizeSales($register_open_time);
        $this->data['totalsales'] = $this->pos_model->getRegisterSales($register_open_time);
        $this->data['refunds'] = $this->pos_model->getRegisterRefunds($register_open_time);
        $this->data['expenses'] = $this->pos_model->getRegisterExpenses($register_open_time);
        $this->load->view($this->theme . 'pos/register_details', $this->data);
    }

    public function today_sale()
    {
        if (!$this->Owner && !$this->Admin) {
            $this->session->set_flashdata('error', lang('access_denied'));
            $this->sma->md();
        }

        $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
        $this->data['ccsales'] = $this->pos_model->getTodayCCSales();
        $this->data['cashsales'] = $this->pos_model->getTodayCashSales();
        $this->data['chsales'] = $this->pos_model->getTodayChSales();
        $this->data['pppsales'] = $this->pos_model->getTodayPPPSales();
        $this->data['stripesales'] = $this->pos_model->getTodayStripeSales();
        $this->data['authorizesales'] = $this->pos_model->getTodayAuthorizeSales();
        $this->data['totalsales'] = $this->pos_model->getTodaySales();
        $this->data['refunds'] = $this->pos_model->getTodayRefunds();
        $this->data['expenses'] = $this->pos_model->getTodayExpenses();
        $this->load->view($this->theme . 'pos/today_sale', $this->data);
    }

    public function check_pin()
    {
        $pin = $this->input->post('pw', TRUE);
        if ($pin == $this->pos_pin) {
            $this->sma->send_json(array('res' => 1));
        }
        $this->sma->send_json(array('res' => 0));
    }

    public function barcode($text = NULL, $bcs = 'code128', $height = 50)
    {
        return admin_url('products/gen_barcode/' . $text . '/' . $bcs . '/' . $height);
    }

    public function settings()
    {
        if (!$this->Owner) {
            $this->session->set_flashdata('error', lang('access_denied'));
            admin_redirect("welcome");
        }
        $this->form_validation->set_message('is_natural_no_zero', $this->lang->line('no_zero_required'));
        $this->form_validation->set_rules('pro_limit', $this->lang->line('pro_limit'), 'required|is_natural_no_zero');
        $this->form_validation->set_rules('pin_code', $this->lang->line('delete_code'), 'numeric');
        $this->form_validation->set_rules('category', $this->lang->line('default_category'), 'required|is_natural_no_zero');
        $this->form_validation->set_rules('customer', $this->lang->line('default_customer'), 'required|is_natural_no_zero');
        $this->form_validation->set_rules('biller', $this->lang->line('default_biller'), 'required|is_natural_no_zero');

        if ($this->form_validation->run() == TRUE) {

            $data = array(
                'pro_limit'                 => $this->input->post('pro_limit'),
                'pin_code'                  => $this->input->post('pin_code') ? $this->input->post('pin_code') : NULL,
                'default_category'          => $this->input->post('category'),
                'default_customer'          => $this->input->post('customer'),
                'default_biller'            => $this->input->post('biller'),
                'display_time'              => $this->input->post('display_time'),
                'receipt_printer'           => $this->input->post('receipt_printer'),
                'cash_drawer_codes'         => $this->input->post('cash_drawer_codes'),
                'cf_title1'                 => $this->input->post('cf_title1'),
                'cf_title2'                 => $this->input->post('cf_title2'),
                'cf_value1'                 => $this->input->post('cf_value1'),
                'cf_value2'                 => $this->input->post('cf_value2'),
                'focus_add_item'            => $this->input->post('focus_add_item'),
                'add_manual_product'        => $this->input->post('add_manual_product'),
                'customer_selection'        => $this->input->post('customer_selection'),
                'add_customer'              => $this->input->post('add_customer'),
                'toggle_category_slider'    => $this->input->post('toggle_category_slider'),
                'toggle_subcategory_slider' => $this->input->post('toggle_subcategory_slider'),
                'toggle_brands_slider'      => $this->input->post('toggle_brands_slider'),
                'cancel_sale'               => $this->input->post('cancel_sale'),
                'suspend_sale'              => $this->input->post('suspend_sale'),
                'print_items_list'          => $this->input->post('print_items_list'),
                'finalize_sale'             => $this->input->post('finalize_sale'),
                'today_sale'                => $this->input->post('today_sale'),
                'open_hold_bills'           => $this->input->post('open_hold_bills'),
                'close_register'            => $this->input->post('close_register'),
                'tooltips'                  => $this->input->post('tooltips'),
                'keyboard'                  => $this->input->post('keyboard'),
                'pos_printers'              => $this->input->post('pos_printers'),
                'java_applet'               => $this->input->post('enable_java_applet'),
                'product_button_color'      => $this->input->post('product_button_color'),
                'paypal_pro'                => $this->input->post('paypal_pro'),
                'stripe'                    => $this->input->post('stripe'),
                'authorize'                 => $this->input->post('authorize'),
                'rounding'                  => $this->input->post('rounding'),
                'item_order'                => $this->input->post('item_order'),
                'after_sale_page'           => $this->input->post('after_sale_page'),
                'printer'                   => $this->input->post('receipt_printer'),
                'order_printers'            => json_encode($this->input->post('order_printers')),
                'auto_print'                => $this->input->post('auto_print'),
                'remote_printing'           => DEMO ? 1 : $this->input->post('remote_printing'),
                'customer_details'          => $this->input->post('customer_details'),
                'local_printers'            => $this->input->post('local_printers'),
            );
            $payment_config = array(
                'APIUsername'            => $this->input->post('APIUsername'),
                'APIPassword'            => $this->input->post('APIPassword'),
                'APISignature'           => $this->input->post('APISignature'),
                'stripe_secret_key'      => $this->input->post('stripe_secret_key'),
                'stripe_publishable_key' => $this->input->post('stripe_publishable_key'),
                'api_login_id'           => $this->input->post('api_login_id'),
                'api_transaction_key'    => $this->input->post('api_transaction_key'),
            );
						
        } elseif ($this->input->post('update_settings')) {
            $this->session->set_flashdata('error', validation_errors());
            admin_redirect("pos/settings");
        }

        if ($this->form_validation->run() == TRUE && $this->pos_model->updateSetting($data)) {
            if (DEMO) {
                $this->session->set_flashdata('message', $this->lang->line('pos_setting_updated'));
                admin_redirect("pos/settings");
            }
            if ($this->write_payments_config($payment_config)) {
                $this->session->set_flashdata('message', $this->lang->line('pos_setting_updated'));
                admin_redirect("pos/settings");
            } else {
                $this->session->set_flashdata('error', $this->lang->line('pos_setting_updated_payment_failed'));
                admin_redirect("pos/settings");
            }
			
			$ip = $_SERVER['REMOTE_ADDR'];
            $id = $this->session->userdata('user_id');

            $this->db->query("INSERT INTO sma_logs (log_act, log_table, log_ip, log_user) VALUES ('Mengubah POS Setting', 'sma_pos_setting', '$ip', '$id')");
			
        } else {

            $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');

            $this->data['pos'] = $this->pos_model->getSetting();
            $this->data['categories'] = $this->site->getAllCategories();
            //$this->data['customer'] = $this->pos_model->getCompanyByID($this->pos_settings->default_customer);
            $this->data['billers'] = $this->pos_model->getAllBillerCompanies();
            $this->config->load('payment_gateways');
            $this->data['stripe_secret_key'] = $this->config->item('stripe_secret_key');
            $this->data['stripe_publishable_key'] = $this->config->item('stripe_publishable_key');
            $authorize = $this->config->item('authorize');
            $this->data['api_login_id'] = $authorize['api_login_id'];
            $this->data['api_transaction_key'] = $authorize['api_transaction_key'];
            $this->data['APIUsername'] = $this->config->item('APIUsername');
            $this->data['APIPassword'] = $this->config->item('APIPassword');
            $this->data['APISignature'] = $this->config->item('APISignature');
            $this->data['printers'] = $this->pos_model->getAllPrinters();
            $this->data['paypal_balance'] = NULL; // $this->pos_settings->paypal_pro ? $this->paypal_balance() : NULL;
            $this->data['stripe_balance'] = NULL; // $this->pos_settings->stripe ? $this->stripe_balance() : NULL;
            $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('pos_settings')));
            $meta = array('page_title' => lang('pos_settings'), 'bc' => $bc);
            $this->page_construct('pos/settings', $meta, $this->data);
        }
    }

    public function write_payments_config($config)
    {
        if (!$this->Owner) {
            $this->session->set_flashdata('error', lang('access_denied'));
            admin_redirect("welcome");
        }
        if (DEMO) {
            return TRUE;
        }
        $file_contents = file_get_contents('./assets/config_dumps/payment_gateways.php');
        $output_path = APPPATH . 'config/payment_gateways.php';
        $this->load->library('parser');
        $parse_data = array(
            'APIUsername'            => $config['APIUsername'],
            'APIPassword'            => $config['APIPassword'],
            'APISignature'           => $config['APISignature'],
            'stripe_secret_key'      => $config['stripe_secret_key'],
            'stripe_publishable_key' => $config['stripe_publishable_key'],
            'api_login_id'           => $config['api_login_id'],
            'api_transaction_key'    => $config['api_transaction_key'],
        );
        $new_config = $this->parser->parse_string($file_contents, $parse_data);

        $handle = fopen($output_path, 'w+');
        @chmod($output_path, 0777);

        if (is_writable($output_path)) {
            if (fwrite($handle, $new_config)) {
                @chmod($output_path, 0644);

                return TRUE;
            } else {
                return FALSE;
            }
        } else {
            return FALSE;
        }
    }

    public function opened_bills($per_page = 0)
    {
        $this->load->library('pagination');

        //$this->table->set_heading('Id', 'The Title', 'The Content');
        if ($this->input->get('per_page')) {
            $per_page = $this->input->get('per_page');
        }

        $config['base_url'] = admin_url('pos/opened_bills');
        $config['total_rows'] = $this->pos_model->bills_count();
        $config['per_page'] = 6;
        $config['num_links'] = 3;

        $config['full_tag_open'] = '<ul class="pagination pagination-sm">';
        $config['full_tag_close'] = '</ul>';
        $config['first_tag_open'] = '<li>';
        $config['first_tag_close'] = '</li>';
        $config['last_tag_open'] = '<li>';
        $config['last_tag_close'] = '</li>';
        $config['next_tag_open'] = '<li>';
        $config['next_tag_close'] = '</li>';
        $config['prev_tag_open'] = '<li>';
        $config['prev_tag_close'] = '</li>';
        $config['num_tag_open'] = '<li>';
        $config['num_tag_close'] = '</li>';
        $config['cur_tag_open'] = '<li class="active"><a>';
        $config['cur_tag_close'] = '</a></li>';

        $this->pagination->initialize($config);
        $data['r'] = TRUE;
        $bills = $this->pos_model->fetch_bills($config['per_page'], $per_page);
        if (!empty($bills)) {
            $html = "";
            $html .= '<ul class="ob">';
            foreach ($bills as $bill) {
                $html .= '<li><button type="button" class="btn btn-info sus_sale" id="' . $bill->id . '"><p>' . $bill->suspend_note . '</p><strong>' . $bill->customer . '</strong><br>'.lang('date').': ' . $bill->date . '<br>'.lang('items').': ' . $bill->count . '<br>'.lang('total').': ' . $this->sma->formatMoney($bill->total) . '</button></li>';
            }
            $html .= '</ul>';
        } else {
            $html = "<h3>" . lang('no_opeded_bill') . "</h3><p>&nbsp;</p>";
            $data['r'] = FALSE;
        }

        $data['html'] = $html;

        $data['page'] = $this->pagination->create_links();
        echo $this->load->view($this->theme . 'pos/opened', $data, TRUE);

    }

    public function delete($id = NULL)
    {

        $this->sma->checkPermissions('index');

        if ($this->pos_model->deleteBill($id)) {
			$ip = $_SERVER['REMOTE_ADDR'];
            $idu = $this->session->userdata('user_id');

            $this->db->query("INSERT INTO sma_logs (log_act, log_table, log_ip, log_user) VALUES ('Menghapus Bill $id', 'sma_suspended_bill', '$ip', '$idu')");
		
            $this->sma->send_json(array('error' => 0, 'msg' => lang("suspended_sale_deleted")));
        }
    }

    public function email_receipt($sale_id = NULL)
    {
        $this->sma->checkPermissions('index');
        if ($this->input->post('id')) {
            $sale_id = $this->input->post('id');
        } 
        if ( ! $sale_id) {
            die('No sale selected.');
        }
        if ($this->input->post('email')) {
            $to = $this->input->post('email');
        }
        $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
        $this->data['message'] = $this->session->flashdata('message');

        $this->data['rows'] = $this->pos_model->getAllInvoiceItems($sale_id);
        $inv = $this->pos_model->getInvoiceByID($sale_id);
        $biller_id = $inv->biller_id;
        $customer_id = $inv->customer_id;
        $this->data['biller'] = $this->pos_model->getCompanyByID($biller_id);
        $this->data['customer'] = $this->pos_model->getCompanyByID($customer_id);

        $this->data['payments'] = $this->pos_model->getInvoicePayments($sale_id);
        $this->data['pos'] = $this->pos_model->getSetting();
        $this->data['barcode'] = $this->barcode($inv->reference_no, 'code128', 30);
        $this->data['inv'] = $inv;
        $this->data['sid'] = $sale_id;
        $this->data['page_title'] = $this->lang->line("invoice");

        if (!$to) {
            $to = $this->data['customer']->email;
        }
        if (!$to) {
            $this->sma->send_json(array('msg' => $this->lang->line("no_meil_provided")));
        }
        $receipt = $this->load->view($this->theme . 'pos/email_receipt', $this->data, TRUE);

        if ($this->sma->send_email($to, 'Receipt from ' . $this->data['biller']->company, $receipt)) {
            $this->sma->send_json(array('msg' => $this->lang->line("email_sent")));
        } else {
            $this->sma->send_json(array('msg' => $this->lang->line("email_failed")));
        }

    }

    public function active()
    {
        $this->session->set_userdata('last_activity', now());
        if ((now() - $this->session->userdata('last_activity')) <= 20) {
            die('Successfully updated the last activity.');
        } else {
            die('Failed to update last activity.');
        }
    }

    public function add_payment($id = NULL)
    {
        $this->sma->checkPermissions('payments', TRUE, 'sales');
        $this->load->helper('security');
        if ($this->input->get('id')) {
            $id = $this->input->get('id');
        }

        $this->form_validation->set_rules('reference_no', lang("reference_no"), 'required');
        $this->form_validation->set_rules('amount-paid', lang("amount"), 'required');
        $this->form_validation->set_rules('paid_by', lang("paid_by"), 'required');
        $this->form_validation->set_rules('userfile', lang("attachment"), 'xss_clean');
        if ($this->form_validation->run() == TRUE) {
            if ($this->input->post('paid_by') == 'deposit') {
                $sale = $this->pos_model->getInvoiceByID($this->input->post('sale_id'));
                $customer_id = $sale->customer_id;
                if ( ! $this->site->check_customer_deposit($customer_id, $this->input->post('amount-paid'))) {
                    $this->session->set_flashdata('error', lang("amount_greater_than_deposit"));
                    redirect($_SERVER["HTTP_REFERER"]);
                }
            } else {
                $customer_id = null;
            }
            if ($this->Owner || $this->Admin) {
                $date = $this->sma->fld(trim($this->input->post('date')));
            } else {
                $date = date('Y-m-d H:i:s');
            }
            $payment = array(
                'date'         => $date,
                'sale_id'      => $this->input->post('sale_id'),
                'reference_no' => $this->input->post('reference_no'),
                'amount'       => $this->input->post('amount-paid'),
                'paid_by'      => $this->input->post('paid_by'),
                'cheque_no'    => $this->input->post('cheque_no'),
                'cc_no'        => $this->input->post('paid_by') == 'gift_card' ? $this->input->post('gift_card_no') : $this->input->post('pcc_no'),
                'cc_holder'    => $this->input->post('pcc_holder'),
                'cc_month'     => $this->input->post('pcc_month'),
                'cc_year'      => $this->input->post('pcc_year'),
                'cc_type'      => $this->input->post('pcc_type'),
                'cc_cvv2'      => $this->input->post('pcc_ccv'),
                'note'         => $this->input->post('note'),
                'created_by'   => $this->session->userdata('user_id'),
                'type'         => 'received',
            );

            if ($_FILES['userfile']['size'] > 0) {
                $this->load->library('upload');
                $config['upload_path'] = $this->digital_upload_path;
                $config['allowed_types'] = $this->digital_file_types;
                $config['max_size'] = $this->allowed_file_size;
                $config['overwrite'] = FALSE;
                $config['encrypt_name'] = TRUE;
                $this->upload->initialize($config);
                if (!$this->upload->do_upload()) {
                    $error = $this->upload->display_errors();
                    $this->session->set_flashdata('error', $error);
                    redirect($_SERVER["HTTP_REFERER"]);
                }
                $photo = $this->upload->file_name;
                $payment['attachment'] = $photo;
            }

            //$this->sma->print_arrays($payment);

        } elseif ($this->input->post('add_payment')) {
            $this->session->set_flashdata('error', validation_errors());
            redirect($_SERVER["HTTP_REFERER"]);
        }

        if ($this->form_validation->run() == TRUE && $msg = $this->pos_model->addPayment($payment, $customer_id)) {
            if ($msg) {
                if ($msg['status'] == 0) {
                    unset($msg['status']);
                    $error = '';
                    foreach ($msg as $m) {
                        if (is_array($m)) {
                            foreach ($m as $e) {
                                $error .= '<br>'.$e;
                            }
                        } else {
                            $error .= '<br>'.$m;
                        }
                    }
                    $this->session->set_flashdata('error', '<pre>' . $error . '</pre>');
                } else {
					$ip = $_SERVER['REMOTE_ADDR'];
					$idu = $this->session->userdata('user_id');

					$this->db->query("INSERT INTO sma_logs (log_act, log_table, log_ip, log_user) VALUES ('Menambah Payment $id', 'sma_payment', '$ip', '$idu')");
				
                    $this->session->set_flashdata('message', lang("payment_added"));
                }
            } else {
                $this->session->set_flashdata('error', lang("payment_failed"));
            }
            admin_redirect("pos/sales");
        } else {

            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));

            $sale = $this->pos_model->getInvoiceByID($id);
            $this->data['inv'] = $sale;
            $this->data['payment_ref'] = $this->site->getReference('pay');
            $this->data['modal_js'] = $this->site->modal_js();

            $this->load->view($this->theme . 'pos/add_payment', $this->data);
        }
    }

    public function updates()
    {
        if (DEMO) {
            $this->session->set_flashdata('warning', lang('disabled_in_demo'));
            redirect($_SERVER["HTTP_REFERER"]);
        }
        if (!$this->Owner) {
            $this->session->set_flashdata('error', lang('access_denied'));
            admin_redirect("welcome");
        }
        $this->form_validation->set_rules('purchase_code', lang("purchase_code"), 'required');
        $this->form_validation->set_rules('envato_username', lang("envato_username"), 'required');
        if ($this->form_validation->run() == TRUE) {
            $this->db->update('pos_settings', array('purchase_code' => $this->input->post('purchase_code', TRUE), 'envato_username' => $this->input->post('envato_username', TRUE)), array('pos_id' => 1));
			
			$ip = $_SERVER['REMOTE_ADDR'];
			$idu = $this->session->userdata('user_id');

			$this->db->query("INSERT INTO sma_logs (log_act, log_table, log_ip, log_user) VALUES ('Mengubah Setting', 'sma_setting', '$ip', '$idu')");
			
            admin_redirect('pos/updates');
        } else {
            $fields = array('version' => $this->pos_settings->version, 'code' => $this->pos_settings->purchase_code, 'username' => $this->pos_settings->envato_username, 'site' => base_url());
            $this->load->helper('update');
            $protocol = is_https() ? 'https://' : 'http://';
            $updates = get_remote_contents($protocol . 'tecdiary.com/api/v1/update/', $fields);
            $this->data['updates'] = json_decode($updates);
            $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('updates')));
            $meta = array('page_title' => lang('updates'), 'bc' => $bc);
            $this->page_construct('pos/updates', $meta, $this->data);
        }
    }

    public function install_update($file, $m_version, $version)
    {
        if (DEMO) {
            $this->session->set_flashdata('warning', lang('disabled_in_demo'));
            redirect($_SERVER["HTTP_REFERER"]);
        }
        if (!$this->Owner) {
            $this->session->set_flashdata('error', lang('access_denied'));
            admin_redirect("welcome");
        }
        $this->load->helper('update');
        save_remote_file($file . '.zip');
        $this->sma->unzip('./files/updates/' . $file . '.zip');
        if ($m_version) {
            $this->load->library('migration');
            if (!$this->migration->latest()) {
                $this->session->set_flashdata('error', $this->migration->error_string());
                admin_redirect("pos/updates");
            }
        }
        $this->db->update('pos_settings', array('version' => $version, 'update' => 0), array('pos_id' => 1));
        unlink('./files/updates/' . $file . '.zip');
        $this->session->set_flashdata('success', lang('update_done'));
        admin_redirect("pos/updates");
    }

    function open_drawer() {

        $data = json_decode($this->input->get('data'));
        $this->load->library('escpos');
        $this->escpos->load($data->printer);
        $this->escpos->open_drawer();

    }

    function p() {

        $data = json_decode($this->input->get('data'));
        $this->load->library('escpos');
        $this->escpos->load($data->printer);
        $this->escpos->print_receipt($data);

    }

    function printers()
    {
        if (!$this->Owner) {
            $this->session->set_flashdata('error', lang('access_denied'));
            admin_redirect("pos");
        }
        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->data['page_title'] = lang('printers');
        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => admin_url('pos'), 'page' => lang('pos')), array('link' => '#', 'page' => lang('printers')));
        $meta = array('page_title' => lang('list_printers'), 'bc' => $bc);
        $this->page_construct('pos/printers', $meta, $this->data);
    }

    function get_printers()
    {
        if (!$this->Owner) {
            $this->session->set_flashdata('error', lang('access_denied'));
            $this->sma->md();
        }

        $this->load->library('datatables');
        $this->datatables
        ->select("id, title, type, profile, path, ip_address, port")
        ->from("printers")
        ->add_column("Actions", "<div class='text-center'> <a href='" . admin_url('pos/edit_printer/$1') . "' class='btn-warning btn-xs tip' title='".lang("edit_printer")."'><i class='fa fa-edit'></i></a> <a href='#' class='btn-danger btn-xs tip po' title='<b>" . lang("delete_printer") . "</b>' data-content=\"<p>" . lang('r_u_sure') . "</p><a class='btn btn-danger po-delete' href='" . admin_url('pos/delete_printer/$1') . "'>" . lang('i_m_sure') . "</a> <button class='btn po-close'>" . lang('no') . "</button>\"  rel='popover'><i class=\"fa fa-trash-o\"></i></a></div>", "id")
        ->unset_column('id');
        echo $this->datatables->generate();

    }

    function add_printer()
    {

        if (!$this->Owner) {
            $this->session->set_flashdata('error', lang('access_denied'));
            admin_redirect("pos");
        }

        $this->form_validation->set_rules('title', $this->lang->line("title"), 'required');
        $this->form_validation->set_rules('type', $this->lang->line("type"), 'required');
        $this->form_validation->set_rules('profile', $this->lang->line("profile"), 'required');
        $this->form_validation->set_rules('char_per_line', $this->lang->line("char_per_line"), 'required');
        if ($this->input->post('type') == 'network') {
            $this->form_validation->set_rules('ip_address', $this->lang->line("ip_address"), 'required|is_unique[printers.ip_address]');
            $this->form_validation->set_rules('port', $this->lang->line("port"), 'required');
        } else {
            $this->form_validation->set_rules('path', $this->lang->line("path"), 'required|is_unique[printers.path]');
        }

        if ($this->form_validation->run() == true) {

            $data = array('title' => $this->input->post('title'),
                'type' => $this->input->post('type'),
                'profile' => $this->input->post('profile'),
                'char_per_line' => $this->input->post('char_per_line'),
                'path' => $this->input->post('path'),
                'ip_address' => $this->input->post('ip_address'),
                'port' => ($this->input->post('type') == 'network') ? $this->input->post('port') : NULL,
            );

        }

        if ( $this->form_validation->run() == true && $cid = $this->pos_model->addPrinter($data)) {

            $this->session->set_flashdata('message', $this->lang->line("printer_added"));
			
			$ip = $_SERVER['REMOTE_ADDR'];
			$idu = $this->session->userdata('user_id');
            $type = $this->input->post('type');
			$this->db->query("INSERT INTO sma_logs (log_act, log_table, log_ip, log_user) VALUES ('Menambah Printer $type', 'sma_printer', '$ip', '$idu')");
			
			
            admin_redirect("pos/printers");

        } else {
            if($this->input->is_ajax_request()) {
                echo json_encode(array('status' => 'failed', 'msg' => validation_errors())); die();
            }

            $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
            $this->data['page_title'] = lang('add_printer');
            $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => admin_url('pos'), 'page' => lang('pos')), array('link' => admin_url('pos/printers'), 'page' => lang('printers')), array('link' => '#', 'page' => lang('add_printer')));
            $meta = array('page_title' => lang('add_printer'), 'bc' => $bc);
            $this->page_construct('pos/add_printer', $meta, $this->data);
        }
    }

    function edit_printer($id = NULL)
    {

        if (!$this->Owner) {
            $this->session->set_flashdata('error', lang('access_denied'));
            admin_redirect("pos");
        }
        if($this->input->get('id')) { $id = $this->input->get('id', TRUE); }

        $printer = $this->pos_model->getPrinterByID($id);
        $this->form_validation->set_rules('title', $this->lang->line("title"), 'required');
        $this->form_validation->set_rules('type', $this->lang->line("type"), 'required');
        $this->form_validation->set_rules('profile', $this->lang->line("profile"), 'required');
        $this->form_validation->set_rules('char_per_line', $this->lang->line("char_per_line"), 'required');
        if ($this->input->post('type') == 'network') {
            $this->form_validation->set_rules('ip_address', $this->lang->line("ip_address"), 'required');
            if ($this->input->post('ip_address') != $printer->ip_address) {
                $this->form_validation->set_rules('ip_address', $this->lang->line("ip_address"), 'is_unique[printers.ip_address]');
            }
            $this->form_validation->set_rules('port', $this->lang->line("port"), 'required');
        } else {
            $this->form_validation->set_rules('path', $this->lang->line("path"), 'required');
            if ($this->input->post('path') != $printer->path) {
                $this->form_validation->set_rules('path', $this->lang->line("path"), 'is_unique[printers.path]');
            }
        }

        if ($this->form_validation->run() == true) {

            $data = array('title' => $this->input->post('title'),
                'type' => $this->input->post('type'),
                'profile' => $this->input->post('profile'),
                'char_per_line' => $this->input->post('char_per_line'),
                'path' => $this->input->post('path'),
                'ip_address' => $this->input->post('ip_address'),
                'port' => ($this->input->post('type') == 'network') ? $this->input->post('port') : NULL,
            );

        }

        if ( $this->form_validation->run() == true && $this->pos_model->updatePrinter($id, $data)) {
		
			$ip = $_SERVER['REMOTE_ADDR'];
			$idu = $this->session->userdata('user_id');
           
			$this->db->query("INSERT INTO sma_logs (log_act, log_table, log_ip, log_user) VALUES ('Mengubah Printer $id', 'sma_printer', '$ip', '$idu')");
		
            $this->session->set_flashdata('message', $this->lang->line("printer_updated"));
            admin_redirect("pos/printers");

        } else {

            $this->data['printer'] = $printer;
            $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
            $this->data['page_title'] = lang('edit_printer');
            $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => admin_url('pos'), 'page' => lang('pos')), array('link' => admin_url('pos/printers'), 'page' => lang('printers')), array('link' => '#', 'page' => lang('edit_printer')));
            $meta = array('page_title' => lang('edit_printer'), 'bc' => $bc);
            $this->page_construct('pos/edit_printer', $meta, $this->data);

        }
    }

    function delete_printer($id = NULL)
    {
        if(DEMO) {
            $this->session->set_flashdata('error', $this->lang->line("disabled_in_demo"));
            $this->sma->md();
        }
        if (!$this->Owner) {
            $this->session->set_flashdata('error', lang('access_denied'));
            $this->sma->md();
        }

        if ($this->input->get('id')) { $id = $this->input->get('id', TRUE); }

        if ($this->pos_model->deletePrinter($id)) {
			$ip = $_SERVER['REMOTE_ADDR'];
			$idu = $this->session->userdata('user_id');
           
			$this->db->query("INSERT INTO sma_logs (log_act, log_table, log_ip, log_user) VALUES ('Menghapus Printer $id', 'sma_printer', '$ip', '$idu')");
		
            $this->sma->send_json(array('error' => 0, 'msg' => lang("printer_deleted")));
        }

    }

    public function add_cart($debug = FALSE)
    {
        $this->input->post("data");

        if ($this->input->post()) {
            $data_session = !is_array($this->session->userdata("cart")) ? array() : $this->session->userdata("cart") ;
            $uniqid = uniqid();
            $data_session[$uniqid] = $this->input->post();
            $data_session[$uniqid]["created"] = date("Y-m-d h:i:s");

            // print_r($data_session);
            // die;


            $this->session->set_userdata("cart", $data_session);
        }
        if ($debug) {
           echo "<pre>";
           print_r($this->session->userdata());
           echo "</pre>";
        }
    }

    public function get_cart($per_page = 0)
    {
        $this->load->library('pagination');

        //$this->table->set_heading('Id', 'The Title', 'The Content');
        if ($this->input->get('per_page')) {
            $per_page = $this->input->get('per_page');
        }

        $config['base_url'] = admin_url('pos/opened_bills');
        $config['total_rows'] = $this->pos_model->bills_count();
        $config['per_page'] = 6;
        $config['num_links'] = 3;

        $config['full_tag_open'] = '<ul class="pagination pagination-sm">';
        $config['full_tag_close'] = '</ul>';
        $config['first_tag_open'] = '<li>';
        $config['first_tag_close'] = '</li>';
        $config['last_tag_open'] = '<li>';
        $config['last_tag_close'] = '</li>';
        $config['next_tag_open'] = '<li>';
        $config['next_tag_close'] = '</li>';
        $config['prev_tag_open'] = '<li>';
        $config['prev_tag_close'] = '</li>';
        $config['num_tag_open'] = '<li>';
        $config['num_tag_close'] = '</li>';
        $config['cur_tag_open'] = '<li class="active"><a>';
        $config['cur_tag_close'] = '</a></li>';

        $this->pagination->initialize($config);
        $data['r'] = TRUE;
        $bills = $this->session->userdata("cart");


        if (!empty($bills)) {
            $html = "";
            $html .= '<ul class="ob">';
            foreach ($bills as $key => $bill) {
                $bill = $bill["data"];
                $item = json_decode($bill);
                $html .= '<li>';
                $html .= $bills[$key]["customer"] ." - ". $bills[$key]["created"] ;
                $html .= '<button type="button" class="btn btn-info pos-cart" id="' . $key . '">';
                foreach ($item as $key_item => $value_item) {
                            $html .= '<p>' . $value_item->label . '</p>';
                }
                $html .= '</button>
                        </li>';
            }
            $html .= '</ul>';
        } else {
            $html = "<h3>" . lang('no_opeded_bill') . "</h3><p>&nbsp;</p>";
            $data['r'] = FALSE;
        }

        $data['html'] = $html;

        $data['page'] = $this->pagination->create_links();
        echo $this->load->view($this->theme . 'pos/opened', $data, TRUE);

    }
}
