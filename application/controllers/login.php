<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');	

class Login extends Admin_Controller{
	
	public function __construct()
	{
		parent::__construct();
		$this->load->model('login_m');
	}
	
	public function index()
	{
		$this->cismarty->display('login.tpl');
	}
	
	public function log_in()
	{
		
		// Set form
		$rules = $this->login_m->_rules;
		$this->form_validation->set_rules($rules);
		$this->form_validation->set_message('required', 'The %s can not be empty');
		// Prosess form
		//if ($this->form_validation->run() == TRUE)
		//{
			if ($this->login_m->login() == TRUE)
			{
				//$this->cismarty->display('homepage.tpl');
				exit(json_encode(array(
					'flag' => 'success',
					'redirect' => 'homepage/index'	
					)));
				
				//redirect(login);
			}
			else
			{
				//$this->cismarty->assign('errorMsg','That account/password combination does not exist!');
				//$this->cismarty->display('login.tpl');
				exit(json_encode(array(
						'flag' => 'failed',
						'errorMsg' => 'Unknow user name or bad password.',
						'redirect' => 'login/index'
				)));
			}
			
		//}
		/*load view
		$this->cismarty->assign('error',validation_errors());
		$this->cismarty->display('login.tpl');*/
		
		
	}
}
/* End of file login.php */
/* Location: ./application/controllers/login.php */