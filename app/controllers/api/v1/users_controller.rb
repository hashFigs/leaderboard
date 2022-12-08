class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users, status: 200
  end

  def create
    user = User.new(
      login: user_params[:login]
    )

    if user.save
      render json: user, status: 200
    else
      render json: {error: "Error creating user"}
    end
  end

  private
  def user_params
    params.require(:user).permit([
      :login
    ]) 
    end   

end
