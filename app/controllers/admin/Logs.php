<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Logs extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        if (!$this->loggedIn) {
            $this->session->set_userdata('requested_page', $this->uri->uri_string());
            $this->sma->md('login');
        }
        $this->lang->admin_load('products', $this->Settings->user_language);
        $this->load->library('form_validation');
        $this->load->admin_model('logs_model');
    }

    function index($warehouse_id = NULL)
    {
        $this->sma->checkPermissions();

        $this->data['test'] = "asd";
        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('logs')));
        $meta = array('page_title' => lang('logs'), 'bc' => $bc);
        $this->page_construct('logs/index', $meta, $this->data);
    }

    function getLogs() {
        $this->load->library('datatables');
    
        $this->datatables
            ->select("{$this->db->dbprefix(('logs'))}.log_id as id, {$this->db->dbprefix(('logs'))}.log_date, {$this->db->dbprefix(('logs'))}.log_act, {$this->db->dbprefix(('logs'))}.log_table, {$this->db->dbprefix(('logs'))}.log_ip, (select username from {$this->db->dbprefix(('users'))} where id = {$this->db->dbprefix(('logs'))}.log_user) as log_user", FALSE)
            ->from("logs")
            
            ->add_column("Actions", "<div class=\"text-center\"><a href='#' class='tip po' title='<b>" . lang("delete_log") . "</b>' data-content=\"<p>" . lang('r_u_sure') . "</p><a class='btn btn-danger po-delete' href='" . admin_url('logs/delete_log/$1') . "'>" . lang('i_m_sure') . "</a> <button class='btn po-close'>" . lang('no') . "</button>\"  rel='popover'><i class=\"fa fa-trash-o\"></i></a></div>", "id");

        echo $this->datatables->generate();
    }

    function log_actions()
    {

        $this->form_validation->set_rules('form_action', lang("form_action"), 'required');

        if ($this->form_validation->run() == true) {

            if (!empty($_POST['val'])) {
                if ($this->input->post('form_action') == 'delete') {
                    foreach ($_POST['val'] as $id) {
                        $this->logs_model->deleteLog($id);
                    }
                    $this->session->set_flashdata('message', lang("logs_deleted"));
                    redirect($_SERVER["HTTP_REFERER"]);
                }
            } else {
                $this->session->set_flashdata('error', lang("no_record_selected"));
                redirect($_SERVER["HTTP_REFERER"]);
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect($_SERVER["HTTP_REFERER"]);
        }
    }

    function delete_log($id = NULL)
    {

        if ($this->logs_model->deleteLog($id)) {
            $this->sma->send_json(array('error' => 0, 'msg' => lang("log_deleted")));
        }
    }
}
