class QuizController < ApplicationController
  before_action :authenticate_user!

  NUMBER_OF_MPS ||= Mp.all.count

  def realistic
    @current_game = current_user.active_game || Game.create(user: current_user)
  end

  def verify
    @current_game = current_user.active_game

    return redirect_to realistic_url unless @current_game

    mp_id = @current_game.current_mp
    answer = params.fetch(:answer)

    if params[:skip]
      persist_mistake(answer, Mistake::TYPES[:skipped])
    elsif !correct_answer?(mp_id: mp_id, answer: answer)
      persist_mistake(answer, Mistake::TYPES[:incorrect])
    end

    return gameover unless @current_game.generate_new    

    render :realistic
  end

  def reset
    current_game = current_user.active_game
    current_game.update(active?: false, current_mp: nil) if current_game
    redirect_to realistic_url
  end

  private

  def correct_answer?(mp_id:, answer:)
    mp = Mp.find(mp_id + 1) # MP records start at 1 :(
    mp.name.casecmp?(answer["name"].strip) && mp.party == answer["party"]
  end

  def persist_mistake(answer, mistake_type)
    Mistake.create(
      mistake_type: mistake_type,
      answer_name: answer["name"],
      answer_party: answer["party"],
      game: @current_game,
      user: current_user,
      mp_id: @current_game.current_mp + 1,
    )
  end

  def gameover
    current_game = current_user.active_game
    current_game.update(active?: false, current_mp: nil)
    redirect_to home_url  # TODO: Redirect to result page
  end
end
