class RequestsController < ApplicationController

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
      if @request.save

        redirect_to root_path
      else

      end
  end

  private
  def request_params
    params.require(:request).permit(:requestor_id)
  end
end
