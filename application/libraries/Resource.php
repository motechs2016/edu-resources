<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	
	/**
	 * Resource Class.  Provides all functionality related to resource
	 * and the courses, Any table related to the resources' corpertation
	 * will be most likely represented in this class.
	 *
	 * Please see the per-function comments for more information.
	 *
	 * @author Chong Liu
	 * @copyright 2014 Ivory Tower
	 */
	class Resource{
		
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
		 * Returns all courses
		 * 
		 * @return array
		 */
		public function getAllCourse()
		{
			$sql = "SELECT c.course_id, c.course_name, c.english_name, c.c_category_id,
						   cc.c_category_name, c.description, c.note
						FROM courses c
						LEFT JOIN courses_categories cc ON c.c_category_id = cc.c_category_id";
			
			$courses = $this->db->query($sql);
			
			return $courses;
		}
		
		/**
		 * Returns one course info by courseID
		 * 
		 * @param string $courseID
		 * @return array 
		 */
		public function getCourseByCoid($courseID = '')
		{
			$sql = "SELECT c.course_id, c.course_name, c.english_name, c.c_category_id, cc.c_category_name, 
						   c.description, c.note, cc.parent_id, cc1.c_category_name AS p_c_category_name
						FROM courses c
						LEFT JOIN courses_categories cc ON c.c_category_id = cc.c_category_id
						LEFT JOIN courses_categories cc1 ON cc.parent_id = cc1.c_category_id
						WHERE c.course_id = ?
						LIMIT 1";
			
			$sqlParam = array($courseID);
			
			$course = $this->db->query($sql, $sqlParam);
			
			return $course;
		}
		
		/**
		 * get courses by course categoryID, if the $all is true, get
		 * courses include the child categoryID. 
		 *
		 * @param string $categoryID
		 * @param boolean $all
		 * @return array
		 */
		public function getCourseByCaid($categoryID = '', $all = FALSE)
		{
			if($all == true)
			{
				$sqlwhere = " cc.c_category_id LIKE '{$categoryID}%'";
			}
			else
			{
				$sqlwhere = "cc.c_category_id = ? ";
			}
			
			$sql = "SELECT c.course_id, c.course_name, c.english_name, c.c_category_id,
						   cc.c_category_name, c.description, c.note, cc.parent_id, cc1.c_category_name 
						FROM courses c
						LEFT JOIN courses_categories cc ON c.c_category_id = cc.c_category_id
						LEFT JOIN courses_categories cc1 ON cc.parent_id = cc1.c_category_id
						WHERE {$sqlwhere}";
	
			if($all == true)
			{
				$course = $this->db->query($sql);
			}
			else
			{
				$sqlParam = array($categoryID);
					
				$course = $this->db->query($sql, $sqlParam);
			}		
				
			return $course;
		}
		
		/**
		 * Return the courses' category
		 *
		 * @return array
		 *
		 */
		public function getCourseCategory()
		{
			$sql = "SELECT c_category_id, c_category_name, parent_id, is_parent_node, level
						FROM courses_categories";
				
			return $this->db->query($sql);
		}
		
		/**
		 * Return category by level
		 * 
		 * @param int $level
		 * @return array
		 */
		public function getCourseCategoryByLevel($level = null)
		{
			$sql = "SELECT c_category_id, c_category_name, parent_id, is_parent_node, level
						FROM courses_categories
						WHERE level = ?";
			
			$sqlParam = array($level);
			
			return $this->db->query($sql, $sqlParam);
		}
		
		/**
		 * get course_items via courseID
		 * 
		 * @param string $courseID
		 * @param array
		 */
		public function getCourseItem($courseID = null)
		{
			$sql = "SELECT ci.course_id, ci.chapter_id, ci.chapter_name, ci.is_parent_node, ci.parent_id
						FROM course_items ci
						WHERE ci.course_id = ?";
			
			$sqlParam = array($courseID);
			
			return $this->db->query($sql);
		}
		
		/**
		 * Return the resourses' category
		 *
		 * @return array
		 *
		 */
		public function getResourseCategory()
		{
			$sql = "SELECT resource_category_id, resource_category_name, parent_id, is_parent_node, level
						FROM resource_categories";
		
			return $this->db->query($sql);
		}
		
		/**
		 * Return resourses' category by level
		 *
		 * @param int $level
		 * @return array
		 */
		public function getResourseCategoryByLevel($level = null)
		{
			$sql = "SELECT resource_category_id, resource_category_name, parent_id, is_parent_node, level
						FROM resource_categories
						WHERE level = ?";
				
			$sqlParam = array($level);
				
			return $this->db->query($sql, $sqlParam);
		}
		
		/**
		 * Return all resources' detail
		 * 
		 * @return array
		 */
		public function getAllResource()
		{
			$sql = "SELECT r.resource_id, r.resource_category_id, rc.resource_category_name, ri.resource_name, ri.description,
					ri.key_words, ri.course_id, ri.chapter_id, ri.userid AS uploader, ri.uploaddate, r.audit_id, a.audit_des,
					r.path, ri.translate_path
						FROM resources r 
						LEFT JOIN resource_categories rc ON rc.resource_category_id = r.resource_category_id
						LEFT JOIN resource_items ri ON ri.resource_id = r.resource_id
						LEFT JOIN audit a ON a.audit_id = r.audit_id";
			
			return $this->db->query($sql);
		}
		
		/**
		 * Return resource' detail via resourceID
		 *
		 * @param int $resourceID
		 * @return array
		 */
		public function getResourceByResourceID($resourceID = null)
		{
			$sql = "SELECT r.resource_id, r.resource_category_id, rc.resource_category_name, ri.resource_name, ri.description,
					ri.key_words, ri.course_id, ri.chapter_id, ri.userid AS uploader, ri.uploaddate, r.audit_id, a.audit_des,
					r.path, ri.translate_path
						FROM resources r
						LEFT JOIN resource_categories rc ON rc.resource_category_id = r.resource_category_id
						LEFT JOIN resource_items ri ON ri.resource_id = r.resource_id
						LEFT JOIN audit a ON a.audit_id = r.audit_id
						WHERE r.resource_id = ?";
			
			$sqlParam = array($resourceID);
				
			return $this->db->query($sql, $sqlParam);
		}
		
		/**
		 * Return resource' detail via courceID
		 *
		 * @param string $courceID
		 * @return array
		 */
		public function getResourceByCourseID($courceID = '')
		{
			$sql = "SELECT r.resource_id, r.resource_category_id, rc.resource_category_name, ri.resource_name, ri.description,
					ri.key_words, ri.course_id, ri.chapter_id, ri.userid AS uploader, ri.uploaddate, r.audit_id, a.audit_des,
					r.path, ri.translate_path
						FROM resources r
						LEFT JOIN resource_categories rc ON rc.resource_category_id = r.resource_category_id
						LEFT JOIN resource_items ri ON ri.resource_id = r.resource_id
						LEFT JOIN audit a ON a.audit_id = r.audit_id
						WHERE ri.course_id = ?";
				
			$sqlParam = array($courceID);
		
			return $this->db->query($sql, $sqlParam);
		}
		
		/**
		 * Return resource' detail via courceID and chapterID
		 *
		 * @param string $courceID
		 * @param int $chapterID
		 * @return array
		 */
		public function getResourceByDoubleID($courceID = '', $chapterID = null)
		{
			$sql = "SELECT r.resource_id, r.resource_category_id, rc.resource_category_name, ri.resource_name, ri.description,
					ri.key_words, ri.course_id, ri.chapter_id, ri.userid AS uploader, ri.uploaddate, r.audit_id, a.audit_des,
					r.path, ri.translate_path
						FROM resources r
						LEFT JOIN resource_categories rc ON rc.resource_category_id = r.resource_category_id
						LEFT JOIN resource_items ri ON ri.resource_id = r.resource_id
						LEFT JOIN audit a ON a.audit_id = r.audit_id
						WHERE ri.course_id = ? AND ri.chapter_id = ?";
		
			$sqlParam = array($courceID, $chapterID);
		
			return $this->db->query($sql, $sqlParam);
		}
		
		/**
		 * Return resource' detail via resource_cate_ID
		 *
		 * @param string $RCID
		 * @return array
		 */
		public function getResourceByRCID($RCID = '')
		{
			$sql = "SELECT r.resource_id, r.resource_category_id, rc.resource_category_name, ri.resource_name, ri.description,
					ri.key_words, ri.course_id, ri.chapter_id, ri.userid AS uploader, ri.uploaddate, r.audit_id, a.audit_des,
					r.path, ri.translate_path
						FROM resources r
						LEFT JOIN resource_categories rc ON rc.resource_category_id = r.resource_category_id
						LEFT JOIN resource_items ri ON ri.resource_id = r.resource_id
						LEFT JOIN audit a ON a.audit_id = r.audit_id
						WHERE r.resource_category_id = ?";
		
			$sqlParam = array($RCID);
		
			return $this->db->query($sql, $sqlParam);
		}
		
		/**
		 * get resource heat via resourceID
		 * 
		 * @param int $resourceID
		 * @return array
		 */
		public function getResourceHeatByID($resourceID = null)
		{
			$sql = "SELECT * FROM resource_heat WHERE resource_id = ?";
			
			$sqlParam = array($resourceID);
			
			return $this->db->query($sql);
		}
		
		/**
		 * get resource evaluate via resourceID
		 *
		 * @param int $resourceID
		 * @return array
		 */
		public function getResourceEvaluateByID($resourceID = null)
		{
			$sql = "SELECT re.resource_id, re.userid, re.evaluate_content, re.score, re.evaluate_time, u.account
						FROM resource_evaluate re
						LEFT JOIN users u ON u.userid = re.userid
						WHERE re.resource_id = ?";
				
			$sqlParam = array($resourceID);
				
			return $this->db->query($sql);
		}
		
		/**
		 * get average grade about resource via resourceID
		 * 
		 * @param int $resourceID
		 * @return double $avggrade
		 */
		public function getAvgGradeByID($resourceID = null)
		{
			$sql = "SELECT AVG(score) AS avg_grade FROM resource_evaluate WHERE resoucre_id = ?";
			
			$sqlParam = array($resourceID);
			
			$result = $this->db->query($sql, $sqlParam);
			
			return $result['avg_grade'];
		}
		
		/**
		 * Return the Maximum of the level from the specific table
		 * 
		 * @param string $table
		 * @return array
		 */
		public function getMaxLevel($table = '')
		{
			$sql = "SELECT MAX(level) AS level From {$table}";
				
			$level = $this->db->query($sql);
				
			return $level;
		}
	}
	
/* End of file Resource.php */
/* Location: ./application/libraries/Resource.php */