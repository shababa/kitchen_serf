# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = ['Michelle', 'Garett', 'Blair', 'Arvind', 'Elisha', 'Robert', 'Andrew', 'Matt']

users.each do |name|
	User.create(name: name, email: name.downcase + '@blahtest.com')
end

u = User.find_by(name: "Michelle")	
u.update(last_time: Date.today.prev_day)