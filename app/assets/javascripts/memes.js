// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

var vote_ready = function() {

	var color_arrows = function(val, up_arrow, down_arrow) {
		// If val = -1, set upvote color, clear downvote color
		// if val = 0, clear both colors
		// if val = 1, set downvote color, clear upvote color,

		if (val == 1) {
			up_arrow.css("color", "#41be47");
			down_arrow.css("color", "");
		}
		else if (val == 0) {
			up_arrow.css("color", "");
			down_arrow.css("color", "");
		}
		else { // val == -1
			up_arrow.css("color", "");
			down_arrow.css("color", "red");
		}
	};

	$('.up-vote-button').on("click", function () {

		console.log(1);
		var memeid = $(this).data("memeid");
		var up_arrow = $(this).find('.glyphicon-arrow-up');
		var down_arrow = $(this).parent().find('.glyphicon-arrow-down');
		var vote_url = "/memes/" + memeid + "/upvote";

		$.ajax({
			type : "POST",
			url : vote_url,
			data : {
				val: true
			}, //upvote

			success: function upVote(result) {
				color_arrows(result, up_arrow, down_arrow);
			}
		})
	});

	$('.down-vote-button').on("click", function () {
		var memeid = $(this).data("memeid");
		var down_arrow = $(this).find('.glyphicon-arrow-down');
		var up_arrow = $(this).parent().find('.glyphicon-arrow-up');
		var vote_url = "/memes/" + memeid + "/downvote";

		$.ajax({
			type : "POST",
			url : vote_url,
			data : {
				val: false
			}, //upvote

			success: function upVote(result) {
				color_arrows(result, up_arrow, down_arrow);
			}
		})
	});

};

$(document).on('turbolinks:load', vote_ready);
