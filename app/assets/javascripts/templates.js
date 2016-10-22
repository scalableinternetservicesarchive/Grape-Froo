$(document).ready(function() {
  $('#template-search-button').click(function() {
    $.post('/templates/search', {
      name: $('#template-search').val()
    });
  })
});