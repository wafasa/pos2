<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Logs_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function deleteLog($id)
    {
        if($this->db->delete('logs', array('log_id' => $id))) {
            return true;
        }

        return FALSE;
    }
}
