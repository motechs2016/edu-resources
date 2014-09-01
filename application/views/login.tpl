<!doctype html>
<html lang="zh-cn">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<link rel="shortcut icon" href="{base_url()}assets/inc/image/title_icon.jpg">
        <title>{$meta_title}</title>
        <!-- CSS -->
        <link href="{base_url()}assets/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="{base_url()}assets/css/bootstrap-responsive.min.css" rel="stylesheet">
        <link href="{base_url()}assets/css/bootstrap-switch.min.css" rel="stylesheet">   
        <link href="{base_url()}assets/inc/css/font-awesome.min.css" rel="stylesheet">
	    <link href="{base_url()}assets/inc/css/templatemo_misc.css" rel="stylesheet">
	   	<link href="{base_url()}assets/inc/css/easy-responsive-tabs.css" rel="stylesheet">
	    <link href="{base_url()}assets/inc/css/templatemo_style.css" rel="stylesheet"> 
	    <link href="{base_url()}assets/inc/css/login.style.css" rel="stylesheet">    
        
        <!-- JS -->
        <script src="{base_url()}assets/js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="{base_url()}assets/js/bootstrap.min.js"></script>
        <script src="{base_url()}assets/js/bootstrap-switch.min.js"></script>
        <script src="{base_url()}assets/js/jquery.cookie.js"></script> 
        <script src="{base_url()}assets/inc/js/jquery.lightbox.js"></script>
		<script src="{base_url()}assets/inc/js/templatemo_custom.js"></script>
	    <script src="{base_url()}assets/inc/js/easyResponsiveTabs.js"></script>  
	    <script src="{base_url()}assets/inc/js/login.js"></script>   
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
	    				<div class="templatemo_mainimg"><img src="{base_url()}assets/inc/image/templatemo_login1.jpg" alt="login img 01"></div>
	    			</div>
					<div class="col-md-3 col-sm-6 templatemo_leftgap">
		            	<div class="templatemo_mainimg templatemo_botgap templatemo_portfotopgap"><img src="{base_url()}assets/inc/image/templatemo_login2.jpg" alt="home img 02"></div>
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
								            	<button class="btn-forget" href="{site_url('login/forgotpassword')}"><i class="glyphicon glyphicon-repeat"></i> Forgot Passowrd</button>
								            </div>
								            <div class="loginsign">
								            	<a href="{site_url('login/signup')}">Sign up now >></a>
								            </div>
								        </div>
								        {if (isset($errorMsg))}
								        <div class="alert alert-danger alert-dismissible" role="alert">
										  <button type="button" class="close" data-dismiss="alert">
											  <span aria-hidden="true">&times;</span>
											  <span class="sr-only">Close</span>
										  </button>
										  {$errorMsg} <span><a href="{site_url('login/forgotpassword')}">Reset Passowrd.</a></span>
										</div>								        
								        {/if}
								        {if (isset($timeout))}
								        <div id="errorPanel">
								        	{$timeout}
								        </div>
								        {/if}
								        {if (!empty($error))}
								        <div id="errorPanel">
								        	{$error}
								        </div>   
								        {/if}
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
</html>