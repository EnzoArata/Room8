class TasksController < ApplicationController
  before_action :set_task, only: [:show]

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.createdBy = session[:user_id]
    @task.house = current_user.house
    if @task.save
      flash[:notice] = "Task was created succesfully."
      redirect_to @task #Sends user to article show page
    else
      render 'new'
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :startDate, :dueDate, :assignedUser, :payment)
  end

end
