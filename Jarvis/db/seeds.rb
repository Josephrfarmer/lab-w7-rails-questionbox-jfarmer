# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


1.times do
  User.create!(
    name: 'Joseph Farmer',
    username: 'Jfarm',
    email: 'josephr.farmer24@gmail.com',
    password: '1234'
    )
end

25.times do
  Question.create!(
    body: Faker::Lorem.paragraph,
    user_id: '1'
  )
end

10.times do
  Answer.create!(
    body: Faker::Lorem.paragraph,
    user_id: '1',
    question_id: '1'
  )
end

