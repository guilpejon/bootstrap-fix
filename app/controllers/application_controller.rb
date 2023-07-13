# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parametters, if: :devise_controller?

  protected

  def configure_permitted_parametters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username first_name last_name])
  end
end
