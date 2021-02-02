class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception

    before_action :update_allowed_parameters, if: :devise_controller?
  
    protected
  
    def update_allowed_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :city, :state, :zip_code, :email, :password)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :city, :state, :zip_code, :email, :password, :current_password)}
    end

    def require_user
      if !signed_in?
        flash[:alert] = "You must be logged in to perform that action"
        redirect_to new_user_session_path
      end
  end

end
