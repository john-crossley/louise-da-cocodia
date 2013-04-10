$(document).ready( function() {

	( function() {

		// Slider functionality
		var currentSliderValue = $('.right-range');

		$('#slider').on('change', function() {
			currentSliderValue.html("£" + this.value);
		});

		$('.timeline ul li').hover( function() {
			$this = $(this);

			$this.animate({
				fontSize: '22px'
			}, 200);
		}, function() {
			$this.animate({
				fontSize: '14px'
			}, 200);
		});

		// twitter stream
		$('#twitter').tweet({
			username: 'jonnothebonno',
			count: 2,
			retweets: false,
			loading_text: 'Loading tweets...'
		});


		$("header nav ul li").hover(function() {
			if ( $(this).find("ul").size != 0 ) {
				$(this).find("ul:first").stop(true, true).fadeIn(300);
			}
		}, function() {
			$(this).find("ul:first").stop(true, true).fadeOut(300);
		});
	})();

});