require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test "active game fixture is valid" do
    assert games(:active).valid?
  end

  test "finished game fixture is valid" do
    assert games(:finished).valid?
  end

  test "should generate current_mp on creation" do
    new_game = Game.create(user_id: 1)

    assert_not_nil new_game.current_mp
  end

  test "should be active upon creation" do
    new_game = Game.create(user_id: 1)

    assert_equal new_game.active?, true
  end

  test "#generate_new should return false when all mps have been seen" do
    mp_count = Mp.all.count

    assert_equal false, Game.create(seen: [*1...mp_count], current_mp: mp_count, user: users(:test)).generate_new
  end
end
