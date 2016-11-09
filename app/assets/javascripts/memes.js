// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

var vote_ready = function() {

  var color_arrows = function(val, up_arrow, down_arrow) {
    // If val = 1, set upvote color, clear downvote color
    // if val = 0, clear both colors
    // if val = -1, set downvote color, clear upvote color,

    if (val == 1) {
      up_arrow.css("color", "#41be47");
      down_arrow.css("color", "");
    } else if (val == 0) {
      up_arrow.css("color", "");
      down_arrow.css("color", "");
    } else { // val == -1
      up_arrow.css("color", "");
      down_arrow.css("color", "red");
    }
  };

  $("[class$='vote-button']").on("click", function() {
    var memeid = $(this).data("memeid");
    var up_arrow = $(this).parent().find('.glyphicon-arrow-up')
    var down_arrow = $(this).parent().find('.glyphicon-arrow-down')
    var value = $(this).attr('class').indexOf('up') != -1; // true for upvote
    value = value ? 1 : -1;
    var vote_url = "/memes/" + memeid + "/vote";

    $.ajax({
      type: "POST",
      url: vote_url,
      data: {'value': value},
      success: function(result) {
        color_arrows(result, up_arrow, down_arrow);
      }
    })
  });
};

$(document).on('turbolinks:load', vote_ready);
