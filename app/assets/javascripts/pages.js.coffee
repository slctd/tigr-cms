# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("#save-content").on "click", ->
    $("form textarea").val CKEDITOR.instances.editable.getData()
    $("form").submit()
    false
