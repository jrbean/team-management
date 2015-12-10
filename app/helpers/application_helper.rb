module ApplicationHelper
  def all_teams
    @teams = Team.all
  end

  def skip_led_teams
    Team.all - current_user.teams_led
  end
end
