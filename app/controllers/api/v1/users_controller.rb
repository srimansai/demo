class Api::V1::UsersController < ApplicationController
  before_action :set_controller, only: [:show, :update, :destroy]

  def index
    @user = User.all.page(params[:page])
    render json: @user
  end  

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
     render json: @user, status: :created
    else
     render json: @user.errors, status: :unprocessable_entity
    end 
  end

  def update
    if @user.update(user_params)
      render json: @user, status: 200
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end    

  def destroy
    @user.destroy!
    render json: @user
  end

   private

   def set_controller
    @user = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email
    )
  end
end
