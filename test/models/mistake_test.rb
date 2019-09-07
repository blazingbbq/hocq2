require 'test_helper'

class MistakeTest < ActiveSupport::TestCase
  test "type must be skipped or incorrect" do
    assert mistakes(:skipped).valid?
    assert mistakes(:incorrect).valid?
  end

  test "answer party must be valid party" do
    mistake = mistakes(:incorrect)
    mistake.answer_party = "invalid_party"

    assert_not mistake.valid?
  end
end
