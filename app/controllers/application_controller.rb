class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found
    redirect_to root_path, notice: 'Record not found'
  end

  def routing_error
    redirect_to authenticated_root_path, notice: 'Invalid route' if user_signed_in?
    redirect_to unauthenticated_root_path, notice: 'Invalid route' unless user_signed_in?
  end

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :full_name, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email, :full_name, :password)
    end
  end
end
