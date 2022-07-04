class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: :landing_page
  before_action :stop_process

  def stop_process
    #binding.pry
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:game_uid, :codnickname, :cellphone, :country_code, :time_zone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:uid, :codnickname, :cellphone, :country_code, :time_zone])
  end
end
