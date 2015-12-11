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

  def team_set_teams(user_ids)
    ids = user_ids.map { |id| id.to_i }
    current_user_ids = self.users.pluck(:id)
    to_remove = current_user_ids - ids
    to_add = ids - current_user_ids
    self.user_teams.where(user_id: to_remove).delete_all
    to_add.each do |id|
      self.user_teams.create!(user_id: id)
    end
  end
end
