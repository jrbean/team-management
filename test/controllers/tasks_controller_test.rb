require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @admin = User.create!(username: 'admin', email: 'admin@example.com', password: 'password', admin: true)
    @user = User.create!(username: 'user', email: 'user@example.com', password: 'password', admin: false)
    @team_lead = User.create!(username: 'team_lead', email: 'team_lead@example.com', password: 'password', admin: false)
    @test_team = Team.create!(name: 'test_team')
    @test_team2 = Team.create!(name: 'test_team2')
    @test_user_team = UserTeam.create!(team_id: 1, user_id: 3, role: 'team_lead')
    @test_user_team2 = UserTeam.create!(team_id: 2, user_id: 2, role: 'user')
  end

  test 'non-team leads cannot create tasks' do
  end

  test 'team leads can create tasks' do
  end

  test 'non-team leads cannot assign tasks' do

  end

  test 'team leads can assign tasks' do

  end
end
