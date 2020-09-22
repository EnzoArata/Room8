class HousesController < ApplicationController

  def index
    @houses = Houses.all
  end
end
