class Mistake < ApplicationRecord
  TYPES = {
    skipped: "skipped",
    incorrect: "incorrect",
  }

  validates :mistake_type, inclusion: { in: TYPES.values }
  validates :answer_party, inclusion: { in: Mp::PARTIES.values }, unless: Proc.new { |m| m.mistake_type == TYPES[:skipped] }

  belongs_to :mp
  belongs_to :game
  belongs_to :user

  def deleted?
    self.deleted_at.exists?
  end
end
