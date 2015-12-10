class UserTeamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @team = Team.find(params[:team_id])
    @users = @team.users
    @user_team = UserTeam.new
  end

  def update
    user_team = UserTeam.find(params[:id])

    #authorize UserTeam

    user_team.update!(role: 'team_lead')

    redirect_to :back
  end

end
