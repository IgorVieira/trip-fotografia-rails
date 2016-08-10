$(document).ready(function(){
	var offset = 220;
	var duration = 700;
	$(window).scroll(function() {
		if ($(this).scrollTop() > offset) {
			$('.topo').fadeIn(duration);
		} else {
			$('.topo').fadeOut(duration);
		}
	});

	$('.topo').click(function(event) {
		event.preventDefault();
		jQuery('html, body').animate({scrollTop: 0}, duration);
		return false;
	})
});