require 'test_helper'

class QuizControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should redirect to login when not signed in" do
    get realistic_url
    assert_redirected_to new_user_session_path
  end

  test "should get realistic when signed in" do
    sign_in users(:test)

    get realistic_url
    assert_response :success
  end

  test "should get reset when signed in" do
    sign_in users(:test)

    get reset_url
    assert_redirected_to realistic_url
  end

  # TODO: Implement test for post verify
  test "should post verify" do
    # post verify_url
    # assert_response :success
  end
end
