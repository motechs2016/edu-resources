<?php /* Smarty version Smarty-3.1.19, created on 2014-09-02 12:02:52
         compiled from "application\views\inc\page_head.tpl" */ ?>
<?php /*%%SmartyHeaderCode:410554051d644b4902-56052168%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a75df92da7b092350478df1cd04177ed126936ba' => 
    array (
      0 => 'application\\views\\inc\\page_head.tpl',
      1 => 1409630569,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '410554051d644b4902-56052168',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.19',
  'unifunc' => 'content_54051d64521f17_02533169',
  'variables' => 
  array (
    'meta_title' => 0,
    'pmenus' => 0,
    'pmenu' => 0,
    'cmenus' => 0,
    'cmenu' => 0,
    'account' => 0,
    'img' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_54051d64521f17_02533169')) {function content_54051d64521f17_02533169($_smarty_tpl) {?><!doctype html>
<html lang="zh-cn">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<link rel="shortcut icon" href="<?php echo base_url();?>
assets/inc/image/title_icon.jpg">
        <title><?php echo $_smarty_tpl->tpl_vars['meta_title']->value;?>
</title>
        <!-- Bootrap -->
        <!-- 
        <link href="<?php echo base_url();?>
assets/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="<?php echo base_url();?>
assets/css/bootstrap-responsive.min.css" rel="stylesheet">
         -->
        <link href="<?php echo base_url();?>
assets/css/metro-bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="<?php echo base_url();?>
assets/css/metro-bootstrap-responsive.min.css" rel="stylesheet">
        <link href="<?php echo base_url();?>
assets/css/iconFont.min.css" rel="stylesheet">
        <script src="<?php echo base_url();?>
assets/js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <!-- 
        <script src="<?php echo base_url();?>
assets/js/bootstrap.min.js"></script>
         -->
        <script src="<?php echo base_url();?>
assets/js/jquery.widget.min.js"></script>
        <script src="<?php echo base_url();?>
assets/js/metro.min.js"></script>
    </head>
    
    <body class="metro">
    	<div class="container">
	    	<nav class="navigation-bar dark">
	    		<nav class="navigation-bar-content">
		    		<div class="clearfix on-left-more">
		    			<div class="place-right">
		    				<form>
		    					<div class="input-control text size6 margin20 nrm">
			    					<input type="text" placeholder="Serach...">
			    					<button class="btn-search"></button>
		    					</div>
		    				</form>
		    			</div>
		    			
		    			<div class="place-left">		    		
			    			<h1>
				    			<a href="#">
				    				&nbsp;&nbsp;<i class="icon-cone"></i> Ivory Tower
				    			</a>
			    			</h1>
		    			</div>
		    		</div>
		    		
	    		</nav>
	    		<nav class="navigation-bar-content">

		    			<ul class="element-menu">
			    			<?php  $_smarty_tpl->tpl_vars['pmenu'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['pmenu']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['pmenus']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['pmenu']->key => $_smarty_tpl->tpl_vars['pmenu']->value) {
$_smarty_tpl->tpl_vars['pmenu']->_loop = true;
?>
			    				<?php if (($_smarty_tpl->tpl_vars['pmenu']->value->is_parent_node==1)) {?>
			    				<li>
			    					<a class="dropdown-toggle" href="#"><?php echo $_smarty_tpl->tpl_vars['pmenu']->value->menu_title;?>
</a>
			    					<ul class="dropdown-menu" data-role="dropdown">
			    						<?php  $_smarty_tpl->tpl_vars['cmenu'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['cmenu']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['cmenus']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['cmenu']->key => $_smarty_tpl->tpl_vars['cmenu']->value) {
$_smarty_tpl->tpl_vars['cmenu']->_loop = true;
?>
			    							<?php if (($_smarty_tpl->tpl_vars['cmenu']->value->parent_id==$_smarty_tpl->tpl_vars['pmenu']->value->menu_id)) {?>
			    								<li><a href="<?php echo $_smarty_tpl->tpl_vars['cmenu']->value->url;?>
"><?php echo $_smarty_tpl->tpl_vars['cmenu']->value->menu_title;?>
</a></li>
			    							<?php }?>
			    						<?php } ?>
			    					</ul>
			    				</li>
			    				<?php } else { ?>
			    				<li>
			    					<a href="<?php echo $_smarty_tpl->tpl_vars['pmenu']->value->url;?>
"><?php echo $_smarty_tpl->tpl_vars['pmenu']->value->menu_title;?>
</a>
			    				</li>
			    				<?php }?>		
			    			<?php } ?>
		    			</ul>
		    						
		    			<div class="element place-right">		
		    				<div class="icon-cog"></div>
							<div id="header-details-hover" style="display:none;">
								<div class="icon-cog"></div>
								<section id="header-details-content">
									<ul>
										<li><a href="/merchantDetailsContact">Study History</a></li>
										<li><a href="/merchantDetailsBilling">My Collections</a></li>
										<li><a href="/merchantDetailsInvoice">MY Tasks</a></li>
									</ul>
									<hr>
									<br/>
									<ul>
										<li><a href="/accountPrefPassword">Change Password</a></li>
										<li><a href="/accountPrefSettings">Change Portrait</a></li>
										<li><a href="/accountPrefSettings">Edit Data</a></li>
									</ul>
								</section>
							</div>
		    			</div><!-- config -->
		    			<span class="element-divider place-right"></span>
						<span class="element-divider place-right"></span>
						<button class="element image-button image-left place-right">
						<?php echo $_smarty_tpl->tpl_vars['account']->value;?>

						<?php if ((isset($_smarty_tpl->tpl_vars['img']->value))) {?>
							<img src="<?php echo $_smarty_tpl->tpl_vars['img']->value;?>
"/>
						<?php }?>
						</button>
	    		</nav>
	    	</nav>
	    <?php }} ?>
