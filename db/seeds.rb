Category.create name: "Technology"
Category.create name: "War"
User.create name: "admin",
  email: "admin@admin.com",
  password: "123456",
  is_admin: true

20.times do |n|
  name  = Faker::Name.name
  email = "test-#{n+1}@gmail.com"
  User.create name: name,
    email: email,
    password: "123456"
end
