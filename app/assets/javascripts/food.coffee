$(document).ready ->

  $('a.food_name').click (event) ->
    id = $(this).data("object-id")
    event.preventDefault()
    $('#overlay').fadeIn 400, ->
      $('.modal_form#' + id).css('display', 'block').animate {
        opacity: 1
        top: '50%'
      }, 200
      return
    return

    $('#modal_close, #overlay').click ->
      $('.modal_form').animate {
        opacity: 0
        top: '45%'
      }, 200, ->
        $(this).css 'display', 'none'
        $('#overlay').fadeOut 400
        return
      return
  return
