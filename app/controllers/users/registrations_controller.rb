# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    get_time_zones
    if request.path.split("/")[1] == 'clan_leaders'
      flash[:error]='Only players can register for new accounts. Clan leaders are managed by other Clan Leaders'
      redirect_to root_path and return
    end
    super
  end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
    get_time_zones
    super
  end

  # PUT /resource
  # def update
  #   super
  # end
  #
  def update_resource(resource, params)
    if current_user.provider == "google_oauth2"
      params.delete("current_password")
      resource.update_without_password(params)
    else
      get_time_zones
      resource.update_with_password(params)
    end
  end

  private
  def get_time_zones
    @time_zones = TZInfo::Timezone.all.select{|c| c=~/America/}.map{|tz| [tz.to_s, tz.name]}
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
