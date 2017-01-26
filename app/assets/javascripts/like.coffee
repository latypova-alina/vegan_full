$(document).ready ->
  $('a.dislike_recipe').click ->
    id = $(this).data("object-id")
    $.ajax('/dislike_recipe/' + id)
    $('.small-6.columns#column_' + id).hide()