# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Review.destroy_all
Reservation.destroy_all
Motorcycle.destroy_all


Motorcycle.create!(
    name: "Rent a fantastic classic in Barcelona!",
    description: Faker::Hipster.sentence(3),
    user_id: 5,
    brand: "Honda",
    model: "CB750",
    year: 1984,
    city: 'Barcelona',
    address: 'Carrer de Sardenya, Barcelona, Spain',
    license_plate: Faker::Number.number(8),
    availability: true,
    photo_urls: ["https://s-media-cache-ak0.pinimg.com/originals/9b/fb/5b/9bfb5b0a0831a488a84d3fcd2be36819.jpg"],
    price: 80
  )

Motorcycle.create!(
    name: "Beautiful Racer for country ride!",
    description: Faker::Hipster.sentence(3),
    user_id: 5,
    brand: "Yamaha",
    model: "R1",
    year: 2016,
    city: 'Barcelona',
    address: 'Carrer de Balmes, Barcelona, Spain',
    license_plate: Faker::Number.number(8),
    availability: true,
    photo_urls: ["https://wimoto.eu/wp-content/uploads/2014/08/YamahaR1LR-17.jpg"],
    price: 60
  )

Motorcycle.create!(
    name: "Easy Rider in the easy city!",
    description: Faker::Hipster.sentence(3),
    user_id: 7,
    brand: "Harley Davidson",
    model: "Sportster",
    year: 2010,
    city: 'Barcelona',
    address: 'Passeig de Gràcia, Barcelona, Spain',
    license_plate: Faker::Number.number(8),
    availability: true,
    photo_urls: ["https://s-media-cache-ak0.pinimg.com/originals/9b/08/fd/9b08fd1f2096087ef617c46e5a31d692.jpg"],
    price: 120
  )

Motorcycle.create!(
    name: "Cruise in Amsterdam!",
    description: Faker::Hipster.sentence(3),
    user_id: 6,
    brand: "Moto Guzzi",
    model: "Le Mans 850",
    year: 1979,
    city: 'Amsterdam',
    address: 'Prinsengracht 263-267, Amsterdam, Netherlands',
    license_plate: Faker::Number.number(8),
    availability: true,
    photo_urls: ["http://kickstart.bikeexif.com/wp-content/uploads/2014/02/moto-guzzi-le-mans-matt-machine.jpg"],
    price: 150
  )

Motorcycle.create!(
    name: "Amster-dam-straight!",
    description: Faker::Hipster.sentence(3),
    user_id: 6,
    brand: "BMW",
    model: "R100RS",
    year: 1980,
    city: 'Amsterdam',
    address: 'Prinsengracht 150, Amsterdam, Netherlands',
    license_plate: Faker::Number.number(8),
    availability: true,
    photo_urls: ["http://bikebrewers.com/wp-content/uploads/2015/11/BMW-R100R-Caf%C3%A9-Racer-by-Diamond-Atelier.jpg"],
    price: 250
  )

  Motorcycle.create!(
    name: "Custom lady-magnet!",
    description: Faker::Hipster.sentence(3),
    user_id: 7,
    brand: "BMW",
    model: "RNineT",
    year: 2014,
    city: 'Amsterdam',
    address: 'Prinsengracht 33, Amsterdam, Netherlands',
    license_plate: Faker::Number.number(8),
    availability: true,
    photo_urls: ["https://s-media-cache-ak0.pinimg.com/originals/2f/4c/35/2f4c35fe0fc0f7539ef744d96b5d7165.jpg"],
    price: 180
  )





