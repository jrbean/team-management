# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: 'bob', email: 'bob@example.com', password: 'password')
Task.create(name: 'Do the thing', description: 'The Thing')
Team.create(name: 'Practice Team')
Condition.create(description: 'Crunch')
Progress.create(team_id: 1, task_id: 1, user_id: 2)
