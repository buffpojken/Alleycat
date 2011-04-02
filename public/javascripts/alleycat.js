function _s2(){
	var b = $("meta[name=session-value]").attr('content');
	return {'_alleycat_session':b};
}

function _m(){
	return $("meta[name=csrf-token]").attr('content');
}


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

// A move is required for next step - trigger a location fetch, a foursquare search
// and choosing a location
function move(){}

// Select a location of the type required, move on to next act. 
function choose_location(){}

// No locations of the required type is within the area, provide
// directions to closest match (if any found)
function no_suitable_location_found(){}

// Leave the current story, and move to story selection page
function leave_story(){}


$("#locate").live('pageshow', function(e){
	$.mobile.pageLoading();
	navigator.geolocation.getCurrentPosition(function(location){
		$.mobile.pageLoading(true);			
		$.ajax({
			url:'locations', 
			type:'POST', 
			data: {location:location, 'authenticity_token':_m()}, 
			success: function(dat, stat, xhr){
				console.log(dat);
			}, 
			error: function(){
				console.log(arguments);
			}
		})
	},function(error){
		alert("Error - need location!");
		$.mobile.pageLoading(true);			
	});
})
