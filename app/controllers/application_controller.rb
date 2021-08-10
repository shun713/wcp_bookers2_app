class ApplicationController < ActionController::Base
  before_action :configere_permitted_parameters, if: :devise_controller?
  
  protected
  def configere_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:name])
  end
end
