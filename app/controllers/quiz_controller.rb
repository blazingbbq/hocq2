class QuizController < ApplicationController
  before_action :authenticate_user!

  NUMBER_OF_MPS ||= Mp.all.count

  Answer = Struct.new(:type, :mp_id, :answer)
  ANSWER_TYPES = {
    skipped: "skipped",
    correct: "correct",
    incorrect: "incorrect",
  }

  def realistic
    @current_game = session[:current_game]
    @current_game ||= {
      answers: [],
      total: NUMBER_OF_MPS,
      mp_id: generate_new,
    }.as_json
    session[:current_game] = @current_game
  end

  def verify
    @current_game = session[:current_game]
    redirect_to home_url unless @current_game

    mp_id = @current_game["mp_id"]
    answer = params.fetch(:answer)

    if params[:skip]
      @current_game["answers"] << Answer.new(ANSWER_TYPES[:skipped], mp_id, answer)
    elsif correct_answer?(mp_id: mp_id, answer: answer)
      @current_game["answers"] << Answer.new(ANSWER_TYPES[:correct], mp_id, answer)
    else
      # TODO: Persist mistakes
      @current_game["answers"] << Answer.new(ANSWER_TYPES[:incorrect], mp_id, answer)
    end

    @current_game["mp_id"] = generate_new
    session[:current_game] = @current_game
    return unless @current_game["mp_id"]

    render :realistic
  end

  def reset
    session[:current_game] = nil
    redirect_to realistic_url
  end

  private

  def correct_answer?(mp_id:, answer:)
    # MP records start at 1 :(
    mp = Mp.find(mp_id + 1)
    mp.name.casecmp?(answer["name"].strip) && mp.party == answer["party"]
  end

  def generate_new
    pool = [*0...NUMBER_OF_MPS] - (session[:current_game] ? session[:current_game]["answers"].map { |ans| ans["mp_id"] } : [])

    return gameover if pool.empty?

    pool.sample
  end

  def gameover
    # TODO: Implement gameover callback (persist result, redirect to result page)
    reset
    nil
  end
end
