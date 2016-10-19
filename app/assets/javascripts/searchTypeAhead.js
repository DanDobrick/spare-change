var charities = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: {
    url: "/charities?utf8=✓&search=%QUERY",
    wildcard: '%QUERY',
    transform: function(response){
      var stuff = response.map(function(item){
        return [item.charityName, item.ein]
      })
      return stuff
    }
  }
});

function titleize(string) {
  var string_array = string.split(' ');
  string_array = string_array.map(function(word) {
     return word.charAt(0).toUpperCase() + word.slice(1); 
  });
  return string_array.join(' ');
}

function suggestionHTML(query){
  var ein = query[1]
  var name = query[0]
  var url = '/charities/' + ein
  return '<a href='+ url+'><div class= query-show>'+ titleize(name.toLowerCase()) +'</div></a>'
}

$(document).on('ready', function(){
  $('#search').typeahead({
    minLength: 3,
    highlight: true,
    hint: false,
  },
  {
    name: 'charities',
    async: 'true',
    source: charities,
    limit: 10,
    templates:{ notFound: function(query){return '<div class= query-show>' + query.query + ' Not Found</div>'},
              pending: function(query){return '<div class= query-show>Searching for: ' + query.query +'</div>'},
              suggestion: function(query){return suggestionHTML(query)}
            }
  }).bind('typeahead:select', function(ev, suggestion) {
    $('#search').val('')
  }).bind('typeahead:autocomplete', function(event, autocomplete){
    $('#search').val(titleize(autocomplete))
  });
})