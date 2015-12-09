User.delete_all
Team.delete_all
Task.delete_all
Condition.delete_all
Progress.delete_all


User.create(username: 'bob', email: 'bob@example.com', password: 'password', confirmed_at: Time.now)
User.create(username: 'steve', email: 'steve@example.com', password: 'password', admin: true, confirmed_at: Time.now)
User.create(username: 'ezekiel', email: 'ezekiel@example.com', password: 'password', confirmed_at: Time.now)
User.create(username: 'sarah', email: 'sarah@example.com', password: 'password', confirmed_at: Time.now)
User.create(username: 'june', email: 'june@example.com', password: 'password', confirmed_at: Time.now)
User.create(username: 'petra', email: 'petra@example.com', password: 'password', confirmed_at: Time.now)
Task.create(name: 'Do the thing', description: 'The Thing')
Task.create(name: 'Synergy', description: 'Cross promotion and brand identity')
Task.create(name: 'Hegemony', description: 'Establish global military order')
Task.create(name: 'Graduate', description: 'Complete academic requirements')
Team.create(name: 'Practice Team')
Team.create(name: 'Corporate Team')
Team.create(name: 'Tactical Team')
Team.create(name: 'Educational Team')
Condition.create(description: 'Crunch')
Condition.create(description: 'Rain')
Condition.create(description: 'Spring Semester')
