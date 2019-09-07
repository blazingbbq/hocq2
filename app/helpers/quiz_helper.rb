module QuizHelper
  def progressbar_type(ans)
    case ans["type"]
    when QuizController::ANSWER_TYPES[:skipped]
      "progress-bar-info"
    when QuizController::ANSWER_TYPES[:correct]
      "progress-bar-success"
    when QuizController::ANSWER_TYPES[:incorrect]
      "progress-bar-danger"
    end
  end
end
