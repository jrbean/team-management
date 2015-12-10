class TasksController < ApplicationController
  before_action :authenticate_user!

  def create
    authorize Task
  end

  def update
  end

  def destroy
    authorize Task
  end

  def edit
    authorize Task
    @task = Task.find params[:id]
  end

  def new
  end

  def index
    @tasks = Task.all
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
