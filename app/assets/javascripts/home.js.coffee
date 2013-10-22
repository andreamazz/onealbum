# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'page:change', -> $.facebox.settings.inited = false

$ ->
  $('.gridster').delegate 'li', 'click', () ->
    if $(@).data('album')
      document.location = $(@).data('album')

@icheck = () ->
  if $(".icheck").length > 0
    $(".icheck").each () ->
      $el = $(this)
      skin = ""
      if $el.attr('data-skin')
        skin = "_" + $el.attr('data-skin')
      color = ""
      if $el.attr('data-color')
        color = "-" + $el.attr('data-color')
      opt = {
        checkboxClass: 'icheckbox' + skin + color,
        radioClass: 'iradio' + skin + color
      }
      $el.iCheck opt
