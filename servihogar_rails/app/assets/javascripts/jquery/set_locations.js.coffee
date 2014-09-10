$ ->
  $('#business_search').typeahead
    name: "commercial_name"
    remote: "/proveedores/autocomplete?query=%QUERY"