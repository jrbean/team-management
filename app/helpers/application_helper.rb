module ApplicationHelper
  def all_teams
    @teams = Team.all
  end

  def skip_led_teams
    Team.all - User.find(params[:id]).teams_led
  end
end
