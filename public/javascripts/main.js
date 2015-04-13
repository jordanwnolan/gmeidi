// Generated by CoffeeScript 1.8.0
(function() {
  var applicationRequested, bindClickHandlers, bindHandlers, nextPhaseHandlers, nextQuestionHandlers, questionSubmitHandler, quoteSuccessHandler, requestApplicationHandler, showPlanHandler;

  $(document).ready(function() {
    return bindHandlers();
  });

  bindHandlers = function() {
    var handlers;
    handlers = [bindClickHandlers];
    return handlers.map(function(func) {
      return func();
    });
  };

  bindClickHandlers = function() {
    nextPhaseHandlers();
    nextQuestionHandlers();
    questionSubmitHandler();
    showPlanHandler();
    return requestApplicationHandler();
  };

  nextPhaseHandlers = function() {
    return $(".change_phase").on("click", function(event) {
      var next_phase;
      next_phase = $(event.currentTarget).data("next-phase");
      $("." + next_phase).addClass("active");
      $(".quote").css("visibility", "");
      $("#" + $("#" + next_phase).data("next-phase")).css({
        "visibility": "hidden"
      }).addClass("active");
      return $("body").animate({
        scrollTop: $("#" + next_phase).offset().top
      });
    });
  };

  nextQuestionHandlers = function() {
    $(".question select").on("change", function(event) {
      var next_question, question;
      next_question = $(event.currentTarget).data("next-question");
      question = $("#" + next_question);
      question.addClass("active");
      question.removeAttr("disabled");
      question.attr("enabled", "enabled");
      return question.parent(".question").addClass("active");
    });
    return $("#email").on("input", function(event) {
      var submit;
      submit = $("#question_submit");
      submit.removeAttr("disabled");
      submit.removeClass("disabled");
      submit.attr("enabled", "enabled");
      return submit.parent(".question.submit").addClass("active");
    });
  };

  questionSubmitHandler = function() {
    return $("#questions_form").submit(function(event) {
      var form;
      event.preventDefault();
      form = $(event.currentTarget);
      return $.ajax({
        url: form.attr("action"),
        method: "POST",
        data: form.serialize(),
        success: quoteSuccessHandler,
        error: function(err) {
          return console.log("Oops");
        }
      });
    });
  };

  quoteSuccessHandler = function(data) {
    data = JSON.parse(data);
    $("#5k_selection_cost").html("$" + data['amounts'][1]);
    $("#5k_selection").attr("data-plan-price", data['amounts'][1]);
    $("#3k_selection_cost").html("$" + data['amounts'][0]);
    return $("#3k_selection").attr("data-plan-price", data['amounts'][0]);
  };

  showPlanHandler = function() {
    return $(".plan_button").on("click", function(event) {
      var target;
      target = $(event.currentTarget);
      event.preventDefault();
      $("#plan_highlights").addClass("active");
      $("body").animate({
        scrollTop: $("#review_highlights").offset().top - 50
      });
      $("#only_x_per_month i").html("$" + target.data("plan-price"));
      $("#request_application").attr("data-plan-selected", target.data("plan-level"));
      return $("#request_application").attr("data-plan-price", target.data("plan-price"));
    });
  };

  requestApplicationHandler = function() {
    return $("#request_application").on("click", function(event) {
      var application, data, target;
      target = $(event.currentTarget);
      application = $("#questions_form");
      application.append("<input type='hidden' name='application[plan_selected]' value='" + (target.data("plan-selected")) + "'>");
      application.append("<input type='hidden' name='application[plan_price]' value='" + (target.data("plan-price")) + "'>");
      data = $("#questions_form").serialize();
      console.log(data);
      return $.ajax({
        url: "/request_application",
        method: "POST",
        data: data,
        success: applicationRequested,
        error: function(err) {
          return console.log(err);
        }
      });
    });
  };

  applicationRequested = function() {};

}).call(this);

//# sourceMappingURL=main.js.map
