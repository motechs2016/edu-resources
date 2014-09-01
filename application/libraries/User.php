<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

	/**
	 * User Class.  Provides all functionality related to users
	 * and their accounts, including logins/logouts, account modifications
	 * and all that other good stuff.  Any table related to the user's corpertation
	 * will be most likely represented in this class(like study_history etc.).
	 *
	 * Please see the per-function comments for more information.
	 *
	 * @author Chong Liu
	 * @copyright 2014 Ivory Tower
	 */
	class User{
		
		/**
		 * The "Best Guess" Remote IP of the client
		 *
		 * @var string
		 */
		private $remoteIP;
		
		public function __construct()
		{
			// Figure out the remote IP
			$remoteIP = (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) ? $_SERVER['HTTP_X_FORWARDED_FOR'] : (isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : null);
			if (strstr($remoteIP, ','))
			{
				$chunks = explode(',', $remoteIP);
				$remoteIP = trim($chunks[0]);
			}
			$this->remoteIP = $remoteIP;
		}
		
		/*************************************************************************************
		 * Retrieval functions (get this, get that..)
		*************************************************************************************/
		/**
		 * Returns the user for the related account
		 *
		 * @param string $account
		 * @return array
		 */
		public function getUserByAccount($account = '')
		{
			$sql = "SELECT u.userid, u.account, u.acc_category_id, ac.acc_categoty_name
						FROM users u
						LEFT JOIN account_categories ac ON u.acc_category_id = ac.acc_category_id
						WHERE u.account = ?
						LIMIT 1";
		
			$sqlParams = array($account);
		
			$user = $this->db->query($sql, $sqlParams);
		
			return $user;
		}
		
		/**
		 * Returns the user for the related userID
		 *
		 * @param int $userID
		 * @return array
		 */
		public function getUserByUserID($userID = null)
		{
			$sql = "SELECT u.userid, u.account, u.acc_category_id, ac.acc_categoty_name
						FROM users u
						LEFT JOIN account_categories ac ON u.acc_category_id = ac.acc_category_id
						WHERE u.account = ?
						LIMIT 1";
		
			$sqlParams = array($userID);
		
			$user = $this->db->query($sql, $sqlParams);
		
			return $user;
		}
		
		/**
		 * Returns category about the user.  It is used for get the specific info
		 * about the user via category.
		 *
		 * @param int $userID
		 * @return array
		 */
		public function getUserCategory($userID = null)
		{
			$sql = "SELECT acc_category_id 
						FROM users 
						WHERE userid = ?
						LIMIT 1";
			
			$sqlParams = array($userID);
			
			$categoryID = $this->db->query($sql, $sqlParams);
			
			return $categoryID;
		}
		
		/**
		 * Returns categoryID via categoryName
		 * 
		 * @param string $categoryName
		 * @return array
		 */
		public function getAccidByAcname($categoryName = '')
		{
			$sql = "SELECT acc_category_id
						FROM account_categories
						WHERE acc_categoty_name = ?
						LIMIT 1";
			
			$sqlParam = array($categoryName);
			
			$categoryID = $this->db->query($sql, $sqlParam);
			
			return $categoryID;
		}
		
		/**
		 * get all academies
		 * 
		 * @return array
		 */
		public function getAcademy()
		{
			$sql = "SELECT * FROM academy";
			
			return $this->db->query($sql);
		}
		
		/**
		 * get major by the academyID, if academyID is null, get all majors
		 * 
		 * @param int $academyID
		 * @return array
		 */
		public function getMajorByAcademyID($academyID = null)
		{
			if($academyID == '')
			{
				$sqlwhere = '';
			}
			else 
			{
				$sqlwhere = "WHERE m.academy_id = ?";	
				$sqlParam = array($academyID);	
			}
			
			$sql = "SELECT m.major_id, m.major_name, m.academy_id, a.academy_name 
						FROM major m
						LEFT JOIN academy a ON m.academy_id = a.academy_id
						{$sqlwhere}";

			if($academyID == '')
			{
				$major = $this->db->query($sql);
			}
			else
			{
				$major = $this->db->query($sql, $sqlParam);
			}		
			
			return $major;
		}
		
		/**
		 * get class by the majorID, if majorID is null, get all classes.
		 * 
		 * @param string $majorID
		 * @return array
		 */
		public function getClassByMajorID($majorID = '')
		{
			if($majorID == '')
			{
				$sqlwhere = '';
			}
			else 
			{
				$sqlwhere = "WHERE c.major_id = ?";	
				$sqlParam = array($majorID);	
			}
			
			$sql = "SELECT c.class_id, c.major_id, m.major_name, c.class_name 
						FROM class c
						LEFT JOIN major m ON c.major_id = m.major_id
						{$sqlwhere}";

			if($majorID == '')
			{
				$class = $this->db->query($sql);
			}
			else
			{
				$class = $this->db->query($sql, $sqlParam);
			}		
			
			return $class;
		}
		
		/**
		 * Returns basic information about the user base on different catagoryID.  
		 * This is performed automatically every time resumeSession is called - 
		 * as it gives us the required info for the page header, among other things.
		 *
		 * @param int $userID
		 * @param int $categoryID
		 * @return array
		 */
		public function getUserDetails($userID = null, $categoryID = null)
		{
			if ($categoryID == 1)
			{
				$sql = "SELECT u.userid, u.account, u.status, u.acc_category_id, ac.acc_categoty_name
							FROM users u
							LEFT JOIN account_categories ac ON u.acc_category_id = ac.acc_category_id
							WHERE u.userid = ?
							LIMIT 1";
			}
			elseif ($categoryID == 2)
			{
				$sql = "SELECT u.userid, u.account, u.status, u.acc_category_id, ac.acc_categoty_name, ti.name,
							   ti.academy_id, a.academy_name, a.english_name, ti.major_id, m.major_name
							FROM users u
							LEFT JOIN account_categories ac ON u.acc_category_id = ac.acc_category_id
							LEFT JOIN teacher_items ti ON u.userid = ti.userid
							LEFT JOIN academy a ON ti.academy_id = a.academy_id
							LEFT JOIN major m ON ti.major_id = m.major_id
							WHERE u.userid = ?
							LIMIT 1";
			}
			else 
			{
				$sql = "SELECT u.userid, u.account, u.status, u.acc_category_id, ac.acc_categoty_name, si.name,
							   si.academy_id, a.academy_name, a.english_name, si.major_id, m.major_name,
							   si.class_id, c.class_name
							FROM users u
							LEFT JOIN account_categories ac ON u.acc_category_id = ac.acc_category_id
							LEFT JOIN student_items si ON u.userid = si.userid
							LEFT JOIN academy a ON si.academy_id = a.academy_id
							LEFT JOIN major m ON si.major_id = m.major_id
							LEFT JOIN class c ON si.class_id = c.class_id
							WHERE u.userid = ?
							LIMIT 1";
			}
			
			$sqlParams = array($userID);
			
			$details = $this->db->query($sql, $sqlParams);
			
			return $details;
			
		}
		
		/**
		 * return User's study collections info
		 * 
		 * @param int $userID
		 * @return array
		 */
		public function getUserCollection($userID = null)
		{
			$sql = "SELECT sc.userid, u.account, sc.resource_id, sc.collect_time
						FROM study_collection sc
						LEFT JOIN users u ON sc.userid = u.userid
						WHERE sc.userid = ?";
			
			$sqlParams = array($userID);
			
			$collections = $this->db->query($sql, $sqlParams);
			
			return $collections;
		}
		
		/**
		 * return User's study historys info
		 * 
		 * @param int $userID
		 * @return array
		 */
		public function getUserHistory($userID = null)
		{
			$sql = "SELECT sh.userid, u.account, sh.resource_id, sh.last_study_time
						FROM study_history sh
						LEFT JOIN users u ON sh.userid = u.userid
						WHERE sh.userid = ?";
			
			$sqlParams = array($userID);
			
			$historys = $this->db->query($sql, $sqlParams);
			
			return $historys;
		}
		
		/**
		 * return User's questions info
		 * 
		 * @param int $userID
		 * @return array
		 */
		public function getUserQuestion($userID = null)
		{
			$sql = "SELECT q.userid AS questionerID, u.account AS questioner, q.question_id, q.title, 
						   q.content, q.create_date,q.status_id, qs.status_des
						FROM question q
						LEFT JOIN question_status qs ON q.status_id = qs.status_id
						LEFT JOIN users u ON q.userid = u.userid
						WHERE q.userid = ?";
			
			$sqlParams = array($userID);
			
			$questions = $this->db->query($sql, $sqlParams);
			
			return $questions;
		}
		
		/**
		 * return User's all replies about questions info
		 *
		 * @param int $userID
		 * @return array
		 */
		public function getUserReply($userID = null)
		{
			$sql = "SELECT qr.userid AS replyerID, u.account AS replyer, qr.reply_id, qr.reply_content, 
					qr.reply_date, qr.is_accept, q.userid AS questionerID, u2.account AS questioner, 
					q.question_id, q.title, q.content, q.create_date,q.status_id, qs.status_des
						FROM question_reply qr
						LEFT JOIN question q ON qr.question_id = q.question_id
						LEFT JOIN question_status qs ON q.status_id = qs.status_id 
						LEFT JOIN users u ON qr.userid = u.userid
						LEFT JOIN users u2 ON q.userid = u2.userid
						WHERE qr.userid = ?";
			
			$sqlParam = array($userID);
			
			$replies = $this->db->query($sql, $sqlParam);
			
			return $replies;
		}
		
		/**
		 * return all replies about the specific question via questionID
		 * 
		 * @param int $questionID
		 * @return array
		 */
		public function getReplyByQID($questionID = null)
		{
			$sql = "SELECT qr.userid AS replyerID, u.account AS replyer, qr.reply_id, qr.reply_content, 
						   qr.reply_date, qr.is_accept, q.userid AS questionerID, u2.account AS questioner, 
						   q.question_id, q.title, q.content, q.create_date, q.status_id, qs.status_des
						FROM question_reply qr
						LEFT JOIN question q ON qr.question_id = q.question_id
						LEFT JOIN question_status qs ON q.status_id = qs.status_id 
						LEFT JOIN users u ON qr.userid = u.userid
						LEFT JOIN users u2 ON q.userid = u2.userid
						WHERE q.question_id = ?";
			
			$sqlParam = array($questionID);
			
			$replies = $this->db->query($sql, $sqlParam);
			
			return $replies;
		}
		
		/**
		 * return User's study notes info
		 * 
		 * @param int $userID
		 * @return array
		 */
		public function getUserNote($userID = null)
		{
			$sql = "SELECT sn.userid, u.account, sn.note_id, sn.note_title,
						   sn.note_content, sn.create_date
						FROM study_note sn
						LEFT JOIN users u ON sn.userid = u.userid
						WHERE sn.userid = ?";
			
			$sqlParam = array($userID);
			
			$notes = $this->db->query($sql, $sqlParam);
			
			return $notes;
		}
		
		/**
		 * get tasks released by teacher
		 * 
		 * @param int $userID
		 * @return array
		 */
		public function getUserTask($userID = null)
		{
			$details = $this->getUserDetails($userID, 3);
			
			$classID = $details['class_id'];
			
			$sql = "SELECT rt.task_id, rt.task_title, rt.task_content, rt.major_id, rt.class_id, 
						   rt.userid AS release_teacher, rt.release_time, rt.end_time, 
						   ti.name, m.major_name, c.class_name
						FROM release_task rt
						LEFT JOIN major m ON rt.major_id = m.major_id
						LEFT JOIN class c ON rt.class_id = c.class_id
						LEFT JOIN teacher_items ti ON rt.userid = ti.userid
						WHERE rt.class_id = ?";
			
			$sqlParam = array($classID);
			
			$tasks = $this->db->query($sql, $sqlParam);
			
			return $tasks;
		}
		
		/**
		 * Returns all User ids
		 *
		 * @return array
		 */
		public function getUsers()
		{
			$sql = "SELECT u.*, ac.acc_categoty_name
						FROM users u
						LEFT JOIN account_categories ac ON u.acc_category_id = ac.acc_category_id";
			
			$users = $this->db->query($sql);
			
			return $users;
		}
		
		/**
		 * Returns the current password for a userID (their hashed pasword & nonces)
		 *
		 * @param int $userID
		 * @return array
		 */
		public function getPassword($userID = null)
		{
			$sql = "SELECT password, nonce 
						FROM users
						WHERE userid = ?";
			
			$sqlParam = array($userID);
			
			return $this->db->query($sql, $sqlParam);
		}
		
		/**
		 * Validates the $password for $userID.  This returns in the format used by the Validate class.
		 *
		 * @param int $userID
		 * @param string $currentPassword
		 * @param string $newPassword
		 * @param string $confirmPassword
		 * @return array
		 */
		public function validatePassword($userID = null, $currentPassword = '', $newPassword = '', $confirmPassword = '')
		{
			// Check the password meets the minimum requirements
			if ($newPassword !== $confirmPassword)
			{
				$result = array('status' => false, 'message' => "New & Confirmation password must match");
			}
			
			// Check the password contains at the minimum a number & letter
			if (!preg_match('/[0-9]+/', $newPassword) || !preg_match('/[a-zA-Z]+/', $newPassword) || !(strlen($newPassword) > 7))
			{
				$result = array('status' => false, 'message' => "New password must be alphanumeric and be at least 8 characters long");
			}
			
			$currentData = $this->getPassword($userID);
			
			// Check for current passwords to make sure that their new password is different
			if (md5($newPassword.$currentData['nonce']) == $currentData['password'])
			{
				$result = array('status' => false, 'message' => "New password must be different to your current passwords");
			}	
				
			// Check that the current password is correct
			if (md5($currentPassword.$currentData['nonce']) != $currentData['password'])
			{
				$result = array('status' => false, 'message' => "Current password is incorrect");
			}
		
			// Return the result
			return (isset($result) ? $result : array('status' => true));
		}
		
		/*************************************************************************************
		 * Set functions (update this, insert that..)
		*************************************************************************************/
		
		/**
		 * Sets the content of the specific table.  If $insert is true, an insert
		 * is performed, otherwise an update is run using the other arguments in the where.
		 * $validFields is an array of valid field names in the database table
		 *
		 * @param array $validFields
		 * @param array $data
		 * @param string $table
		 * @param boolean $insert
		 * @param int $userID
		 */
		public function setDetails(array $validFields = array(), array $data = array(), $table = '', $insert = false, $userID = null)
		{
			//$validFields = array('userid', 'name', 'academy_id', 'major_id', 'class_id');
		
			$data = $this->getCleanedData($data, $validFields);
			$params = $this->getParamsForUpdate($data);
		
			if (count($data) == 0 || strlen($params) == 0)
			{
				return false;
			}
		
			if ($insert == true)
			{
				$this->db->query("INSERT INTO {$table} SET {$params}", $data);
			}
			else
			{
				$this->db->query("UPDATE {$table} SET {$params} WHERE userid = {$userID} LIMIT 1", $data);
			}
		
		}
		
		/**
		 * Sets the content of the users table.  If $insert is true, an insert
		 * is performed, otherwise an update is run using the other arguments in the where.
		 * $validFields is an array of valid field names in the database table
		 *
		 * @param array $data
		 * @param boolean $insert
		 * @param int $userID
		 */
		public function setUser(array $data = array(), $insert = false, $userID = null)
		{
			$validFields = array('account', 'password', 'nonce', 'acc_category_id', 'status');
			
			$table = 'users';
			
			$this->setDetails($validFields, $data, $table, $insert, $userID);
		}
		
		/**
		 * Sets the content of the student_items table.  If $insert is true, an insert
		 * is performed, otherwise an update is run using the other arguments in the where.
		 * $validFields is an array of valid field names in the database table
		 *
		 * @param array $data
		 * @param boolean $insert
		 * @param int $userID
		 */
		public function setStudentDetail(array $data = array(), $insert = false, $userID = null)
		{
			$validFields = array('userid', 'name', 'academy_id', 'major_id', 'class_id');
				
			$table = 'student_items';
				
			$this->setDetails($validFields, $data, $table, $insert, $userID);
		}
		
		/**
		 * Sets the content of the teacher_items table.  If $insert is true, an insert
		 * is performed, otherwise an update is run using the other arguments in the where.
		 * $validFields is an array of valid field names in the database table
		 *
		 * @param array $data
		 * @param boolean $insert
		 * @param int $userID
		 */
		public function setTeacherDetail(array $data = array(), $insert = false, $userID = null)
		{
			$validFields = array('userid', 'name', 'academy_id', 'major_id');
		
			$table = 'teacher_items';
		
			$this->setDetails($validFields, $data, $table, $insert, $userID);
		}
		
		/**
		 * Verifies and updates a user's password
		 *
		 * @param arary $data
		 * @param int $bypassCheck
		 * @param int $userID
		 * @return unknown
		 */
		public function setPassword(array $data = array(), $bypassCheck = false, $userID = null)
		{
			// Fetch the current merchant password hash and the nonce
			$userData = $this->db->query("SELECT password, nonce FROM users WHERE userid = ?", array('userID' => $userID));
		
			if ($bypassCheck === true || (md5($data['currentPassword'].$userData['nonce']) == $userData['password']))
			{
				// Create a new nonce and then update the merchant record
				$nonce = md5(microtime().uniqid());
				$newData = array('password' => md5($data['newPassword'].$nonce), 'nonce' => $nonce);
		
				// Save the password
				$this->setMerchant($newData, false, $userID);
		
				return true;
			}
			else
			{
				return false;
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

/* End of file User.php */
/* Location: ./application/libraries/User.php */