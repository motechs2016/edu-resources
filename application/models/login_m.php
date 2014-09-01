<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login_m extends MY_Model{
	
	protected $_table_name = 'users';
	protected $_order_by = 	'userid';
	protected $_primary_key = 'userid';
	protected $_primary_filter = 'strval';
	public $_rules = array(
			'account' => array('field' => 'account', 'label' => 'Account', 'rules' => 'trim|required|xss_clean'),
			'password' => array('field' => 'password', 'label' => 'Password', 'rules' => 'trim|required'),
	);
	public $_rules_admin = array(
			'account' => array('field' => 'account', 'label' => 'Account', 'rules' => 'trim|required|xss_clean|callback_unique_account'),
			'password' => array('field' => 'password', 'label' => 'Password', 'rules' => 'trim|required|min_length[6]'),
			'cf_password' => array('field' => 'cf_password', 'label' => 'Confirm password', 'rules' => 'trim|matches[password]|min_length[6]'),
	);

	public function __construct()
	{
		parent::__construct();
		$this->load->library('session');
		$this->load->library('user');
	}
	
	public function login()
	{
		$user = $this->get_by(array(
				'account' => $this->input->post('account'),
		),TRUE);
	
		if(count($user))
		{
			$password = $this->input->post('password');
			if(md5($password.$user->nonce) == $user->password)
			{
				$data = $this->user->getUserByAccount($this->input->post('account'));
				
				//$this->user_m->save($data1, $user->userid);
				$this->session->set_userdata($data);
				return TRUE;
			}
			return FALSE;			
		}
		return FALSE;
	}
	
	public function logout()
	{
		$id = $this->session->userdata('userid');
		//date_default_timezone_set("Asia/Shanghai");
		$now = date('Y-m-d H:i:s');
		$data = array(
				'last_login_time' => $now,
				'is_active' => 'no'
		);
		//$this->save($data, $id);
		$this->session->sess_destroy();
	}
	
	public function get_new()
	{
		$user = new stdClass();
		$user->account = '';
		$user->password = '';
		//$user->last_login_time = '';
		//$user->is_active = '';
		return $user;
	}
	
}

/* End of file login_m.php */
/* Location: ./application/models/login_m.php */