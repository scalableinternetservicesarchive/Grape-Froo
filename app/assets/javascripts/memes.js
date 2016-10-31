// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$('.up-vote-button').on("click", function () {
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
			if (result.created_upvote === true) { // upvote created
				up_arrow.css("color", "#41be47");
			}
			else {// upvote deleted
				up_arrow.css("color", "");
			}

			if (result.deleted_downvote === true) { // downvote deleted
				down_arrow.css("color", "");
			}
			else{

			} // downvote didnt exist
		}
	})
})

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
			if (result.created_downvote === true) { // downvote created
				down_arrow.css("color", "red");
			}
			else {// downvote deleted
				down_arrow.css("color", "");
			}

			if (result.deleted_downvote === true) { // upvote deleted
				up_arrow.css("color", "");
			}
			else{

			} // upvote didnt exist
		}
	})
})