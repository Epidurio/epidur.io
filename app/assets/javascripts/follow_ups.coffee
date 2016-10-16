# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.add-checklist-button').on 'click', @addEmailField

  addEmailField: (ev) ->
    $lastEmailField = $('input[name="follow_ups[checklists][]"]:last-of-type').clone()
    $lastEmailField.val("")
    $(".input.course_emails").append($lastEmailField)
