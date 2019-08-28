require 'test_helper'

class LegacyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get legacy_url
    assert_response :success
  end

end
