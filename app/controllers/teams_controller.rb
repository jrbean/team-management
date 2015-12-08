class TeamsController < ApplicationController
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
  end

  def new
    @team = Team.new
  end

  def edit
  end

  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        redirect_to @team, flash[:notice] = 'Team was successfully created.'
      else
        render :new
      end
    end
  end

  def update
    respond_to do |format|
      if @team.update(team_params)
        redirect_to @team, flash[:notice] = 'Team was successfully updated.'
      else
        render :edit
      end
    end
  end

  def destroy
    @team.destroy
    respond_to do |format|
      redirect_to teams_url, flash[:notice] = 'Team was successfully destroyed.'
    end
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name)
    end
end
