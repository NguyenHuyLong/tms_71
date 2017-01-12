# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Diem Ly Vu",
  email: "diemly@example.com",
  password: "111111",
  password_confirmation: "111111")

User.create!(name: "Admin", email: "admin@gmail.com",
  password: "123456", password_confirmation: "123456", supervisor: true)

Course.create!(
  name: "Course 1",
  description: "abc",
  start_date: nil,
  end_date: nil,
  status: 0)

Course.create!(
  name: "Course2",
  description: "abc",
  start_date: nil,
  end_date: nil,
  status: 1)

Course.create!(
  name: "Course3",
  description: "abc",
  start_date: nil,
  end_date: nil,
  status: 2)
