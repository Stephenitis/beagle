var Results = {
  init: function() {
    $('form').on('ajax:success', this.appendResults);
    $('form').on('ajax:error', this.appendErrors);
  },

  appendResults: function(event, data, status, xhr) {

    $('.results').html(data.searchResponses);
  },

  appendErrors: function(event, xhr, status, error) {
    $('.results').before($.parseJSON(xhr.responseText).error);
  }
};

$(document).ready(function() {
  Results.init();

  $('.home-logo').click(function(){
    $(".modal-container").fadeIn();
  });

  $(".modal-container").click(function(){
    $(this).fadeOut('fast');
  });
});
