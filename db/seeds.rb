Category.create name: "Technology"
Category.create name: "War"
User.create name: "admin",
  email: "admin@admin.com",
  password: "123456",
  is_admin: true
User.create name: "user",
  email: "user@gmail.com",
  password: "123456"
20.times do |n|
  name  = Faker::Name.name
  email = "test-#{n+1}@gmail.com"
  User.create name: name,
    email: email,
    password: "123456"
end
40.times do |n|
  title = "Nàng kiều lỡ bước lần thứ #{n+1}"
  author = "sếp Tùng #{n+1}"
  category_id = n%2 +1
  Book.create title: title,
    author: author,
    category_id: category_id,
    number_of_pages: 22, 
    favorites: n,
    rating: n%5 
end
