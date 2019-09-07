require 'test_helper'

class QuizControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:test)
  end

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

  # test "should generate new game when user have no active game" do
  #   games_count = Game.all.count
  #   sign_in users(:new_user)

  #   get realistic_url
  #   assert_response :success
  #   assert_difference games_count, Game.all.count
  # end

  # TODO: Implement test for post verify
  test "should post verify" do
    # post verify_url
    # assert_response :success
  end
end
