$(function(){ 
	_l();
	// Preload images
	$.preloadCssImages();
	
	$('.nav li a').each(function()
		{
			$(this).click(function(){
				$('.nav li a').removeClass('selected');
				$('.popup').css('display', 'none');
				
				$(this).addClass('selected');
				
				var popup = $(this).parent().find('.popup');
				
				//if has submenu
				if(popup.length > 0)
				{
					//get the position of the placeholder element
  					var pos = $(this).parent().offset();  
  					var width = $(this).parent().width();
  					var popupPos = pos.left-80+(width/2)+1;

  					//show the menu directly over the placeholder
  					popup.css( { "left": popupPos + "px", "top":pos.top + 60 + "px" } );
  					popup.show();
  					
  					return false;
				}
			});
		}
	);
		
	
	$('div.option').each(function(i,e){
		$(e).find('div.text').html($(e).find('option:selected').text().substring(0,18));
		$(e).find('select').change(function(){
			$(this).parent().find('div.text').html($(this).find('option:selected').text().substring(0, 18)+"...");			
		})
	});

	
	// Setup style of input file
	$('div.file').find('input:first').change(function(){
		$(this).css('top', '-18px');
		var filename = $(this).val().replace(/^.*\\/, '').substr(0, 24);
		$(this).parent().find('div.text').html(filename);
	});
	
	$('.media_photos li').mouseenter(function(){
		$(this).find('.action').css('visibility', 'visible');
	});
	
	$('.media_photos li').mouseleave(function(){
		$(this).find('.action').css('visibility', 'hidden');
	});
	
	// Setup datepicker input
	$("#datepicker").datepicker({
		nextText: '&raquo;',
		prevText: '&laquo;',
		showAnim: 'slideDown'
	});
	$('div.date').find('input:first').change(function(){
		if (BrowserDetect.browser != "Explorer")
		{
			$(this).css('top', '-21px');
		}
		else
		{
			if(BrowserDetect.version > 7)
			{
				$(this).css('top', '-21px');
			}
			else
			{
				$(this).css('top', '-10px');
			}
		}
		
		$(this).parent().find('div.text').html($(this).val());
	});
	
	// Setup click to hide to all alert boxes
	$('.alert_warning').click(function(){
		$(this).fadeOut('fast');
	});
	
	$('.alert_info').click(function(){
		$(this).fadeOut('fast');
	});
	
	$('.alert_success').click(function(){
		$(this).fadeOut('fast');
	});
	
	$('.alert_error').click(function(){
		$(this).fadeOut('fast');
	});
	
	// Setup modal window for all photos
	$('.media_photos li a[rel=slide]').fancybox({
		padding: 0, 
		titlePosition: 'outside', 
		overlayColor: '#333333', 
		overlayOpacity: .2
	});
	
});

$(document).ready(function() {
	
	// Find all the input elements with title attributes and add hint to it
    $('input[title!=""]').hint();
	
	setTimeout(function(){ 
		
		// Setup graph
    	$('#graph_data').visualize({
			type: 'line',
			width: '760px',
			height: '240px',
			colors: ['#26ADE4', '#D1E751']
		}).appendTo('#graph_wrapper');
		
		$('.visualize').trigger('visualizeRefresh');
		
	}, 500);
	
	$('.wysiwyg').css('width', '100%');
    
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
