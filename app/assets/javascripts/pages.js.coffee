# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("#editable").on "blur", ->
    url = $(this).data('update-url')
    id = $(this).data('id')
    $.post url, 
      content: CKEDITOR.instances.editable.getData()
    false
