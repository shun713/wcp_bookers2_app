class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :configere_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user.id) 
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  
  protected
  def configere_permitted_parameters
    added_attrs = [:user_name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
   # devise_parameter_sanitizer.permit(:sign_up,keys: [:name])
  end
end
