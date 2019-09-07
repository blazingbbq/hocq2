class Game < ApplicationRecord
  NUMBER_OF_MPS ||= Mp.all.count

  after_create :generate_new
  
  validates :active?, presence: true

  belongs_to :user
  has_many :mistakes

  def generate_new
    self.update(seen: self.seen << self.current_mp) if self.current_mp

    return false unless self.seen.count < NUMBER_OF_MPS

    self.update(current_mp: ([*0...NUMBER_OF_MPS] - self.seen).sample)
  end
end
