# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('#date-navigator-input').datepicker().on 'changeDate', (value) ->
  location.href = '?date=' + encodeURI(value.date.getFullYear() + '-' + (value.date.getMonth() + 1) + '-' + value.date.getDate())