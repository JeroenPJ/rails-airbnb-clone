class Reservation < ApplicationRecord
  belongs_to :motorcycle
  belongs_to :user

  validates :starting_date, :ending_date
end
