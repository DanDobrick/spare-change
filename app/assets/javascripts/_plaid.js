function createLinkHandler(){
  var linkHandler = Plaid.create({
    selectAccount: true,
    env: 'tartan',
    clientName: 'spareCHANGE',
    key: 'ab2ebb6e0fec3dfc5c1a18ccb3001f',
    // key: 'test_key',
    product: 'auth',
    longtail: true,
    onSuccess: function(public_token, metadata) {
      $.ajax({
        url: '/users/plaid',
        method: 'POST',
        data: {public_token: public_token, metadata: metadata}
      }).done(function(response){
        location.reload();
      })
    },
    onExit: function() {
      $.ajax({
        url: window.location.href,
        method: 'GET',
      }).done(function(response){
        $('#donation-amount').text(response.bucket.toFixed(2))
      })
    }
  });
  return linkHandler
}

$(document).on('ready', function(){
  $('.linkButton').on('click', function() {
    var handler = createLinkHandler()
    handler.open();
  });
});
