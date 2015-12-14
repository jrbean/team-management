class ProgressesController < ApplicationController

  def update
    @progress = Progress.find_by(team_id: params[:team_id], task_id: params[:id], user_id: params[:user_id])

    @progress.update!(complete: true)
    redirect_to :back
  end

end
