class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def update_team
    @user = User.find(params[:id])
    @user.set_teams(params[:user][:team_ids].reject{ |s| s.empty? })

    redirect_to :back
  end

  def assign_lead
    @user = User.find(params[:id])
    redirect_to :back
  end

end
