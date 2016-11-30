# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Motorcycle.destroy_all

10.times do
  motorcycle = Motorcycle.new(
    name: Faker::StarWars.quote,
    user_id: 3,
    brand: "Honda",
    model: "CB750",
    year: Faker::Number.between(1900, 2016),
    city: 'Barcelona',
    address: Faker::Address.street_address,
    license_plate: Faker::Number.number(8),
    availability: true
  )

  p motorcycle.valid?
  motorcycle.save
end
