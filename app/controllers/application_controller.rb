class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # rescue_from Pundit::NotAuthorizedError do |exception|
  #   redirect_to root_url, alert: exception.message
  #   # redirect_to root_url, alert: 'You are not allowed to do that. Please log in or create an account.'
  # end

  protected

  # http://www.peoplecancode.com/tutorials/adding-custom-fields-to-devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :lastname, :username, :email, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :lastname, :username, :email, :password, :current_password) }
  end

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
    redirect_to(request.referrer || root_path)
  end

end
