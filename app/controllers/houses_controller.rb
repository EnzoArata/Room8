class HousesController < ApplicationController
  before_action :require_user, only: [:new, :create]
  before_action :set_user, only: [:new, :create]


  def index
    @houses = Houses.all
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(user_params)
    @house.owner = session[:user_id]
    @house.users << current_user
      if @house.save

        redirect_to houseStatus_path
      else
        render 'new'
      end
  end

  private
  def user_params
    params.require(:house).permit(:name)
  end

  def set_user
    @user = User.find_by(params[:id])
  end

end
