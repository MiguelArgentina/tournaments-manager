class ApplicationController < ActionController::Base
  devise_group :user, contains: [:player, :clan_leader]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:landing_page]
  before_action :helper

  def helper
    puts "$" * 50
    puts request.path.split("/")[1]
    #binding.pry
    puts "$" * 50
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:game_uid, :codnickname, :cellphone, :country_code, :time_zone, :type])
    devise_parameter_sanitizer.permit(:account_update, keys: [:game_uid, :codnickname, :cellphone, :country_code, :time_zone, :type])
  end
end
