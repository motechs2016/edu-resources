<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$config['cache_lifetime']  = 30*24*3600; 	//��������
$config['caching'] 		   = FALSE;		//�Ƿ�ʹ�û��棬��Ŀ�ڵ����ڼ䣬���������û���
$config['template_dir']    = APPPATH.'views'; 		//����ģ��Ŀ¼
$config['compile_dir']     = APPPATH.'views/template_c';		//���ñ���Ŀ¼
$config['cache_dir']       = APPPATH.'views/cache';		//�����ļ���
$config['use_sub_dirs']    = TRUE; 		//��Ŀ¼�������Ƿ��ڻ����ļ�����������Ŀ¼��
$config['left_delimiter']  = '{';
$config['right_delimiter'] = '}';

/* End of file smarty.php*/
/* Location: ./application/config/smarty.php */