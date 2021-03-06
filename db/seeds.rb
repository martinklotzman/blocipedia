require 'random_data'
require 'faker'

# Create Users
5.times do
  User.create!(
    #name: RandomData.random_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    confirmed_at: Time.now.utc # manually setting this prevents the confirmation email from being sent
  )
end

# Create standard user
1.times do
  User.create!(
  email:     'standard@gmail.com',
  password:  'helloworld',
  role:       0,
  confirmed_at: Time.now.utc # manually setting this prevents the confirmation email from being sent
  )
end

# Create admin user
1.times do
  User.create!(
  email:     'admin@gmail.com',
  password:  'helloworld',
  role:       2,
  confirmed_at: Time.now.utc # manually setting this prevents the confirmation email from being sent
  )
end

# Create premium user
1.times do
  User.create!(
  email:     'premium@gmail.com',
  password:  'helloworld',
  role:       1,
  confirmed_at: Time.now.utc # manually setting this prevents the confirmation email from being sent
  )
end

users = User.all

# Create Wikis
50.times do
  Wiki.create!(
    user: users.sample,
    title:  Faker::Seinfeld.quote,
    body:   Faker::RickAndMorty.quote,
    private: false
  )
end

# Create Private Wikis
10.times do
  Wiki.create!(
    user: users.sample,
    title:  'Private - ' + Faker::Seinfeld.quote,
    body:   Faker::RickAndMorty.quote,
    private: true
  )
end

wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
