#Making sure that this user always gets created
User.create(email: "andrefe91@gmail.com", password: "password")

#At random, another 19 users will be created
19.times do
  User.create(email: "#{Faker::Name.first_name.downcase}@gmail.com", password: "password")
end
