# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(
  first_name: 'albert',
  last_name: 'einstein',
  email: 'ae@relativity.com'
)

user = User.create(
  first_name: 'marie',
  last_name: 'curie',
  email: 'mc@radiation.com'
)

user = User.create(
  first_name: 'issac',
  last_name: 'newton',
  email: 'in@gravity.com'
)

user = User.create(
  first_name: 'galileo',
  last_name: 'galilel',
  email: 'gg@astronomy.com'
)

5.times do |i|
  puts "Creating user #{i+1}"
  User.create(
    first_name: "User #{i+1}",
    last_name: "Lname #{i+1}",
    email: "user#{i+1}@demo.com"
  )
end