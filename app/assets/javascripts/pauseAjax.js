$(function(){
  $('#pause-form').on('submit', function(event){
    console.log('got clicked')
    var $form = $(this)
    event.preventDefault();
    $.ajax({
      url: $form.attr('action'),
      method: $form.attr('method'),
      data: $form.serialize()
    }).done(function(response){
      $form.remove();
      $('#round-up').append("<button class='linkButton'>Connect Bank Account</button>")
      $('.linkButton').unbind();
      $('.linkButton').on('click', function() {
        linkHandler.open();
      });
    })
  })
});