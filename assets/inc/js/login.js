function showhide()
{
	var div = document.getElementById("newpost");
	if (div.style.display !== "none") 
	{
		div.style.display = "none";
	}
	else 
	{
		div.style.display = "block";
	}
}

function change(){
	//$('#remember').bootstrapSwitch('toggleState');
	if($('#remember').prop('checked')){
		$.cookie('rmbaccount', 'true', {path: '/', expires: 7});
		$.cookie('account', $('#account').val(), {path: '/', expires: 7});
	}else{
		$.cookie('rmbaccount', 'false', {path: '/', expires: -1});
		$.cookie('account', '', {path: '/', expires: -1});
	}	
}


$(function(){

	$('#remember').bootstrapSwitch('state', false);
	$('#remember').bootstrapSwitch('size', 'mini');
	$('#remember').bootstrapSwitch('onColor', 'warning');
	
	if($.cookie('rmbaccount') == 'true'){
		//alert($.cookie('account'));
		$('#account').val($.cookie('account'));
		$('#remember').bootstrapSwitch('state', true);
	}
	
	/*$('#remember').on('switch-change', function (e, data) {
	    var $el = $(data.el)
	      , value = data.value;
	    console.log(e, $el, value);
	});*/
	$("#login").bind("click", function(e){
		e.preventDefault();
		//check the account and password 
		var $account = $('#account').val();
		var $password = $('#password').val();	
		if($account == ''){
			$('#account').popover({
				content: 'Account can not be empty!',
				delay: { show: 500, hide: 100 },
				placement: 'right',
				template: '<div class="popover" role="tooltip" style="width: 250px;"><div class="arrow"></div><div class="popover-content"></div></div>'
			});
			
			$('#account').popover('show');
			$('#account').on('shown.bs.popover', function () {
				  $('#account').popover('hide');
				});
			return false;
		}
		if($password == ''){
			$('#password').popover({
				content: 'Password can not be empty!',
				delay: { show: 500, hide: 100 },
				placement: 'right',
				template: '<div class="popover" role="tooltip" style="width: 250px;"><div class="arrow"></div><div class="popover-content"></div></div>'
			});
			$('#password').popover('show');
			$('#password').on('shown.bs.popover', function () {
				  $('#password').popover('hide');
				});
			return false;
		}
		
		//check the remember me checkbox
		if($('#remember').prop('checked')){
			if($account != ''){
				$.cookie('rmbaccount', 'true', {path: '/', expires: 7});
				$.cookie('account', $account, {path: '/', expires: 7});		
			}			
		}else{
			$.cookie('rmbaccount', 'false', {path: '/', expires: -1});
			$.cookie('account', '', {path: '/', expires: -1});
		}
		
		if($account != '' && $password != ''){
			//submit
			$.ajax({
				url: 'login/log_in',
				type: 'POST',
				cache: false,
				data: $("#loginform").serialize(),
				dataType: 'json',
				success: function(msg) {
					if(msg.flag == 'success'){
						location.href = msg.redirect;
					}else{
						//location.href = msg.redirect;
						$('#loginform')[0].reset();
						if($.cookie('rmbaccount') == 'true'){
							$('#account').val($.cookie('account'));
							$('#remember').bootstrapSwitch('state', true);
						}else{
							$('#account').val('');
							$('#remember').bootstrapSwitch('state', false);
						}
						//show the error
						$('#login').popover({
							content: msg.errorMsg,
							delay: { show: 500, hide: 1000 },
							placement: 'right',
							template: '<div class="popover" id="loginpopover" role="tooltip" style="width: 350px;"><div class="arrow"></div><div class="popover-content"></div></div>'
						});
						
						$('#login').popover('show');
						$('#loginpopover').on('show.bs.popover', function () {
							$('#login').popover('hide');
							
						});
						
					}
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
                    //alert('XMLHttpRequest.status: '+XMLHttpRequest.status);
                    //alert('XMLHttpRequest.readyState: '+XMLHttpRequest.readyState);
                    alert('textStatus: '+textStatus);
                } 
			});
		}
	});
})