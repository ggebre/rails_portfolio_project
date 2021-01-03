# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(1..5).each do |n|
    (1..5).each do |j|
        Room.create(floor: n, number: "#{n}_#{j}")
    end
end

Nurse.create(name: "Getu Gebre", email: "getu.gebre.gg@gmail.com")
Nurse.create(name: "Sami Gebre", email: "sami.gebre.gg@gmail.com")
Nurse.create(name: "First Last", email: "first.last@gmail.com")
Nurse.create(name: "Ruth Gebre", email: "ruth.gebre.gg@gmail.com")
