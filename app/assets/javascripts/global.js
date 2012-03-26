// if (history && history.pushState) {
//   $(function() {
//     $("footer ul li a, .location ul li a, .tags ul li a").live("click", function(e) {
//       $.getScript(this.href);
//       history.pushState(null, document.title, this.href);
//       e.preventDefault();
//     });
//     $(".search input").keyup(function() {
//       $.get($("#products_search").attr("action"), $("#products_search").serialize(), null, "script");
//       history.replaceState(null, document.title, $("#products_search").attr("action") + "?" + $("#products_search").serialize());
//     });
//     $(window).bind("popstate", function() {
//       $.getScript(location.href);
//     });
//   });
// };

$(document).ready(function($) {


	// Pages - Carousel Partial
	$('.carousel').carousel({
		interval: 100000
	});
	$('.carousel-previous-button').click(function() {
		$('.carousel').carousel('prev');
	});
	$('.carousel-forward-button').click(function() {
		$('.carousel').carousel('next');
	});
	// end

	// Pages - Carousel Keyboard Navigation
	// Left and Right Keys on keyup() maybe switch to keypress() or keydown()
	$(document.documentElement).keyup(function (event) {
		if (event.keyCode == 37) {
			$('.carousel').carousel('prev');
		} else if (event.keyCode == 39) {
			$('.carousel').carousel('next');
		}
	});

	// Spacebar Key
	// $(document.documentElement).keypress(function (event) {
	// 	if (event.keyCode == 32) {
	// 		$('.carousel').carousel('next');
	// 		event.preventDefault();
	// 	}
	// });

	// Pages - Favorite Buttom
	$('.btn-favorite').click(function(e) {
		$('.favorite form').submit();
		e.preventDefault();
	});
	// end

	// This is a cool height fix but fixed positioning with top side and bottom = 0 works better.
	// // Pages - Carousel Buttons
	// $(window).resize(function() {
	// 	var pageheight = $(window).height();
	// 	$('.carousel-previous-button, .carousel-forward-button').height(pageheight);
	// });
	// // end

});