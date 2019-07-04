class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    if user
      render json: user
    else
      render json: user.errors.full_messages, status: :not_found
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: :bad_request
    end
  end

  def destroy
    user = User.find(params[:id]) 
    if user.destroy
      render plain: "User destroyed"
    else
      render json: user.errors.full_mnessages, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :age)
  end
end