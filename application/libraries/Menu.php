<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	
	/**
	 * Menu Class.  Provides all functionality related to Menu. 
	 * And any corpertation related to the users' authority
	 * will be most likely represented in this class.
	 *
	 * Please see the per-function comments for more information.
	 *
	 * @author Chong Liu
	 * @copyright 2014 Ivory Tower
	 */
	class Menu{
		
		public function __construct()
		{
			
		}
		
		/**
		 * Returns menu based on categoryID. The different roles has 
		 * different authority, the menu display or not based on the authority.
		 * 
		 * @param int $categoryID
		 * @return array
		 */
		public function getMenuByCaid($categoryID = null)
		{
			$sql = "SELECT m.menu_id, m.menu_title, m.url, m.is_parent_node, m.parent_id, m.level
						FROM menu m 
						LEFT JOIN privilege_setting ps ON m.menu_id = ps.menu_id
						WHERE acc_category_id = ? AND privi_id = 1";
			
			$sqlParam = array($categoryID);
			
			$menu = $this->db->query($sql, $sqlParam);
			
			return $menu;
		}
		
		/**
		 * Returns all menu based on categoryID regardless the authority
		 * has or not. It's used for reset the authority.
		 *
		 * @param int $categoryID
		 * @return array
		 */
		public function getAllMenuByCaid($categoryID = null)
		{
			$sql = "SELECT m.menu_id, m.menu_title, m.url, m.is_parent_node, m.parent_id, m.level
						FROM menu m
						LEFT JOIN privilege_setting ps ON m.menu_id = ps.menu_id
						WHERE acc_category_id = ? ";
				
			$sqlParam = array($categoryID);
				
			$menu = $this->db->query($sql, $sqlParam);
				
			return $menu;
		}
		
		/**
		 * Returns menu by different level based on function getMenuByCaid()
		 * 
		 * @param int $categoryID
		 * @param int $level
		 * @return array
		 */
		public function getMenuByCaidLevel($categoryID = null, $level = null)
		{
			$sql = "SELECT m.menu_id, m.menu_title, m.url, m.is_parent_node, m.parent_id, m.level
						FROM menu m
						LEFT JOIN privilege_setting ps ON m.menu_id = ps.menu_id
						WHERE acc_category_id = ? AND level = ? AND privi_id = 1";
				
			$sqlParam = array('acc_categoryID' => $categoryID,
							  'level'	   => $level);
				
			$menu = $this->db->query($sql, $sqlParam);
				
			return $menu;
		}
		
		/**
		 * Return the Maximum of the level
		 * @return array
		 */
		public function getMaxLevel()
		{
			$sql = "SELECT MAX(level) AS level From menu";
			
			$level = $this->db->query($sql);
			
			return $level;
		}
		
		/*************************************************************************************
		 * Set functions (update this, insert that..)
		*************************************************************************************/
		/**
		 * Sets the content of the privilege_setting table.  If $insert is true, an insert
		 * is performed, otherwise an update is run using the other arguments in the where.
		 * $validFields is an array of valid field names in the database table
		 *
		 * @param array $data
		 * @param boolean $insert
		 * @param int $merchantID
		 */
		public function setPrivilege(array $data = array(), $insert = false, $userID = null)
		{
			$validFields = array('acc_category_id', 'menu_id', 'privi_id');
				
			$data = $this->getCleanedData($data, $validFields);
			$params = $this->getParamsForUpdate($data);
		
			if (count($data) == 0 || strlen($params) == 0)
			{
				return false;
			}
		
			if ($insert == true)
			{
				$this->db->query("INSERT INTO privilege_setting SET {$params}", $data);
			}
			else
			{
				$this->db->query("UPDATE privilege_setting SET {$params} WHERE userid = {$userID} LIMIT 1", $data);
			}
		}
		
		/*************************************************************************************
		 * Helper functions
		*************************************************************************************/
		/**
		 * Returns $data with any keys not in $validFields removed
		 *
		 * @param array $data
		 * @param array $validFields
		 * @return array
		 */
		private function getCleanedData(array $data = array(), array $validFields = array())
		{
			// Strip any keys that aren't in the validFields array
			foreach($data as $key => $val)
			{
				if (!in_array($key, $validFields))
				{
					unset($data[$key]);
				}
			}
		
			return $data;
		}
		
		/**
		 * Given an array of key => value pairs, it will return a string
		 * consisting of the keys in param pairs (e.g. foo = ?)
		 *
		 * $data is passed by reference and the key is unset if the special
		 * cases are used (NOW()/NULL).  This prevents the variable/token error.
		 *
		 * @param array $data
		 * @return string
		 */
		private function getParamsForUpdate(array &$data = array())
		{
			$params = '';
		
			// Get all of the keys and construct the string
			foreach($data AS $key => $val)
			{
				// Check for the special case of "NOW()"
				if ($val === "NOW()")
				{
					$params .= "{$key} = NOW(),";
					unset($data[$key]);
				}
				// Check for the special case of "NULL"
				elseif ($val === "NULL")
				{
					$params .= "{$key} = NULL,";
					unset($data[$key]);
				}
				// Check for literal function calls @todo rethink this
				elseif (preg_match('/\|literal$/', $val))
				{
					$params .= "{$key} = ".substr($val, 0, -8).",";
					unset($data[$key]);
				}
				else
				{
					$params .= "{$key} = ?,";
				}
		
			}
		
			// Get rid of the trailing comma
			if (strlen($params) > 0)
			{
				$params = substr($params, 0, -1);
			}
		
			return $params;
		}
	}