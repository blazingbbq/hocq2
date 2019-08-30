require 'test_helper'

class QuizControllerTest < ActionDispatch::IntegrationTest
  test "should get realistic" do
    get realistic_url
    assert_response :success
  end

  test "should get verify" do
    get verify_url
    assert_redirected_to realistic_url
  end

  # TODO: Implement test for post verify
  test "should post verify" do
    # post verify_url
    # assert_response :success
  end
end
