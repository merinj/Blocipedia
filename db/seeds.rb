# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  # Create an admin user
 admin = User.create!(
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 
 # Create a standard
 standard = User.create!(
   email:    'standard@example.com',
   password: 'helloworld'
 )
# Create a premium user
 premium = User.create!(
   email:    'premium@example.com',
   password: 'helloworld'
 )