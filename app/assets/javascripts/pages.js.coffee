# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  form = $("form")

  $("#parent_id").on 'change', ->
    parent = $("#parent_id").find(':selected').data('path')
    if parent is undefined
      $("#prefix").text("/")
    else
      $("#prefix").text("/" + parent + "/")

  $("#page_path").find('p').on 'click', ->
    form.show()
    $("#permalink").focus()
    $('#save-editable').show().button('reset').removeClass('btn-success')
    $(this).hide()
    $('#hide_link').on 'click', (e)->
      new_url_path = '/' + $("#parent_id").find(':selected').data('path') + '/' + $("#permalink").val()
      $(this).parent().hide()
      $("#page_path").find('p').text(new_url_path).show()
  upArrow = '<a title="Свернуть панель инструментов" id="cke_1_toolbar_collapser" tabindex="-1" class="cke_toolbox_collapser"><span class="cke_arrow">▲</span></a>'
  
  $("#page_title").on 'focus', ->
    $("#cke_page_title").remove()
    $('#save-editable').show().button('reset').removeClass('btn-success')

  $('#editable').on 'mouseenter', ->
    $('#cke_1_toolbox').children('span:lt(9)').hide()
    $(this).off 'mouseenter'
  $('#editable').on 'focus', ->
    $('#save-editable').show().button('reset').removeClass('btn-success')
    $('#cke_1_toolbar_collapser').remove()
    $('#cke_1_top').append(upArrow)
    $('#cke_1_toolbar_collapser').on "click", ->
      $('#cke_1_toolbox').children('span:lt(9)').toggle()
      $("#cke_editable").toggleClass('pickup')
      $(this).toggleClass('rotate')

  $("#save-editable").on "click ", ->
    $("#page_title").text($("#title").val())
    button = $(this)
    button.button('loading') 
    params = form.serialize()
    $.post(
      form.attr('action') + "?" + params + "&content=" + CKEDITOR.instances.editable.getData() + "&title=" + CKEDITOR.instances.page_title.getData(), (data) ->
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