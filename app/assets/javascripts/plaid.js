$(function(){
  var linkHandler = Plaid.create({
    selectAccount: true,
    env: 'tartan',
    clientName: 'spareCHANGE',
    // key: 'ab2ebb6e0fec3dfc5c1a18ccb3001f',
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
