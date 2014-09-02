<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MY_Controller extends CI_Controller {


	public function __construct()
	{
		parent::__construct();
	}
	
	public function assign($key, $val)
	{
		$this->cismarty->assign($key, $val);	
	
	}
	
	public function dispaly($html)
	{
		$this->cismarty->display($html);
	}
}

class Admin_Controller extends MY_Controller{
	
	public function __construct()
	{
		parent::__construct();
		$this->cismarty->assign('meta_title', 'Ivory Tower');
		$this->load->library('form_validation');
		$this->load->library('session');
		$this->load->library('pagination');
		$this->load->helper('url');
		
		$this->load->model('Menu');
		$this->load->model('User');
		
		//get menu by account
		$account = $this->session->userdata('account');
		if($account != '')
		{
			$user = $this->User->getUserByAccount($account);
			$cate_id = $user->acc_category_id;
			//$cate_id = 3;
		}
		else
		{
		//if account is not exit, default as a visitor, have the authority same as student
			$account = 'Visitor';
			$cate_id = 3;
		}
		
		//get menu info by authority and level
		$pmenu = $this->Menu->getMenuByCaidLevel($cate_id, 1);
		$cmenu = $this->Menu->getMenuByCaidLevel($cate_id, 2);
		
		$this->cismarty->assign('account', $account);
		$this->cismarty->assign('pmenus', $pmenu);
		$this->cismarty->assign('cmenus', $cmenu);
		
	}	
}

/* End of file MY_Controller.php */
/* Location: ./application/core/MY_Controller.php */