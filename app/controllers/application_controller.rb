class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :authenticate_user!, except: [:home, :signup, :register]
  before_action :set_search_parameters


  protected
  def after_sign_in_path_for(resource)
    root_path
  end
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :username, :user_image, :remote_user_image_url, :first_name, :last_name, :street, :zip, :city, :longitude, :latitude) }
    end

    def set_search_parameters
      @q = User.search(params[:q])
      @posts = @q.result(distinct: true)
    end
end
