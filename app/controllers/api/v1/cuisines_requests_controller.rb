class Api::V1::CuisinesRequestsController < ApplicationController

  def create
    cuisines_request = CuisinesRequest.create(request_id: params[:request_id], cuisine_id: params[:cuisine_id])
    render json: cuisines_request
  end 

end
