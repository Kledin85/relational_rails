# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  course_1 = Course.create!(name: "Kyles Course", city: "Ankeny", tee_times: 45)
  course_2 = Course.create!(name: "Not Kyles Course", city: "Des Moines", tee_times: 50)
  golfer_1 = course_1.golfers.create!(name: "Kyle", adult: true, tee_time: Time.now)
  golfer_2 = course_1.golfers.create!(name: "Wes", adult: true, tee_time: Time.now)
  golfer_3 = course_2.golfers.create!(name: "John", adult: true, tee_time: Time.now)