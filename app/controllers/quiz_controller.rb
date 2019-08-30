class QuizController < ApplicationController
  NUMBER_OF_MPS = 338  # TODO: Remove magic number...

  def realistic
    @current_game = session[:current_game]
    @current_game ||= {
      correct: 0,
      skipped: 0,
      incorrect: 0,
      total: NUMBER_OF_MPS,
      mp_id: generate_new,
      seen: [],
    }.as_json
    session[:current_game] = @current_game
  end

  def verify
    @current_game = session[:current_game]
    redirect_to home_url unless @current_game

    if params[:skip]
      @current_game["skipped"] += 1
    else
      @current_game["correct"] += 1
    end

    @current_game["seen"] << @current_game["mp_id"]
    @current_game["mp_id"] = generate_new
    session[:current_game] = @current_game

    Rails.logger.info("CURRENT_GAME: #{@current_game}")

    render :realistic
  end

  def redir
    session[:current_game] = nil  # FIXME: Remove game reset on redir from /verify
    redirect_to realistic_url
  end 

  private

  def generate_new
    pool = [*0...NUMBER_OF_MPS] - (session[:current_game] ? session[:current_game]["seen"] : [])

    return gameover if pool.empty?

    pool.sample
  end

  def gameover
    # TODO: Implement gameover callback
  end
end
