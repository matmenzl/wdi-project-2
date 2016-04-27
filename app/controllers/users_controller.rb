class UsersController < ApplicationController
  before_filter :require_permission, only: :edit

  def require_permission
    if current_user != User.find(params[:id]) 
      flash[:warning] = "Naughty you! You cannot edit profiles of other users."
      redirect_to root_path
    end
  end

  # def index
  #   @users = User.all
  # end

  def index
    @q = User.search(params[:q])
    @users = @q.result(distinct: true)
    @users = User.near([current_user.latitude, current_user.longitude], 0.5)
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
    @user = User.find(params[:id])
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

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :street, :city, :zip, :user_image, :remote_user_image_url, :longitude, :latitude)
  end

end
