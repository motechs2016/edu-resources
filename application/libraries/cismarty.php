<?php
if (!defined('BASEPATH')) exit("no direct scirpt access allowd");
//load smarty classes
require_once (APPPATH.'libraries/smarty/Smarty.class.php');

class cismarty extends Smarty{
	
	protected $ci;
	
	function __construct()
	{
		parent::__construct();
		//reference instantiation Ci,这里主要是将smarty的配置文件写道CI中，以便管理
		$this->ci = & get_instance();
		//load the new config 'smarty'
		$this->ci->load->config('smarty');
		$this->cache_lifetime  = $this->ci->config->item('cache_lifetime');
		$this->caching		   = $this->ci->config->item('caching');
		$this->template_dir    = $this->ci->config->item('template_dir');
		$this->compile_dir     = $this->ci->config->item('compile_dir');
		$this->cache_dir       = $this->ci->config->item('cache_dir');
		$this->use_sub_dirs    = $this->ci->config->item('use_sub_dirs');
		$this->left_delimiter  = $this->ci->config->item('left_delimiter');
		$this->right_delimiter = $this->ci->config->item('right_delimiter');
		
	}
}

/* End of file cismarty.php */
/* Location: ./application/libraries/cismarty.php */