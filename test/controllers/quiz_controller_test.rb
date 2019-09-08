require 'test_helper'

class QuizControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:test)
  end

  # GET /realistic
  test "should redirect to login when not signed in" do
    sign_out users(:test)

    get realistic_url
    assert_redirected_to new_user_session_path
  end

  test "should get realistic when signed in" do
    get realistic_url
    assert_response :success
  end

  test "should get reset when signed in" do
    get reset_url
    assert_redirected_to realistic_url
  end

  test "should generate new game when user have no active game" do
    user = users(:new_user)
    sign_in user

    get realistic_url
    assert_response :success

    user.reload
    assert_not_nil user.active_game
  end

  # POST /realistic
  test "should redirect when user has no active game" do
    sign_in users(:new_user)
  
    post realistic_url
    assert_redirected_to realistic_url
  end

  test "should persist mistake when skipping" do
    assert_difference Proc.new { users(:test).mistakes.count }, 1 do
      post realistic_url, params: {skip: true, answer: {name: ""}}
    end
  end

  test "should persist mistake when answer name is incorrect" do
    assert_difference Proc.new { users(:test).mistakes.count }, 1 do
      post realistic_url, params: {answer: {name: "incorrect_name", party: "LIB"}}
    end
  end

  test "should persist mistake when answer party is incorrect" do
    assert_difference Proc.new { users(:test).mistakes.count }, 1 do
      post realistic_url, params: {answer: {name: "Trudeau", party: "CPC"}}
    end
  end

  test "should not persist mistake when correct name and party" do
    assert_no_difference Proc.new { users(:test).mistakes.count } do
      post realistic_url, params: {answer: {name: "Trudeau", party: "LIB"}}
    end
  end

  test "should redirect and set game as inactive on gameover" do
    mp_count = Mp.all.count
    user = users(:new_user)
    game = Game.create(seen: [*1...mp_count], current_mp: mp_count, user: user)

    sign_in user
    post realistic_url, params: {skipped: true, answer: {name: ""}}
    game.reload

    assert_equal false, game.active?
    assert_redirected_to home_url
  end

  # GET /reset
  test "reset should set current game as inactive and redirect to /realistic" do
    user = users(:test)
    old_game = user.active_game

    get reset_url
    old_game.reload

    assert_equal false, old_game.active?
    assert_not_equal old_game, user.active_game
    assert_redirected_to realistic_url
  end
end
