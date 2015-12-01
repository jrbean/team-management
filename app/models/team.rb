class Team < ActiveRecord::Base
  has_many :users, :through => :user_teams
  has_many :tasks, :through => :team_tasks
  has_many :user_teams
  has_many :team_tasks
  validates_presence_of :name
  validates_uniqueness_of :name
end
