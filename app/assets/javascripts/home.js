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
    $('.results').on('click', 'a', function(e) {
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
    $('.code-snippet').html(this.templateCode(billId));
    $('.code-iframe').html(this.template(link));
  },

  template: function(link) {
    return "<iframe src='" +link+ "'></iframe>";
  },

  templateCode: function(billId) {
   return "&ltscript type=&quottext/javascript&quot&gt\n\
   host_url = &quothttp://" + window.location.hostname +"&quot\;;\n\
   bill_id = &quot"+billId+"&quot\;;\n\
   height = &quot930&quot\;;\n\
   width = &quot395&quot\;;\n\
   &lt/script&gt\n\n\
   &ltscript type=&quottext/javascript&quot src=&quothttp://" + window.location.hostname +"/javascripts/widget.js&quot&gt&lt/script&gt";
 }
};

$(document).ready(function() {
  Results.init();

  $('.results').on('click', 'a', function(){
    $(".modal-container").fadeIn();
  });

  $(".exit").click(function(e){
    e.preventDefault();
    $(".modal-container").fadeOut('fast');
  });

// this will auto scroll up and down the iframe of the widget
// I need to figure out how to delegate this to the code-iframe
// because the iframe itself is dynamically injected into the div
    var scrollTime = 10000;
    var scrollDown = function() {
      $("code-iframe iframe").animate({ scrollTop: "2000px" }, scrollTime);
    };

    var scrollUp = function() {
      $("code-iframe iframe").animate({ scrollTop: "0px" }, scrollTime);
    };

    scrollDown();
    setInterval(scrollDown, 2 * scrollTime);
    setTimeout(function() {
      scrollUp()
      setInterval(scrollUp, 2 * scrollTime);
    }, scrollTime);

CodeSnippet.init();
});
