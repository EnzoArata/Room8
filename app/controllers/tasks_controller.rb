class TasksController < ApplicationController
  before_action :set_task, only: [:show, :destroy]
  before_action :require_user, except: [:show]
  before_action :require_same_user, only: [:destroy]
  before_action :define_task, only: [:completeTask]

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

  def destroy
    @task.destroy
    redirect_to houseStatus_path
  end

  def completeTask
    @task.completed = true
    @task.save
    redirect_to task_path(@task)
  end

  def completeTask
    @task.approved = true
    @task.save
    redirect_to task_path(@task)
  end


  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :startDate, :dueDate, :assignedUser)
  end

  def define_task
    @task = Task.find(params[:task])
  end


  def require_same_user
      if current_user.id != @task.createdBy
        flash[:alert] = "You can only edit or delete your own article"
        redirect_to houseStatus
      end
    end

end
