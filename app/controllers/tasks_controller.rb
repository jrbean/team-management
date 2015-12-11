class TasksController < ApplicationController
  before_action :authenticate_user!

  def create
    authorize Task
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task, flash: { notice: 'Task was successfully created. ' }
    else
      render :new
    end

  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        redirect_to @task, flash: { notice: 'Task was successfully updated.' }
      else
        render :edit
      end
    end
  end

  def destroy
    authorize Task
  end

  def edit
    authorize Task
    @task = Task.find params[:id]
  end

  def new
    @task = Task.new
  end

  def index
    @tasks = Task.all
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
