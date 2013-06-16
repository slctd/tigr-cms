# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("#save-editable").on "click ", ->
    url = $('#editable').data('update-url')
    $.post url,
      content: CKEDITOR.instances.editable.getData()
    false

  $("#menu").sortable(
    axis: 'x'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
  );

  $("#submenu").sortable(
    axis: 'y'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
  );
