var charities = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: {
    url: "/charities?utf8=✓&search=%QUERY",
    wildcard: '%QUERY',
    transform: function(response){
      var stuff = response.map(function(item){
        return item.charityName
      })
      return stuff
    }
  }
});


$(document).on('ready', function(){
  $('#search').typeahead({
    minLength: 3,
    highlight: true
  },
  {
    name: 'charities',
    async: 'true',
    source: charities,
    templates:{ notFound: function(query){return '<div class= query-show>' + query + ' Not Found<div>'}
              }
  });
})