class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

protect_from_forgery with: :exception, prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user

  protected
     def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:nick ,:email, :encrypted_password, :password_confirmation, :password, :avatar) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:nick,:email, :avatar, :current_password) }
     end
end
