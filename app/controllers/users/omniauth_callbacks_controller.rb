# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  def google_oauth2
    @user = (resource_name.to_s.classify.constantize).create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
    else
      flash[:error]='There was a problem signing you in through Google. Please register or try signing in later.'
      redirect_to new_user_session_path
    end
  end
end
