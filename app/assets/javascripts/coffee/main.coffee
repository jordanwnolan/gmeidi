$(document).ready ->
  bindHandlers()

bindHandlers = () ->
  handlers = [
    bindClickHandlers
    bindScrollHandlers
  ]

  handlers.map((func) -> func())

bindScrollHandlers = () ->


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
  data['amounts'] = data['amounts'].map((num) -> Number(num).toFixed(2))
  if data['amounts'].length == 1
    finalYearQuoteSuccess(data)
  else
    $(".plan_buttons").html(TEMPLATES['button']({n: 5, 'plan-level': 5000}))
    $(".plan_buttons").append(TEMPLATES['button']({n: 3, 'plan-level': 3500}))
    $("#5k_selection_cost").html("$" + data['amounts'][1])
    $("#5k_selection").attr("data-plan-price", data['amounts'][1])
    $("#3k_selection_cost").html("$" + data['amounts'][0])
    $("#3k_selection").attr("data-plan-price", data['amounts'][0])

finalYearQuoteSuccess = (data) ->
  $(".plan_buttons").html(TEMPLATES['button']({n: 2, 'plan-level': 2000}))
  el = $("#2k_selection")
  $("#2k_selection_cost").html("$" + data['amounts'][0])
  el.css({float: "none"}).attr("data-plan-price", data['amounts'][0])

showPlanHandler = () ->
  $(".plan_buttons").delegate(".plan_button").on "click", (event) ->
    target = $(event.target).closest("button")
    event.preventDefault()
    $("#plan_highlights").addClass("active")
    $("body").animate({
      scrollTop: $("#review_highlights").offset().top - 50
    })
    $("#plan_price i").html(target.data("plan-level"))
    if target.data("plan-level") == 2000
      $("#future_increases").attr("src", "images/red_X.svg")
    else
      $("#future_increases").attr("src", "images/check-mark.svg")
    $("#only_x_per_month i").html("$" + target.data("plan-price"))
    $("#request_application").attr("data-plan-selected", target.data("plan-level"))
    $("#request_application").attr("data-plan-price", target.data("plan-price"))

requestApplicationHandler = () ->
  $("#request_application").on "click", (event) ->
    unless $("#request_application").hasClass("disabled")
      $(".application-progress .request_application").addClass("active")
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
  $("#request_application").attr("disabled", "disabled")
  $("#request_application").addClass("disabled")

TEMPLATES = {

  button: (opts) ->
    "<button class=\"big_button plan_button change_phase\" data-next-phase=\"plan_highlights\" data-plan-level=\"#{opts['plan-level']}\" id=\"#{opts['n']}k_selection\" data-plan-price=\"#{opts['plan-price']}\">
      <div class=\"plan_selection_cost\">
        <h1>$#{opts['plan-level']}<i>/month</i></h1>
        <h1><i>to age</i> 67</h1>
        <h1 id=\"#{opts['n']}k_selection_cost\"></h1>
      </div>
    </button>"
}
