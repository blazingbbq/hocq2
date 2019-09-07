class Game < ApplicationRecord
  validates :active?, presence: true

  belongs_to :user
  has_many :mistakes
end
