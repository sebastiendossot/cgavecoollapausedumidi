# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
teams = Team.create([{ name: 'The Dark Side' }, { name: 'The Bright Side' }])
User.create([{ email: 'dark-vador@highground.com', team_id: teams[0].id, password: 'password' }, { email: 'dark-maul@highground.com', team_id: teams[0].id, password: 'password' }, { email: 'obi-wan@highground.com', team_id: teams[1].id, password: 'password' }])