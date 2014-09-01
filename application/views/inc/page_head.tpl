<!doctype html>
<html lang="zh-cn">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<link rel="shortcut icon" href="{base_url()}assets/inc/image/title_icon.jpg">
        <title>{$meta_title}</title>
        <!-- Bootrap -->
        <link href="{base_url()}assets/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="{base_url()}assets/css/bootstrap-responsive.min.css" rel="stylesheet">
        <link href="{base_url()}assets/inc/css/style.menu.css" rel="stylesheet">
        <script src="{base_url()}assets/js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="{base_url()}assets/js/bootstrap.min.js"></script>
    </head>
    
    <body>
    	<div class="navbar navbar-static-top navbar-inverse" role="navigation">
    	<div class="navbar-inner">
        	<div class="container">
            	<div class="nav-header pull-left">
                    <!-- <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button> -->
                    
                    <a class="navbar-brand " href="{site_url(dashboard)}"><span class="glyphicon glyphicon-tree-conifer "></span> {$meta_title}</a>
                </div>
                <div class="nav-header pull-right" role="navigation">
                	<ul class="nav ">
                    	<li class="grey">
                        	<a class="dropdown-toggle" href="#" data-toggle="dropdown">
                                <i class="glyphicon glyphicon-user"></i>
                                <small> Welcome,</small>
                                {$email}
                                <i class="caret "></i>
                            </a> 
                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
                            	<li>
                                	<a href="#">
                                    	<i class="glyphicon glyphicon-cog"></i>
                                        Settings
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                	<a href="{site_url('user/logout')}">
                                    	<i class="glyphicon glyphicon-off"></i>
                                        Logout
                                    </a>    
                            	</li>
                            </ul>                          
                        </li>
                    </ul>
                </div>
                
            </div>
        </div>
    </div> <!-- navbar end-->
    