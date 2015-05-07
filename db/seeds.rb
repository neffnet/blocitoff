require 'faker'

# a test user for development
# email: 		user@example.com
#password: 	hello

User.where(email: 'user@example.com').first_or_create do |u|
	update = {
		name: 'Test User',
		password: 'hello',
		password_confirmation: 'hello'
	}
	u.update_attributes(update)
	u.skip_confirmation!
end

# remove Test User's existing items:
u = User.find_by_email('user@example.com')
u.items.each { |i| i.delete }

# add some new items:
5.times do
	i = Item.create(user: u, name: Faker::Hacker.say_something_smart)
	i.update_attributes!(created_at: Faker::Time.backward(10))
end
5.times do
	i = Item.create(user: u, name: Faker::Hacker.say_something_smart)
	i.update_attributes!(created_at: Faker::Time.between(8.days.ago, 6.days.ago))
end

puts "created a Test User with id=#{u.id} and #{u.items.length} items."
puts "email: #{u.email}"
puts "password: hello"