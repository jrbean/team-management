class ChartsController < ApplicationController

  def completed_tasks
    render json: Progress.group_by_team(:complete).count
  end
end
