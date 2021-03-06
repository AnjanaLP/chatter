35.times do |n|
  User.create!(name: Faker::Name.name,
               email: "user_#{n}@example.com",
               password: "password",
               password_confirmation: "password")
end

users_with_posts = User.order(:created_at).take(5)
35.times do
  content = Faker::Lorem.paragraph(sentence_count: 7)
  users_with_posts.each { |user| user.posts.create!(content: content, created_at: (2..25).to_a.sample.days.ago) }
end

users = User.all
user  = users.first
following = users[2..30]
followers = users[3..20]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
