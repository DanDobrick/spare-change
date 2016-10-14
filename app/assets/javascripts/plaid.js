$(function(){
  var linkHandler = Plaid.create({
  selectAccount: true,
  env: 'tartan',
  clientName: 'spareCHANGE',
  // key: '76589eeee668a81308beca8d3499d0',
  key: 'test_key',
  product: 'auth',
  longtail: true,
  onLoad: function(){
    // The Link module finished loading.
  },
  onSuccess: function(public_token, metadata) {
    $.ajax({
      url: '/users/plaid',
      method: 'POST',
      data: {public_token: public_token, metadata: metadata}
    }).done(function(response){
      console.log(response)
    })
  },
  onExit: function() {
    console.log('exited')
  }
});


  document.getElementById('linkButton').onclick = function() {
    linkHandler.open();
  };
});
