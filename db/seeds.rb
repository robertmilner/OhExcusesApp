
puts "Start time: #{Time.now}"

# Destroy all records in the database.
Excuse.destroy_all
Favorite.destroy_all
Location.destroy_all
Search.destroy_all
Tag.destroy_all
Tagging.destroy_all
User.destroy_all


# Create an array of locations that I actually know of.
# Limit to low amount so we can see location_id being repeated
# in multiple users accounts.
locations = %w(Chicago Lisle Naperville Elmhurst)

# Create my login info so that I can login with having to know
# some made up login information.
user = User.new do |u|
  u.name                   = "Robert Milner"
  u.email                  = "me@rbrtmlnr.com"
  u.password               = "Standard63"
  u.build_location.name    = "Chicago"
  u.save!

  10.times do
      u.excuses.create text: Faker::Lorem.sentence(word_count = rand(6..10)), location_id: u.location.id, tag_names: Faker::Lorem.words(num = rand(2..6)).join(' ')
  end
end
user.save!

puts "Robert Milner created."

10.times do 
  user = User.new do |u|
    u.name                  = Faker::Name.name
    u.email                 = Faker::Internet.email
    u.password              = "password"
    u.location              = Location.find_or_create_by_name(locations.sample)
    u.save!

    10.times do
      u.excuses.create text: Faker::Lorem.sentence(word_count = rand(6..10)), location_id: u.location.id, tag_names: Faker::Lorem.words(num = rand(2..6)).join(' ')
    end
  end
end
user.save!

puts "End time: #{Time.now}"

# What did we create?
puts "#{Excuse.count} excuses created"
puts "#{Favorite.count} favorites created"
puts "#{Location.count} locations created"
puts "#{Search.count} searches created"
puts "#{Tag.count} tags created"
puts "#{Tagging.count} taggings created"
puts "#{User.count} users created"
