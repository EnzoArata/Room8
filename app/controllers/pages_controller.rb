class PagesController < ApplicationController
  before_action :require_user, only: [:houseStatus]
  before_action :set_user, only: [:houseStatus]


  def home
    redirect_to houseStatus_path if logged_in?
  end

  def houseStatus

    if current_user.house != nil
      @tasks = current_user.house.tasks.reverse_order
      @payments = current_user.house.payments.reverse_order
      @users = current_user.house.users
      @requests = current_user.house.requests
    else

    end
  end

  private

  def set_user
    @user = User.find_by(params[:id])
  end



end
