User.create!(name: "Test User",
             email: "test@example.com",
             password: "foobar",
             password_confirmation: "foobar")

35.times do |n|
  User.create!(name: Faker::Name.name,
               email: "user_#{n}@example.com",
               password: "password",
               password_confirmation: "password")
end

users_with_posts = User.order(:created_at).take(5)
35.times do
  content = Faker::Lorem.paragraph(sentence_count: 7)
  users_with_posts.each { |user| user.posts.create!(content: content) }
end
