# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('#vehicles-list').DataTable
  order: [[
    0
    'asc'
  ]]
  columnDefs: [{
    orderable: false
    targets: [1]
  }]