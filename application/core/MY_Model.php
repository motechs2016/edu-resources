<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MY_Model extends CI_Model{
	
	protected $_table_name = '';
	protected $_primary_key = 'id';
	protected $_primary_filter = 'intval';
	protected $_order_by = '';
	public $_rules = array();
	protected $_timestamps = FALSE;
	
	public function __construct()
	{
		parent::__construct();
	}
	
	public function array_from_post($fields)
	{
		$data = array();
		foreach ($fields as $field)
		{
			$data[$field] = $this->input->post($field);	
		}	
		return $data;
	}
	/**
	 * this method is used for get columns from the database
	 * 
	 * @param int $id
	 * @param boolean $single  
	 * @return array
	 */
	public function get($id = NULL, $single = FALSE)
	{
		if ($id != NULL){
			$filter = $this->_primary_filter;
			$id = $filter($id);
			$this->db->where($this->_primary_key, $id);
			$method = 'row';	
		}
		elseif ($single == TRUE)
		{
			$method = 'row'	;
		}
		else
		{
			$method = 'result';	
		}	
		
		if (!count($this->db->ar_orderby))
		{
			$this->db->order_by($this->_order_by);	
		}
		return $this->db->get($this->_table_name)->$method();
	}
	
	/**
	 * return the info via a specified content
	 * @param array $where
	 * @param boolean $single
	 * @return array
	 */
	
	public function get_by($where, $single = FALSE)
	{
		$this->db->where($where);
		return $this->get(NULL, $single);
	}
	
	/**
	 * select * from table limit # offset #
	 * @param int $limit
	 * @param int $offset
	 * @return array:
	 */
	public function get_limit($limit, $offset)
	{
		$this->db->limit($limit, $offset);
		return $this->get(NULL, FALSE);
	}
	
	public function save($data, $id = NULL)
	{
		//set timestamps
		if ($this->_timestamps == TRUE)
		{
			//date_default_timezone_set("Asia/Shanghai");
			$now = date('Y-m-d H:i:s');
			$id || $data['last_login_time'] = $now;
			$data['last_login_time'] = $now;	
		} 
		else 
		{
				
		}
		
		if ($id == NULL)//insert
		{
			!isset($data[$this->_primary_key]) || $data[$this->_primary_key] = NULL;
			$this->db->insert($this->_table_name,$data);
			$id = $this->db->insert_id();	
		}
		else //update
		{
			$filter = $this->_primary_filter;
			$id = $filter($id);
			$this->db->where($this->_primary_key, $id);
			$this->db->update($this->_table_name, $data);	
		}
		return $id;
	}
	
	function delete($id)
	{
		$filter = $this->_primary_filter;
		$id = $filter($id);
		
		if (!$id) 
		{
			return FALSE;	
		}	
		$this->db->where($this->_primary_key, $id);
		$this->db->limit(1)->delete($this->_table_name);
	}
	
	public function validateSession()
	{
		$userid = $this->session->userdata('userid');
		if (empty($userid))
		{
			return 'login';
		}
		
		if ($this->session->userdata('last_activity')< (date('Y-m-d H:i:s')-(15*60)))
		{
			$id = $this->session->userdata('userid');
			//date_default_timezone_set("Asia/Shanghai");
			$now = date('Y-m-d H:i:s');
			$data = array(
					'last_login_time' => $now,
					'is_active' => 'no'
					);
			$this->save($data, $id);
			$this->session->sess_destroy();
			return 'timeout';
		}
		return 'logged';
	}
}

/* End of file MY_Model.php */
/* Location: ./application/core/MY_Model.php */