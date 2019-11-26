class Api::V1::RequestsController < ApplicationController

  def create
    request = Request.create(request_params)
    if request.valid?
      render json: { request: RequestSerializer.new(request) }, status: :created
    else 
      render json: { errors: { error_obj: request.errors.messages, full_messages: request.errors.full_messages} }, status: :not_acceptable
    end 
  end 

  def index
    byebug
    requests = Request.all 
    render json: requests
  end 

  def show
    request = Request.find(params[:id])
    render json: { request: RequestSerializer.new(request) }
  end 

  private

  def request_params
    params.require(:request).permit(:date, :start_time, :end_time, :size, :user_id, cuisines_requests_attributes: [:cuisine_id], neighborhoods_requests_attributes: [:neighborhood_id], prices_requests_attributes: [:price_id])
  end 

end
