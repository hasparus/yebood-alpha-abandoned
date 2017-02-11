# frozen_string_literal: true
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate
  before_action :set_locale

  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate
    unless ENV['HTTP_AUTH_USERNAME'].blank? || ENV['HTTP_AUTH_PASSWORD'].blank?
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['HTTP_AUTH_USERNAME'] && password == ENV['HTTP_AUTH_PASSWORD']
      end
    end
  end

  def access_denied(exception)
    redirect_to root_path, alert: exception.message
  end

  def set_locale
    I18n.locale = (current_user.locale if current_user) || session[:locale] || :en
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
