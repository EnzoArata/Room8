class TasksController < ApplicationController
  before_action :set_task, only: [:show, :destroy]
  before_action :require_user, except: [:show]
  before_action :require_same_user, only: [:destroy]
  before_action :define_task, only: [:completeTask, :approveTask, :uncompleteTask]

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.createdBy = session[:user_id]
    @task.house = current_user.house

    if @task.recurring == false
      if @task.save
        redirect_to @task and return
      else
        render 'new'
      end


    else

      if @task.save
        @task.occurences.times do |i|
          if i > 0
            @task = Task.new(task_params)
            @task.createdBy = session[:user_id]
            @task.house = current_user.house
            i.times do |g|
              @task.startDate += 1.month
              @task.dueDate += 1.month
            end
            @task.save
          end
        end
        redirect_to houseStatus_path
      else
        render 'new'
      end


    end

  end

  def createManyTasks

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

  def uncompleteTask
    @task.completed = false
    @task.save
    redirect_to task_path(@task)
  end

  def approveTask
    @task.approved = true
    @task.save
    redirect_to task_path(@task)
  end


  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :startDate, :dueDate, :assignedUser, :recurring, :occurences)
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
