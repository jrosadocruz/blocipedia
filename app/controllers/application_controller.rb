class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # http://www.peoplecancode.com/tutorials/adding-custom-fields-to-devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :lastname, :username, :email, :password) }
    # devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :lastname, :username, :email, :password, :current_password) }
  end

end
