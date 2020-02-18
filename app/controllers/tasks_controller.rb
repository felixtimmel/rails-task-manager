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
    task = Task.new(save_params)
    task.save
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(save_params)
    redirect_to task_path(@task.id)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def completed_display(task)
    task ? 'This task is completed' : 'This task is not completed yet'
  end

  private

  def save_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def mark_as_done!(task)
    task.completed = true
  end
end
