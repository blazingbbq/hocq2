require 'test_helper'

class MpTest < ActiveSupport::TestCase
  test "mp must have name and party" do
    assert mps(:trudeau).valid?
  end
end
