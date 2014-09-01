<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');	

class study extends Admin_Controller{
	
	public function __construct()
	{
		parent::__construct();
	}
	
	public function index()
	{
		$this->cismarty->display('studyhomepage.tpl');
	}
}
/* End of file study.php */
/* Location: ./application/controllers/study.php */