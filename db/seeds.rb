User.create!(username: "vanderson", password: "vanderson")

10.times do |n|
    username = Faker::Name.name
    User.create!(username: username, password: "password")
end

users = User.order(:created_at).take(3)
2.times do
    users.each { |user| user.posts.create!(text: Faker::Lorem.sentence(word_count: 5)) }
end