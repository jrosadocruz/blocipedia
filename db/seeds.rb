require 'faker'

2.times do
  user = User.new(
    name:     Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.username = "#{user.name}#{user.lastname}".downcase
  user.skip_confirmation!
  user.save!
end

admin = User.new(
  name:     'Jose',
  lastname: 'Rosado',
  email:    'jose@rosa.do',
  username: 'joserosado',
  password: 'holamundo',
  role:     'admin'
)

admin.skip_confirmation!
admin.save!

users = User.all

random_boolean = [true, false]

15.times do
  wiki = Wiki.create!(
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph,
    user: users.sample,
    private: random_boolean.sample
  )
end

wikis = Wiki.all


puts "Seed finished!"
puts "#{User.count} users created."
puts "#{Wiki.count} wikis created."