# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Submission.destroy_all
Position.destroy_all
User.destroy_all


require 'nokogiri'

filepath = "db/results.html"

html_content = File.open(filepath)

doc = Nokogiri::HTML(html_content)

internship_title = []
doc.search('.job-result-card__title').each do |element|
  internship_title << element.text.strip
end

internship_description = []
doc.search('.job-result-card__snippet').each do |element|
  internship_description << element.text.strip
end

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
    description: internship_description.sample,
    title: internship_title.sample,
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

puts "Creating demo intern user/Chii"
  User.create!(
    name: "Chii Law",
    role: 'intern',
    description: "I am a student looking for a #{Faker::Job.title} internship",
    email: "cyee3012@hotmail.co.uk",
    password: '123456'
  )

puts "Creating demo intern user/Mayu"
  User.create!(
    name: "Mayu Miyoshi",
    role: 'intern',
    description: "I am a student looking for a #{Faker::Job.title} internship",
    email: "mayu.miyoshi1313@gmail.com",
    password: '123456'
  )

puts "Creating demo intern user/Albin"
  User.create!(
    name: "Albin Ngawing",
    role: 'intern',
    description: "I am a student looking for a #{Faker::Job.title} internship",
    email: "fabianalbin7@gmail.com",
    password: '123456'
  )

puts "Creating demo business user/Chii"
  User.create!(
    name: "Chii Law",
    role: 'business',
    description: "We are a company in the #{Faker::Job.field} industry",
    email: "b-cyee3012@hotmail.co.uk",
    password: '123456'
  )

puts "Creating demo business user/Mayu"
  User.create!(
    name: "Mayu Miyoshi",
    role: 'business',
    description: "We are a company in the #{Faker::Job.field} industry",
    email: "b-mayu.miyoshi1313@gmail.com",
    password: '123456'
  )

puts "Creating demo business user/Albin"
  User.create!(
    name: "Albin Ngawing",
    role: 'business',
    description: "We are a company in the #{Faker::Job.field} industry",
    email: "b-fabianalbin7@gmail.com",
    password: '123456'
  )

puts "Creating positions for demo account"
9.times do
  Position.create!(
    user: User.where(email:"b-fabianalbin7@gmail.com").first,
    description: internship_description.sample,
    title: internship_title.sample,
    salary: "#{rand(800..1000)} Yen",
    duration: "#{rand(1..12)} months"
  )
end
