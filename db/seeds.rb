# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.save
end
users = User.all

#Create Items
105.times do
item = Item.create(
  name:         Faker::Lorem.sentence,
  description:  Faker::Lorem.paragraph,
  user: users.sample
)

# set the created_at to a time within the past year
item.update_attribute(:created_at, rand(10.minutes .. 2.weeks).ago)
end
items = Item.all

# Create an admin user
admin = User.new(
 name:     'Admin User',
 email:    'admin@example.com',
 password: 'helloworld',

)
admin.save

# Create a member
member = User.new(
 name:     'Member User',
 email:    'member@example.com',
 password: 'helloworld',
)
member.save

20.times do
item = Item.create(
  name:         Faker::Lorem.sentence,
  description:  Faker::Lorem.paragraph,
  user: User.find_by_email("member@example.com")
)
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"