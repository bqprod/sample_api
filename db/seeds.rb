# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

user = User.create(email: 'user@mail.com')
user2 = User.create(email: Faker::Internet.email)
user3 = User.create(email: Faker::Internet.email)

post1 = user.posts.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)
post2 = user.posts.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)
post3 = user.posts.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)
post4 = user2.posts.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)
post5 = user2.posts.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)
post6 = user2.posts.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)
post7 = user3.posts.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)
post8 = user3.posts.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)
post9 = user3.posts.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)

Like.create(user: user, post: post4)
Like.create(user: user, post: post5)
Like.create(user: user, post: post6)
Like.create(user: user3, post: post6)
Like.create(user: user2, post: post1)
Like.create(user: user2, post: post2)
Like.create(user: user2, post: post3)
Like.create(user: user2, post: post1)
Like.create(user: user3, post: post2)

Comment.create(user: user, post: post1, message: Faker::Lorem.sentence)
Comment.create(user: user, post: post1, message: Faker::Lorem.sentence)
Comment.create(user: user, post: post4, message: Faker::Lorem.sentence)
Comment.create(user: user, post: post7, message: Faker::Lorem.sentence)
Comment.create(user: user2, post: post1, message: Faker::Lorem.sentence)
Comment.create(user: user2, post: post2, message: Faker::Lorem.sentence)
Comment.create(user: user2, post: post3, message: Faker::Lorem.sentence)
Comment.create(user: user3, post: post1, message: Faker::Lorem.sentence)
Comment.create(user: user3, post: post4, message: Faker::Lorem.sentence)
Comment.create(user: user3, post: post4, message: Faker::Lorem.sentence)
