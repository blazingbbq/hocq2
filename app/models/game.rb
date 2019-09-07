class Game < ApplicationRecord
  after_create :generate_new
  
  validates :active?, inclusion: { in: [true, false] }

  belongs_to :user
  has_many :mistakes

  def generate_new
    number_of_mps ||= Mp.all.count

    self.update(seen: self.seen << self.current_mp) if self.current_mp

    return false unless self.seen.count < number_of_mps

    self.update(current_mp: ([*0...number_of_mps] - self.seen.map(&:to_i)).sample)
  end
end
