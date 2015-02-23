# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
markov = MarkyMarkov::Dictionary.new("moby_dicktionary")
users= []
categories = []

30.times do
  users << User.create(name: Faker::Name.name, password: '123456', email: Faker::Internet.email)
end

15.times do
  categories << Category.create(name: Faker::Company.catch_phrase)
end

100.times do
  Post.create(category: categories.sample, title: markov.generate_5_words, body: markov.generate_7_sentences, user: users.sample)
end
