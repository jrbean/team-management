module ApplicationHelper
  def all_teams
    @teams = Team.all
  end

  def skip_led_teams
    Team.all - User.find(params[:id]).teams_led
  end

  def available_teams
    (User.find(params[:id]).teams - current_user.teams_led) - User.find(params[:id]).teams_led
  end

 # def promotable_teams
 #   available_teams.pluck(:id)
 # end

 # def available_users
 #   Team.find(params[:id]).users
 # end

end
