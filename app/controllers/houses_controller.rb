class HousesController < ApplicationController
  before_action :set_house, only: [:destroy, :adduser]
  before_action :require_user, only: [:new, :create]
  before_action :set_user, only: [:new, :create]


  def index
    @houses = House.all
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

  def destroy
    @house.destroy
    redirect_to houseStatus_path
  end

  def addRequest

    @house = House.find(params[:house])
    @user = User.new(firstName: "Bobby", lastName: "Fwabby", email: "fwabby@example.com", password: "example123")
    @request = Request.new(requestor_id: current_user.id)
    @request.save
    @house.requests << @request
    redirect_to houses_path
  end



  private
  def set_house
    @house = House.find(params[:id])
  end

  def user_params
    params.require(:house).permit(:name)
  end

  def set_user
    @user = User.find_by(params[:id])
  end



end
