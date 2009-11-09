$(document).ready( function() { 
  //$.ajax({ type: 'get', url: '/donate',
  //  beforeSend : function(xhr) {  xhr.setRequestHeader('Accept','text/html-fragment') },
  //  success: function( html ) {
  //    $('div.donate-form').replaceWith( html ); 
  //}});

//	$('.submit').click( function() {
//	    var form = $('form');
//	    var failed = form.find('.required')
//	      .filter( function() { return $(this).val() == '' ; } )
//	      .addClass('error')
//	      .after("<p class='error'>Required field.</p>");
//	    if ( failed.size() == 0 ) {
//			form.submit(); 
//		}
//	    return false;
//	});
//	
    $('a.popup').boxen({ width: 1100, height: 600 });
});
