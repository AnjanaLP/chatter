50.times do |n|
  User.create!(name: Faker::Name.name,
               email: "user_#{n}@example.com",
               password: "password",
               password_confirmation: "password")
end
