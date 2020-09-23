class PagesController < ApplicationController
  before_action :require_user, only: [:houseStatus]
  before_action :set_user, only: [:houseStatus]


  def home
  end

  def houseStatus
    @tasks = current_user.house.tasks
    @users = current_user.house.users
  end

  private

  def set_user
    @user = User.find_by(params[:id])
  end



end
