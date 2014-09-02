<!doctype html>
<html lang="zh-cn">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<link rel="shortcut icon" href="{base_url()}assets/inc/image/title_icon.jpg">
        <title>{$meta_title}</title>
        <!-- Bootrap -->
        <!-- 
        <link href="{base_url()}assets/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="{base_url()}assets/css/bootstrap-responsive.min.css" rel="stylesheet">
         -->
        <link href="{base_url()}assets/css/metro-bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="{base_url()}assets/css/metro-bootstrap-responsive.min.css" rel="stylesheet">
        <link href="{base_url()}assets/css/iconFont.min.css" rel="stylesheet">
        <script src="{base_url()}assets/js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <!-- 
        <script src="{base_url()}assets/js/bootstrap.min.js"></script>
         -->
        <script src="{base_url()}assets/js/jquery.widget.min.js"></script>
        <script src="{base_url()}assets/js/metro.min.js"></script>
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
			    			{foreach from=$pmenus item=pmenu}
			    				{if ($pmenu->is_parent_node == 1)}
			    				<li>
			    					<a class="dropdown-toggle" href="#">{$pmenu->menu_title}</a>
			    					<ul class="dropdown-menu" data-role="dropdown">
			    						{foreach from=$cmenus item=cmenu}
			    							{if ($cmenu->parent_id == $pmenu->menu_id)}
			    								<li><a href="{$cmenu->url}">{$cmenu->menu_title}</a></li>
			    							{/if}
			    						{/foreach}
			    					</ul>
			    				</li>
			    				{else}
			    				<li>
			    					<a href="{$pmenu->url}">{$pmenu->menu_title}</a>
			    				</li>
			    				{/if}		
			    			{/foreach}
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
						{$account}
						{if (isset($img))}
							<img src="{$img}"/>
						{/if}
						</button>
	    		</nav>
	    	</nav>
	    