$(document).ready ->
  bindHandlers()

bindHandlers = () ->
  handlers = [
    bindClickHandlers
  ]

  handlers.map((func) -> func())

bindClickHandlers = () ->
  nextPhaseHandlers()
  nextQuestionHandlers()
  questionSubmitHandler()
  showPlanHandler()
  requestApplicationHandler()

nextPhaseHandlers = () ->
  $(".change_phase").on "click", (event) ->
    next_phase = $(event.currentTarget).data("next-phase")
    $("." + next_phase).addClass("active")
    $(".quote").css("visibility", "")
    $("#" + $("#" + next_phase).data("next-phase")).css({ "visibility": "hidden" }).addClass("active")
    $("body").animate({
      scrollTop: $("#" + next_phase).offset().top
    })

nextQuestionHandlers = () ->
  $(".question select").on "change", (event) ->
    next_question = $(event.currentTarget).data("next-question")
    question = $("#" + next_question)
    question.addClass("active")
    question.removeAttr("disabled")
    question.attr("enabled", "enabled")
    question.parent(".question").addClass("active")

  $("#email").on "input", (event) ->
    submit = $("#question_submit")
    submit.removeAttr("disabled")
    submit.removeClass("disabled")
    submit.attr("enabled", "enabled")
    submit.parent(".question.submit").addClass("active")

questionSubmitHandler = () ->
  $("#questions_form").submit (event) ->
    event.preventDefault()
    form = $(event.currentTarget)
    $.ajax({
      url: form.attr("action")
      method: "POST",
      data: form.serialize(),
      success: quoteSuccessHandler,
      error: (err) ->
        console.log("Oops")
    })

quoteSuccessHandler = (data) ->
  data = JSON.parse(data)
  $("#5k_selection_cost").html("$" + data['amounts'][1])
  $("#5k_selection").attr("data-plan-price", data['amounts'][1])
  $("#3k_selection_cost").html("$" + data['amounts'][0])
  $("#3k_selection").attr("data-plan-price", data['amounts'][0])

showPlanHandler = () ->
  $(".plan_button").on "click", (event) ->
    target = $(event.currentTarget)
    event.preventDefault()
    $("#plan_highlights").addClass("active")
    $("body").animate({
      scrollTop: $("#review_highlights").offset().top - 50
    })
    $("#only_x_per_month i").html("$" + target.data("plan-price"))
    $("#request_application").attr("data-plan-selected", target.data("plan-level"))
    $("#request_application").attr("data-plan-price", target.data("plan-price"))

requestApplicationHandler = () ->
  $("#request_application").on "click", (event) ->
    target = $(event.currentTarget)
    application = $("#questions_form")
    application.append("<input type='hidden' name='application[plan_selected]' value='#{target.data("plan-selected")}'>")
    application.append("<input type='hidden' name='application[plan_price]' value='#{target.data("plan-price")}'>")

    data = $("#questions_form").serialize()
    console.log(data)
    $.ajax(
      url: "/request_application"
      method: "POST"
      data: data
      success: applicationRequested
      error: (err) ->
        console.log(err)
    )

applicationRequested = () ->
  