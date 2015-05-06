require 'faker'

# a test user for development
# email: 		user@example.com
#password: 	hello

User.where(email: 'user@example.com').first_or_create do |u|
	u.email = 'user@example.com'
	u.name = 'Test User'
	u.password = 'hello'
	u.password_confirmation = 'hello'
	u.skip_confirmation!
end

# remove Test User's existing items:
u = User.find_by_email('user@example.com')
u.items.each { |i| i.delete }

# add five new items:
5.times do
	u = User.find_by_email('user@example.com') 
	i = Item.create(user: u, name: Faker::Hacker.say_something_smart)
	i.created_at = Faker::Time.between(10.days.ago, Time.now)
end

puts "created a Test User with id=#{u.id} and #{u.items.length} items."
puts "email: #{u.email}"
puts "password: hello" 