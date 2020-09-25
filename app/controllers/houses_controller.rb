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
    @house.requests.each do |request|
        if current_user == User.find(request.requestor_id)
          flash[:notice] = "You have already sent a request to join this house"
          redirect_to houses_path and return
        else

        end

    end
    @request = Request.new(requestor_id: current_user.id)
    @request.save
    @house.requests << @request
    flash[:notice] = "Request Sent"
    redirect_to houses_path
  end

  def acceptRequest
    @house = current_user.house
    @request = Request.find(params[:request])
    @user = User.find(@request.requestor_id)
    @request.destroy
    @house.requests.delete(@request)
    redirect_to addToHouse_path(:user => @user.id)
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
