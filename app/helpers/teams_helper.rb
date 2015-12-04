module TeamsHelper

  def teams_list
    @teams = Team.all
  end

end
