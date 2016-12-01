class Reservation < ApplicationRecord
  belongs_to :motorcycle
  belongs_to :user
  has_one :review

  validates :starting_date, :ending_date, presence: true
end
