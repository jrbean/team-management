class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.try(:admin)
      @teams = Team.all
    elsif current_user.try(:team_lead)
      @teams = current_user.teams_led
    elsif current_user
      @teams = current_user.teams
    else
      @teams = []
    end
  end

  def show
    @team = Team.find(params[:id])
    @user_teams = @team.user_teams.includes(:user)
  end

  def new
    @team = Team.new
  end

  def edit
  end

  def create
    authorize Team
    @team = Team.new(team_params)

    if @team.save
      redirect_to @team, flash: { notice: 'Team was successfully created.' }
    else
      render :new
    end
  end

  def update
    @team = Team.find(params[:id])
    @team.team_set_teams(params[:team][:user_ids].reject{ |s| s.empty? })

    if @team.update(team_params)
      redirect_to @team, flash: { notice: 'Team was successfully updated.' }
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_url, flash: { notice: 'Team was successfully destroyed.' }
  end

  def get_users
    @team = Team.find(params[:id])
    @user = User.all
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name)
    end
end
