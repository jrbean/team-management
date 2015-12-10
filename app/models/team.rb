class Team < ActiveRecord::Base
  has_many :users, :through => :user_teams
  has_many :tasks, :through => :team_tasks
  has_many :user_teams
  has_many :team_tasks
  validates_presence_of :name
  validates_uniqueness_of :name


  def leader
    lead_id = user_teams.where(role: 'team_lead').pluck(:user_id)
    User.where(id: lead_id)
  end
end
