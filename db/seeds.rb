# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

15.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Hipster.sentence, 
    email: Faker::Name.first_name+"@yopmail.com",
    encrypted_password: Faker::Internet.password
  )
end
puts "Les utilisateurs ont été créé"

15.times do
  event = Event.create!(
    start_date: Faker::Time.forward(days: 360),
    duration: Faker::Number.between(from: 10, to: 10),
    title: Faker::Book.title,
    description: Faker::Lorem.paragraph,
    price: Faker::Number.within(range: 1..100),
    location: Faker::Address.city,
    admin: User.all.sample
  )
end
puts "Les évènements ont été créé"

15.times do
  attendance = Attendance.create!(
    stripe_customer_id: Faker::Internet.uuid,
    event: Event.all.sample,
    user: User.all.sample
  )
end
puts "Les participations ont été créées"
