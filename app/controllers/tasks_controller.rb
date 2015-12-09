class TasksController < ApplicationController

  def create
  end

  def update
  end

  def destroy
  end

  def edit
  end

  def new
  end

  def index
    @tasks = Task.all
  end
end
