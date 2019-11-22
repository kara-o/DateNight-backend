class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    users = User.all 
    render json: users
  end 
  
  def create
    user = User.create(user_params)
    if user.valid?
      token = encode_token(user_id: user.id)
      render json: { user: user, jwt: token}, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :not_acceptable
    end 
  end 

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :first_name, :last_name)
  end 
end




