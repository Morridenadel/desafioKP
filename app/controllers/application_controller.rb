class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authorize_request_for_admin(role)
    unless current_user.role == "admin"
      redirect_to pictures_path, notice: "You are not authorized to perform this action"
    end
  end
 
  protected
 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :role, :image])
  end
end
