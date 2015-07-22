require 'faker'

# 2.times do
#   user = User.new(
#     name:     Faker::Name.first_name,
#     lastname: Faker::Name.last_name,
#     email:    Faker::Internet.email,
#     password: Faker::Lorem.characters(10)
#   )
#   user.username = "#{user.name}#{user.lastname}".downcase
#   user.skip_confirmation!
#   user.save!
# end

admin = User.new(
  name:     'Admin',
  lastname: 'Member',
  email:    'admin@rosa.do',
  username: 'admin',
  password: 'holamundo',
  role:     'admin'
)

admin.skip_confirmation!
admin.save!

standard = User.new(
  name:     'Standard',
  lastname: 'Member',
  email:    'standard@rosa.do',
  username: 'standard',
  password: 'holamundo',
  role:     'standard'
)

standard.skip_confirmation!
standard.save!

premium = User.new(
  name:     'Premium',
  lastname: 'Member',
  email:    'premium@rosa.do',
  username: 'premium',
  password: 'holamundo',
  role:     'premium'
)

premium.skip_confirmation!
premium.save!

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