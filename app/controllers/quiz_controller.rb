class QuizController < ApplicationController
  def realistic
    @current_game = session[:current_game]
    @current_game ||= {
      correct: 0,
      skipped: 0,
      incorrect: 0,
      total: 338,
      mp_id: 1,
  }.as_json
    session[:current_game] = @current_game
  end

  def verify
    @current_game = session[:current_game]
    redirect_to home_url unless @current_game

    @current_game["correct"] += 1
    # @current_game["correct"] = 0 if params[:skip]
    session[:current_game] = @current_game

    render :realistic
  end

  def redir
    session[:current_game] = nil  # TODO: Remove game reset on redir from /verify
    redirect_to realistic_url
  end 
end
