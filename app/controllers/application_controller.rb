class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!, except: [:home, :signup, :register]
  before_filter :require_permission, only: :edit


  def require_permission
    if current_user != Post.find(params[:id]).user
      flash[:warning] = "Naughty you! You cannot edit posts of other users."
      redirect_to root_path
    end
  end

  protected
  def after_sign_in_path_for(resource)
    root_path
  end
  
  class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :username, :first_name, :last_name, :street, :zip, :city) }
    end
  end


end
