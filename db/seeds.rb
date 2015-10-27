# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Developer.create!(name: "Me", email: "me@me.com", password_digest: "password")

9.times do
  Developer.create!(name: Faker::Name.name,
      email: Faker::Internet.email,
      password_digest: "passsword")
end

20.times do
  Project.create!(name: Faker::Lorem.sentence,
    desc: Faker::Lorem.paragraph,
    max_hours: rand(1...200))
end

40.times do
  TimeEntry.create!(date: Faker::Date.backward,
    duration: rand(1...15),
    project_id: rand(1...20),
    developer_id: rand(1...10))
end
