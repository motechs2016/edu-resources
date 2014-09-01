<div data-spy="affix" style="width: 17%">
<div class="nav ">
    <div class="nav nav-pills nav-stacked list-group">
         <a class="list-group-item {if ($pageID == 'dashboard')}active{/if}" href="{site_url('dashboard')}">Dashboard</a>
         <a class="list-group-item {if ($pageID == 'user')}active{/if}" href="{site_url('user')}">Admin manager</a>
         <a class="list-group-item {if ($pageID == 'homepage')}active{/if}" href="{site_url('homepage')}">Homepage manager</a>
         <a class="list-group-item {if ($pageID == 'aboutus')}active{/if}" href="{site_url('aboutus')}">About us manager</a>
         <a class="list-group-item {if ($pageID == 'program_service')}active{/if}" href="{site_url('program_service')}">Program&Service manager</a> 
         <a class="list-group-item {if ($pageID == 'patient_form')}active{/if}" href="{site_url('patient_form')}">Patient form manager</a>  
         <a class="list-group-item {if ($pageID == 'contactus')}active{/if}" href="{site_url('contactus')}">Contact us</a>  
    </div>                	
</div>	
<section>
    <a href="mailto:mxlclc@163.com"><i class="glyphicon glyphicon-send"></i> mxlclc@163.com</a><br>
    <a href="{site_url('user/logout')}"><i class="glyphicon glyphicon-off"></i> log out</a>
</section>
</div>