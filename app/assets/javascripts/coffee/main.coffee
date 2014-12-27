$(document).ready ->
  bindHandlers()

bindHandlers = () ->
  handlers = [
    bindClickHandlers
  ]

  handlers.map((func) -> func())

bindClickHandlers = () ->
  $(".change_phase").on "click", (event) ->
    console.log event