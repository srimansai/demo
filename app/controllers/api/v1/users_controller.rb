class Api::V1::UsersController < ApplicationController
  
  def index
    render json: User.all.page(params[:page])
  end  

  def show
    render json: User.find_by(params[:id])
  end
  
  def create
    @user = User.new(user_params)

    if @user
      @user.save
     render json: @user, status: :created
    else
     render json: @user.errors, status: :unprocessable_entity
    end 
  end

  def update 
    @user = User.find(params[:id])
    if @user
      @user.update(user_params)
      render json: @user, status: 200
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end    

  def destroy
    User.find(params[:id]).destroy!
    head :no_content
  end

   private

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email
    )
  end
end
