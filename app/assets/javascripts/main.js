$(document).ready( function() {

	( function() {

		$('.feedback').on('click', function() {
			$(this).fadeOut();
		});

		// Slider functionality
		var currentSliderValue = $('.right-range');

		// Trigger when the slider has changed.
		$('#slider').on('change', function() {

			var amount = parseInt($('#slider').val());

			// If the user is using an older browser then
			// rather than a slider the user will be presented with a text field.
			//
			// The user could then enter anything other than a number, and thats where this
			// check comes in.
			if ( isNaN(amount) ) {
				// Show the user text and tell them they have been bad! Bit weird?
				$('#donation-feedback').text("You must enter a number please!").fadeIn();
				// Reset the amount to 0
    		amount = 0;
			}
			// Show the user the current value when changed.
			currentSliderValue.html("£" + amount );
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

		// Get the twitter steam
		$('#twitter').tweet({
			username: 'jonnothebonno',
			count: 3,
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