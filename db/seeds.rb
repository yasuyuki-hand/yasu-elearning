# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Daniel James",
  email: "test@email.com",
  password: "password",
  password_confirmation: "password",
  admin: true)


99.times do |n|
name = Faker::Food.dish
email = "user#{n+1}@email.com"
password = "password"

User.create!(name: name,
  email: email,
  password: password,
  password_confirmation: password)
end


  users = User.all
  user = users.first
  following = users[2..50]
  followers = users[3..40]

  following.each { |followed| user.follow(followed) }
  followers.each { |follower| follower.follow(user) }


  title = "TOEIC Words"
  description = "Academic name"
  word = "What is the study of computers?"
  category = Category.create!(title: title, description: description)

  words = Word.create!(
      word: word,
      category_id: category.id,
      choices_attributes:[
        { choices: "sociology", correct_ans: false},
        { choices: "mathmatice", correct_ans: false},
        { choices: "computer science", correct_ans: true}
      ]
  )
  



