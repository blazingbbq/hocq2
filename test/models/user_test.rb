require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user must satisfy devise model" do
    assert users(:test).valid?
  end

  test "#active_game returns the user's current game" do
    assert_equal users(:test).active_game, games(:active)
  end

  test "#active_game returns nil when user does not have current game" do
    assert_nil users(:new_user).active_game
  end
end
