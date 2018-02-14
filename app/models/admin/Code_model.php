<?php defined('BASEPATH') OR exit('No direct script access allowed');

class code_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function getCode(){
        $this->db->from('code');
        return $this->db->get()->result();
    }
    
    public function update($code){
        $val = array(
            'generate_code' => $code
        );

        $this->db->update('code', $val);
    }

}
