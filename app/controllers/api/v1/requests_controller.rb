class Api::V1::RequestsController < ApplicationController
  before_action :authenticate_member!

  def create
    request = Request.create(request_params)
    if request.valid?
      render json: { request: RequestSerializer.new(request) }, status: :created
    else 
      render json: { errors: { error_obj: request.errors.messages, full_messages: request.errors.full_messages} }, status: :not_acceptable
    end 
  end 

  def index
    if params[:user_id]
      requests = Request.where(user_id: params[:user_id])
    else
      requests = Request.order(:start_time)
    end
    render json: requests
  end 

  def show
    request = Request.find(params[:id])
    render json: { request: RequestSerializer.new(request) }
  end 

  def update
    request = Request.find(params[:id])
    if request.update(status: params[:status])
      render json: { request: RequestSerializer.new(request) }
    else
      render json: { errors: { error_obj: request.errors.messages, full_messages: request.errors.full_messages} }, status: :not_acceptable
    end 
  end 

  private

  def request_params
    params.require(:request).permit(:start_time, :end_time, :party_size, :notes, :neighborhood_id, :price_range_id, :user_id, contacts_attributes: [:id, :phone])
  end 

end
