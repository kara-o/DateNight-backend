class Api::V1::RequestsController < ApplicationController

  def create
    if current_user.id == params[:user_id].to_i
      request = Request.create(request_params)
      if request.valid?
        render json: { request: request }, status: :created
      else 
        render json: { errors: { error_obj: request.errors.messages, full_messages: request.errors.full_messages} }, status: :not_acceptable
      end 
    else 
      byebug
      render json: { message: 'User ids do not match' }
    end 
    


  end 

  private

  def request_params
    params.require(:request).permit(:date, :start_time, :end_time, :cuisine, :neighborhood, :price, :user_id)
  end 

end
