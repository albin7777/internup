# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating intern user"
5.times do
  User.create!(
    name: Faker::Name.name,
    role: 'intern',
    description: "I am a student looking for a #{Faker::Job.title} internship",
    email: Faker::Internet.email,
    password: '123456'
  )
end

puts "Creating business users"
5.times do
  User.create!(
    name: Faker::Company.name,
    role: 'business',
    description: "We are a company in the #{Faker::Job.field} industry",
    email: Faker::Internet.email,
    password: '123456'
  )
end

puts "Creating position..."
5.times do
  Position.create!(

    user: User.where(role:'business').sample,
    description: 'Looking for the stated job title',
    title: Faker::Job.title,
    salary: "#{rand(800..1000)} Yen",
    duration: "#{rand(1..12)} months"
  )
end

puts "Creating submission..."
5.times do
  Submission.create!(
    user: User.where(role:'intern').sample,
    position: Position.all.sample,
    status: Submission::STATUS.sample

  )
end

puts "Creating demo intern user"
  User.create!(
    name: "Chii",
    role: 'intern',
    description: "I am a student looking for a #{Faker::Job.title} internship",
    email: "cyee3012@hotmail.co.uk",
    password: '123456'
  )
