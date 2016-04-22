class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def create
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user
    else 
      render 'edit'
    end
  end

  def destroy
  end

  private 

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :street, :city, :zip)
  end

end
