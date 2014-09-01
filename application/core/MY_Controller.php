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
		
	}	
}

/* End of file MY_Controller.php */
/* Location: ./application/core/MY_Controller.php */