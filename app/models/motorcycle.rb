class Motorcycle < ApplicationRecord
  belongs_to :user

  validates :brand, :model, :year, :city, :address, :license_plate, presence: true
  validates :year, format: { with: /(19|20)\d{2}/,
    message: "the year should be 4 digits" }
end
