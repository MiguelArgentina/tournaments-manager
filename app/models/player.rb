class Player < User
  devise :omniauthable, omniauth_providers: [:google_oauth2]


  def self.create_from_provider_data(provider_data)
    user_info = provider_data.info
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create  do |user|
      user.email = user_info.email
      user.password = Devise.friendly_token[0, 20]
      user.full_name = user_info.name
      user.avatar_url = user_info.image
    end
  end

end
