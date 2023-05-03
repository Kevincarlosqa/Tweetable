require "json"
require 'faker'

puts "Start seeding"

User.destroy_all
Tweet.destroy_all
Like.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('tweets')
ActiveRecord::Base.connection.reset_pk_sequence!('likes')

puts "Seeding Users"

admin = User.create(username: "admin", email: "admin@mail.com", name: "admin")
user1 = User.create(username: "user1", email: "user1@mail.com", name: Faker::Name.name)
user2 = User.create(username: "user2", email: "user2@mail.com", name: Faker::Name.name)
user3 = User.create(username: "user3", email: "user3@mail.com", name: Faker::Name.name)
user4 = User.create(username: "user4", email: "user4@mail.com", name: Faker::Name.name)

puts "Seeding Tweets"

rand(1..4).times { Tweet.create(body: Faker::Lorem.paragraph, user:user1) }
rand(1..4).times { Tweet.create(body: Faker::Lorem.paragraph, user:user2) }
rand(1..4).times { Tweet.create(body: Faker::Lorem.paragraph, user:user3) }
rand(1..4).times { Tweet.create(body: Faker::Lorem.paragraph, user:user4) }

p user1.tweets.sample

rand(1..7).times { Tweet.create(body: Faker::Lorem.paragraph, user:user1, replied_to: User.all.sample.tweets.sample) }
rand(1..7).times { Tweet.create(body: Faker::Lorem.paragraph, user:user2, replied_to: User.all.sample.tweets.sample) }
rand(1..7).times { Tweet.create(body: Faker::Lorem.paragraph, user:user3, replied_to: User.all.sample.tweets.sample) }
rand(1..7).times { Tweet.create(body: Faker::Lorem.paragraph, user:user4, replied_to: User.all.sample.tweets.sample) }

rand(1..10).times { Like.create(user:user1, tweet: Tweet.all.sample) }
rand(1..10).times { Like.create(user:user2, tweet: Tweet.all.sample) }
rand(1..10).times { Like.create(user:user3, tweet: Tweet.all.sample) }
rand(1..10).times { Like.create(user:user4, tweet: Tweet.all.sample) }

