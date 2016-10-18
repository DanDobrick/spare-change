$(document).on('ready', function(){
  $('#pause-form').on('submit', function(event){
    event.preventDefault();
    var $form = $(this);
    $.ajax({
      url: $form.attr('action'),
      method: $form.attr('method'),
      data: $form.serialize()
    }).done(function(){
      $form.remove();
      $('#button-container').html('<button class="style-btn linkButton">Connect Bank Account</button>')
      
      $('.linkButton').on('click', function() {
        var handler = createLinkHandler()
        handler.open();
      });
    });
  });
});