# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	user = User.create({email:"aa1@gmail.com", name:"aa1", password:"53N9OK37", password_confirmation:"53N9OK37"})

	for i in 1..3 do
		User.create({email:"a#{i}@gmail.com", name:"a#{i}", password:"53N9OK37", password_confirmation:"53N9OK37"})
	end


	for i in 1..10 do
		User.create({email:"auto#{i}@gmail.com", name:"auto#{i}", password:"53N9OK37", password_confirmation:"53N9OK37"})
	end
