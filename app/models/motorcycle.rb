class Motorcycle < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validates :brand, :model, :year, :city, :address, :license_plate, presence: true
  validates :year, format: { with: /(19|20)\d{2}/,
    message: "the year should be 4 digits" }
end
