class TasksController < ApplicationController

  def create
  end

  def update
  end

  def destroy
  end

  def edit
    @task = Task.find params[:id]
  end

  def new
  end

  def index
    @tasks = Task.all
  end
end
