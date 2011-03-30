$(function(){
	_l();
});

function _l(){
	$(".unobtrusive").live('click',function(e){
		e.preventDefault();
		t = e.currentTarget;
		if(t.disabled){return;}
		f = window[t.getAttribute('func')];
		f.element = t;
		f(e);
	});
}


function login(){
	FB.ui({
		method:'auth.login', 
		display:'touch'
	}, function(r){
		console.log(r);
	})
}

$("#locate").live('pageshow', function(e){
	$.mobile.pageLoading();
	navigator.geolocation.getCurrentPosition(function(location){
		$.mobile.pageLoading(true);			
		alert(location.coords.longitude);
		alert(location.coords.latitude);
	},function(error){
		alert("Error - need location!");
		$.mobile.pageLoading(true);			
	});
})
