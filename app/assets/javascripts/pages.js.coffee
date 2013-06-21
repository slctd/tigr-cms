# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  form = $("form")
  @url = $("#editable").data('url')
  $("#page_title").on 'click', ->
    $('#save-editable').show().button('reset').removeClass('btn-success')
    $(this).hide()
    form.show()
  $("#parent_id").on 'change', ->
    parent = $("#parent_id").find(':selected').data('path')
    if parent is undefined
      $("#prefix").text("/")
    else
      $("#prefix").text("/" + parent + "/")
   
  $('#editable').on 'focus', ->
    $('#save-editable').show()
    $('.tool-collapse').remove()
    $('#cke_1_toolbox').children('span:gt(4)').hide()
    $('#cke_1_top').append('<div class="tool-collapse" style="cursor:pointer;float:right;display:block;margin-right: 5px;font-size: 20px;margin-top: -10px;">...</div>')
    $('.tool-collapse').on "click", ->
      $(this).hide()
      $('#cke_1_toolbox').children('span:gt(4)').show()

  $("#save-editable").on "click ", ->
    $("#page_title").text($("#title").val())
    button = $(this)
    button.button('loading') 
    params = form.serialize()
    $.post(
      form.attr('action') + "?" + params + "&content=" + CKEDITOR.instances.editable.getData(), (data) ->
        if data.status == 'error'
          button.button('reset')
          button.append("<p>Something wrong</p>")
          
      )
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