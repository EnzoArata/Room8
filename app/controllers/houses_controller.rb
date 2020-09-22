class HousesController < ApplicationController

  def index
    @houses = Houses.all
  end

  def new
  end 
end
