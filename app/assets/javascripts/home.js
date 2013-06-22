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

var CodeSnippet = {
  init: function() {
    $('.home').on('click', 'a', function(e) {
      e.preventDefault();
      e.stopPropagation();
      var billId = $(this).attr('id');
      var link = '/bills/' + billId;

      $.ajax({
        url: $(this).attr('href'),
        type: "POST"
      }).done(function(e) {
        iFrame.init(link, billId);
      });
    });//end on
  }
};

var iFrame = {
  init: function(link, billId) {
    $('.code-snippet-container').html(this.templateCode(billId));
    $('.code-snippet').html(this.template(link));
  },

  template: function(link) {
    return "<iframe src='" +link+ "'></iframe>";
  },

  templateCode: function(billId) {
     return "&ltscript type=&quottext/javascript&quot&gt\n\
    host_url = &quothttp://" + window.location.hostname +"&quot\;;\n\
    bill_id = &quot"+billId+"&quot\;;\n\
&lt/script&gt\n\n\
&ltscript type=&quottext/javascript&quot src=&quot/assets/javascripts/widget.js&quot&gt&lt/script&gt";
  }
};

$(document).ready(function() {
  Results.init();

  $('.home').on('click', 'a', function(){
    $(".modal-container").fadeIn();
  });

  $(".modal-container").click(function(){
    $(this).fadeOut('fast');
  });

  CodeSnippet.init();
});
