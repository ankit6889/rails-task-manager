class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path(@tasks)
  end

  def edit
    set_params
  end

  def update
    set_params
    @task.update(task_params)
    redirect_to tasks_path(@tasks)
  end

  def destroy
    set_params
    @task.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to tasks_path(@tasks), status: :see_other
  end

  private

  def set_params
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
