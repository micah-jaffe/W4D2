# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


felix0 = Cat.create!(name: 'Felix0', color: 'brown', birth_date: '2015/01/01', sex: 'M', description: 'a cat')
felix1 = Cat.create!(name: 'Felix1', color: 'brown', birth_date: '2015/01/01', sex: 'M', description: 'a cat')
felix2 = Cat.create!(name: 'Felix2', color: 'brown', birth_date: '2015/01/01', sex: 'M', description: 'a cat')

request1 = CatRentalRequest.new(cat_id: 8, start_date: "2017/05/01", end_date: "2018/06/01", status: "PENDING")
