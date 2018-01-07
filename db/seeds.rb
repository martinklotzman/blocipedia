require 'random_data'

# Create Users
5.times do
  User.create!(
    #name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence,
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
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end

wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
