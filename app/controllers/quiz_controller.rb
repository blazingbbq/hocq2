class QuizController < ApplicationController
  NUMBER_OF_MPS = 338  # TODO: Remove magic number...

  def realistic
    @current_game = session[:current_game]
    @current_game ||= {
      correct: [],
      skipped: [],
      incorrect: [],
      total: NUMBER_OF_MPS,
      mp_id: generate_new,
    }.as_json
    session[:current_game] = @current_game
  end

  def verify
    @current_game = session[:current_game]
    redirect_to home_url unless @current_game

    if params[:skip]
      @current_game["skipped"] << @current_game["mp_id"]
    elsif correct_answer?(
      mp_id: @current_game["mp_id"],
      answer: params.fetch(:answer),
    )
      @current_game["correct"] << @current_game["mp_id"]
    else
      # TODO: Persist mistakes
      @current_game["incorrect"] << @current_game["mp_id"]
    end

    @current_game["mp_id"] = generate_new
    session[:current_game] = @current_game

    render :realistic
  end

  def redir
    redirect_to realistic_url
  end

  def reset
    session[:current_game] = nil
    redirect_to realistic_url
  end

  private

  def correct_answer?(mp_id:, answer:)
    Rails.logger.info("ANSWER: #{answer}, MP: #{mp_id}")
    # MP records start at 1 :(
    mp = Mp.find(mp_id + 1)
    mp.name.casecmp?(answer["name"].strip) && mp.party == answer["party"]
  end

  def generate_new
    pool = [*0...NUMBER_OF_MPS] - (session[:current_game] ? (session[:current_game]["correct"] + session[:current_game]["incorrect"] + session[:current_game]["skipped"]) : [])

    return gameover if pool.empty?

    pool.sample
  end

  def gameover
    # TODO: Implement gameover callback (persist result, redirect to result page)
    reset
  end
end
