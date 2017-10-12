# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

 # Create Users
 5.times do
   User.create!(
   email:  Faker::Internet.email,
   password: 'hellowiki'
   )
 end
 users = User.all

  # Create Wikis
 15.times do
  Wiki.create!(
     title: Faker::Lorem.word,
     body:  Faker::Lorem.paragraph
   )
 end
wikis = Wiki.all

puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Wiki.count} wikis created"