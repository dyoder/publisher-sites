$(document).ready( function() { 
  
  var main = $('div.main');
  if ( main.height() > 560 ) {
    main.css({'overflow-y': 'scroll'}).height(560);
  } else {
    main.height(560);
  }
  
  $('img.thumbnail').hover( 
    function() { $(this).addClass('hover') }, 
    function() { $(this).removeClass('hover')} );
    
	var logo = $('h1.logo');
	logo.parent().append(
		"<img style='display:none' class='logo' src='http://studio.zeraweb.com/s/heading?"+
		( 's='+logo.text()+
			'&h='+logo.height()+
			'&w='+logo.width()+
			'&c='+logo.css('color')+
			'&bg='+logo.css('background-color')+
			'&f='+logo.css('font-family')+
			'&p='+logo.css('font-size')+
			'&l='+logo.css('letter-spacing')+
			"'/>"
		).replace(/(\s+|\#)/g,''));
	$('img.logo').load( function() {
	  logo.remove(); $(this).fadeIn(2000); 
	});
});
