require 'test_helper'

class QuizControllerTest < ActionDispatch::IntegrationTest
  test "should get realistic" do
    get realistic_url
    assert_response :success
  end
end
