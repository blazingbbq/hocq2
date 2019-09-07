class Mistake < ApplicationRecord
  TYPES = {
    skipped: "skipped",
    incorrect: "incorrect",
  }

  validates :answer_name, presence: true
  validates :answer_party, inclusion: { in: Mp::PARTIES.values }
  validates :type, inclusion: { in: TYPES.values }

  has_one :mp
  belongs_to :game
  belongs_to :user

  def deleted?
    self.deleted_at.exists?
  end
end
