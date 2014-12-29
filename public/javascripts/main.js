(function() {
  var bindClickHandlers, bindHandlers, nextPhaseHandlers, nextQuestionHandlers, questionSubmitHandler, quoteSuccessHandler;

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
    return questionSubmitHandler();
  };

  nextPhaseHandlers = function() {
    return $(".change_phase").on("click", function(event) {
      var next_phase;
      next_phase = $(event.currentTarget).data("next-phase");
      $("." + next_phase).addClass("active");
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
      $.ajax({
        url: form.attr("action"),
        method: "POST",
        data: form.serialize(),
        success: quoteSuccessHandler,
        error: function(err) {
          return console.log(err);
        }
      });
      return console.log(event);
    });
  };

  quoteSuccessHandler = function(data) {
    data = JSON.parse(data);
    $("#5k_selection_cost").html("$" + data['amounts'][1]);
    $("#3k_selection_cost").html("$" + data['amounts'][0]);
    $("#question_submit").hide();
    return $(".plan_buttons").show();
  };

}).call(this);
