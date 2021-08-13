class ApplicationController < ActionController::Base
  before_action :configere_permitted_parameters, if: :devise_controller?
  protect_from_forgery

  def after_sign_in_path_for(resource)
    user_path(current_user.id) 
  end

  def after_sign_out_path_for(resource)
    top_path 
  end
  
  protected
  def configere_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:name])
  end
end
