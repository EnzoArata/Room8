class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :define_user, only: [:addToHouse, :removeFromHouse]

  def show

  end

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path
      else
        render 'new'
      end
  end

  def addToHouse
    @house = User.find(session[:user_id]).house

    if @house.users << @user
      redirect_to houseStatus_path
    else
      redirect_to houseStatus_path
    end
  end

  def removeFromHouse
    @house = User.find(session[:user_id]).house
    @house.users.delete(@user)
    redirect_to houseStatus_path
  end


  private
  def user_params
    params.require(:user).permit(:firstName, :lastName, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def define_user
    @user = User.find(params[:user])
  end

end
