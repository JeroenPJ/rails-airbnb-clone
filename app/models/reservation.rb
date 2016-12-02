class Reservation < ApplicationRecord
  belongs_to :motorcycle
  belongs_to :user
  has_one :review

  validates :starting_date, :ending_date, presence: true
  validates :ending_date, date: { after_or_equal_to:  :starting_date}
end
