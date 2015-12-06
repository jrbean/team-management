class TasksPolicy < ApplicationPolicy

  def assign?
    lead_teams = user.user_teams.where(role: 'team_lead').pluck(:team_id)
    UserTeam.where(user_id: record_user_id, team_id: lead_teams).exists?
  end

  def create?
    user.user_teams.where(role: 'team_lead').any?
  end

  def edit?
    lead_teams = user.user_teams.where(role: 'team_lead').pluck(:team_id)
    UserTeam.where(user_id: record_user_id, team_id: lead_teams).exists?
  end

  def delete?
   lead_teams = user.user_teams.where(role: 'team_lead').pluck(:team_id)
   UserTeam.where(user_id: record_user_id, team_id: lead_teams).exists?
  end

end
