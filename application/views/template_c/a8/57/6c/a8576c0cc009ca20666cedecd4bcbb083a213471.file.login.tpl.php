<?php /* Smarty version Smarty-3.1.19, created on 2014-08-17 10:37:22
         compiled from "application\views\login.tpl" */ ?>
<?php /*%%SmartyHeaderCode:223553ed85d8b75d77-17413939%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a8576c0cc009ca20666cedecd4bcbb083a213471' => 
    array (
      0 => 'application\\views\\login.tpl',
      1 => 1408243038,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '223553ed85d8b75d77-17413939',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_53ed85d8bc0104_17182880',
  'variables' => 
  array (
    'meta_title' => 0,
    'errorMsg' => 0,
    'timeout' => 0,
    'error' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_53ed85d8bc0104_17182880')) {function content_53ed85d8bc0104_17182880($_smarty_tpl) {?><!doctype html>
<html lang="zh-cn">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<link rel="shortcut icon" href="<?php echo base_url();?>
assets/inc/image/title_icon.jpg">
        <title><?php echo $_smarty_tpl->tpl_vars['meta_title']->value;?>
</title>
        <!-- CSS -->
        <link href="<?php echo base_url();?>
assets/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="<?php echo base_url();?>
assets/css/bootstrap-responsive.min.css" rel="stylesheet">
        <link href="<?php echo base_url();?>
assets/css/bootstrap-switch.min.css" rel="stylesheet">   
        <link href="<?php echo base_url();?>
assets/inc/css/font-awesome.min.css" rel="stylesheet">
	    <link href="<?php echo base_url();?>
assets/inc/css/templatemo_misc.css" rel="stylesheet">
	   	<link href="<?php echo base_url();?>
assets/inc/css/easy-responsive-tabs.css" rel="stylesheet">
	    <link href="<?php echo base_url();?>
assets/inc/css/templatemo_style.css" rel="stylesheet"> 
	    <link href="<?php echo base_url();?>
assets/inc/css/login.style.css" rel="stylesheet">    
        
        <!-- JS -->
        <script src="<?php echo base_url();?>
assets/js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="<?php echo base_url();?>
assets/js/bootstrap.min.js"></script>
        <script src="<?php echo base_url();?>
assets/js/bootstrap-switch.min.js"></script>
        <script src="<?php echo base_url();?>
assets/js/jquery.cookie.js"></script> 
        <script src="<?php echo base_url();?>
assets/inc/js/jquery.lightbox.js"></script>
		<script src="<?php echo base_url();?>
assets/inc/js/templatemo_custom.js"></script>
	    <script src="<?php echo base_url();?>
assets/inc/js/easyResponsiveTabs.js"></script>  
	    <script src="<?php echo base_url();?>
assets/inc/js/login.js"></script>   
    </head>
    
    <body>
    	<!-- logo start -->
	    <div class="logocontainer">
	    	<div class="row">
	        	<h1><a href="#">Ivory Tower</a></h1>
	            <div class="clear"></div>
	            <div class="templatemo_smalltitle">Share Education Resources</div>
	       </div>
	    </div>
	    <!-- logo end --> 
	    <div id="menu-container" class="main_menu">
	    	<!-- homepage start -->
	    	<div class="content homepage" id="menu-1">
	    		<div class="container">
	    			<div class="col-md-3 col-sm-6 templatemo_leftgap">
	    				<div class="templatemo_mainstudy templatemo_botgap">
                			<div class="templatemo_link"><a class="show-2 templatemo_page2" href="#">Study</a></div>
                	
               			</div>
	    				<div class="templatemo_mainimg"><img src="<?php echo base_url();?>
assets/inc/image/templatemo_login1.jpg" alt="login img 01"></div>
	    			</div>
					<div class="col-md-3 col-sm-6 templatemo_leftgap">
		            	<div class="templatemo_mainimg templatemo_botgap templatemo_portfotopgap"><img src="<?php echo base_url();?>
assets/inc/image/templatemo_login2.jpg" alt="home img 02"></div>
		                <div class="templatemo_maincommunicate">
		                      <div class="templatemo_link"><a class="show-3 templatemo_page3" href="#">Communicate</a></div>
		                	                   
		                </div>
		            </div>	
		            <div class="col-md-3 col-sm-6 templatemo_leftgap">
		            	<div class="login_bg">
		            		<div class="loginfieldset1"></div>
		            		<div class="loginfieldset">
		            			<div class="login_head">Please Login</div>
		            			<div id="midder">
								    <form name="login" id="loginform" method="post" action="" role="form" >
								        <div id="loginbox">
								        	<div class="loginInput">
								            	<input id="account" name="account" type="text" autocomplete="off" placeholder="your accout">
								            </div>
								            <div class="loginInput">
								            	<input id="password" name="password" type="password" autocomplete="off" placeholder="your password">
								            </div>
								            <div class="loginCheck">
								            	<input id="remember" type="checkbox" checked=fasle name="remember"> &nbsp;Remember me
								            </div>
								            <div class="loginChoice">
								            	<input type="submit" value="" id="login" name="login" class="btn-sub" >
								            </div> 
								            <div class="loginforget">
								            	<button class="btn-forget" href="<?php echo site_url('login/forgotpassword');?>
"><i class="glyphicon glyphicon-repeat"></i> Forgot Passowrd</button>
								            </div>
								            <div class="loginsign">
								            	<a href="<?php echo site_url('login/signup');?>
">Sign up now >></a>
								            </div>
								        </div>
								        <?php if ((isset($_smarty_tpl->tpl_vars['errorMsg']->value))) {?>
								        <div class="alert alert-danger alert-dismissible" role="alert">
										  <button type="button" class="close" data-dismiss="alert">
											  <span aria-hidden="true">&times;</span>
											  <span class="sr-only">Close</span>
										  </button>
										  <?php echo $_smarty_tpl->tpl_vars['errorMsg']->value;?>
 <span><a href="<?php echo site_url('login/forgotpassword');?>
">Reset Passowrd.</a></span>
										</div>								        
								        <?php }?>
								        <?php if ((isset($_smarty_tpl->tpl_vars['timeout']->value))) {?>
								        <div id="errorPanel">
								        	<?php echo $_smarty_tpl->tpl_vars['timeout']->value;?>

								        </div>
								        <?php }?>
								        <?php if ((!empty($_smarty_tpl->tpl_vars['error']->value))) {?>
								        <div id="errorPanel">
								        	<?php echo $_smarty_tpl->tpl_vars['error']->value;?>

								        </div>   
								        <?php }?>
								    </form>              
								</div>
		            		</div>
		            	</div>
		            </div>	
	    		</div>
	    	</div>
	    </div>
	    <!-- logo start -->
	    <div class="logocontainer">
	    	<div class="row">
	            <div class="templatemo_footer">Copyright &copy; 2014 Chong Liu - </div>
	       </div>
	    </div>
    <!-- logo end -->    
    </body>
</html><?php }} ?>
