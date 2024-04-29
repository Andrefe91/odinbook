#Making sure that this user always gets created
User.create(name: "Andres Felipe Muñoz", username: "andrefe91", email: "andrefe91@gmail.com", password: "password")

#At random, another 19 users will be created
19.times do
  name_complete = Faker::Name.name
  name = name_complete.split(" ")[0].downcase

  User.create(name: name_complete, username: name, email: "#{name}@gmail.com", password: "password")
end
