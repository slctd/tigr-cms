# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#editable').on 'focus', ->
    $('.tool-collapse').remove()
    $('#cke_1_toolbox').children('span:gt(4)').hide()
    $('#cke_1_top').append('<div class="tool-collapse" style="cursor:pointer;float:right;display:block;margin-right: 5px;font-size: 20px;margin-top: -10px;">...</div>')
    $('.tool-collapse').on "click", ->
      $(this).hide()
      $('#cke_1_toolbox').children('span:gt(4)').show()
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
