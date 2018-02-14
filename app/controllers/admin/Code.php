<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Code extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        if (!$this->loggedIn) {
            $this->session->set_userdata('requested_page', $this->uri->uri_string());
            $this->sma->md('login');
        }
        $this->load->library('form_validation');
        $this->load->admin_model('code_model');
        $this->digital_upload_path = 'files/';
        $this->upload_path = 'assets/uploads/';
        $this->thumbs_path = 'assets/uploads/thumbs/';
        $this->image_types = 'gif|jpg|jpeg|png|tif';
        $this->digital_file_types = 'zip|psd|ai|rar|pdf|doc|docx|xls|xlsx|ppt|pptx|gif|jpg|jpeg|png|tif|txt';
        $this->allowed_file_size = '1024';
        $this->popup_attributes = array('width' => '900', 'height' => '600', 'window_name' => 'sma_popup', 'menubar' => 'yes', 'scrollbars' => 'yes', 'status' => 'no', 'resizable' => 'yes', 'screenx' => '0', 'screeny' => '0');
    }

    function index($warehouse_id = NULL)
    {
        $this->sma->checkPermissions();

        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        if ($this->Owner || $this->Admin || !$this->session->userdata('warehouse_id')) {
            $this->data['warehouses'] = $this->site->getAllWarehouses();
            $this->data['warehouse_id'] = $warehouse_id;
            $this->data['warehouse'] = $warehouse_id ? $this->site->getWarehouseByID($warehouse_id) : NULL;
        } else {
            $this->data['warehouses'] = NULL;
            $this->data['warehouse_id'] = $this->session->userdata('warehouse_id');
            $this->data['warehouse'] = $this->session->userdata('warehouse_id') ? $this->site->getWarehouseByID($this->session->userdata('warehouse_id')) : NULL;
        }

        $this->data['supplier'] = $this->input->get('supplier') ? $this->site->getCompanyByID($this->input->get('supplier')) : NULL;
        $this->data['result'] = $this->code_model->getCode();
        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('code')));
        $meta = array('page_title' => lang('code'), 'bc' => $bc);
        $this->page_construct('code/index', $meta, $this->data);
    }

    function getCode(){
        $response = array(
                    'code' => true,
                    'message' => $this->code_model->getCode()
                );
            
        $this->output
            ->set_content_type('application/json', 'utf-8')
            ->set_output(json_encode($response, JSON_PRETTY_PRINT))
            ->_display();
            exit;
    }
    
    function update($code = NULL)
    {
        $code = $this->input->get('code');
        
        $this->code_model->update($code);
        $this->session->set_flashdata('message', "Code Has Update");
        admin_redirect('code');
        
        // $query = $this->db->query("SELECT code FROM sma_products WHERE id = '$id'")->result();
        // $product = $query[0]->code;

        // $this->sma->checkPermissions(NULL, TRUE);

        // if ($this->input->get('id')) {
        //     $id = $this->input->get('id');
        // }

        // if ($this->products_model->deleteProduct($id)) {
        //     $id = $this->session->userdata('user_id');
        //     $ip = $_SERVER['REMOTE_ADDR'];
            
        //     $this->db->query("INSERT INTO sma_logs (log_act, log_table, log_ip, log_user) VALUES ('Menghapus produk dengan kode $product', 'sma_products', '$ip', '$id')");
        
        //     if($this->input->is_ajax_request()) {
        //         $this->sma->send_json(array('error' => 0, 'msg' => lang("product_deleted")));
        //     }
        //     $this->session->set_flashdata('message', lang('product_deleted'));
        //     admin_redirect('welcome');
        // }

    }
}
