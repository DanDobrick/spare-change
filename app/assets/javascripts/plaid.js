
var linkHandler = Plaid.create({
  env: 'tartan',
  clientName: 'spareCHANGE',
  // key: '76589eeee668a81308beca8d3499d0',
  key: 'test_key',
  product: 'auth',
  longtail: true,
  onSuccess: function(public_token, metadata) {
    $.ajax({
      url: '/users',
      method: 'POST',
      data: {public_token: public_token, metadata: metadata}
    }).done(function(response){
      console.log(response)
    })
  },
  onExit: function() {
    // The user exited the Link flow.
  }
});

document.getElementById('linkButton').onclick = function() {
  linkHandler.open();
};
