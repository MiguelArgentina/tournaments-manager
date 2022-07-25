class Player < User
  #devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      password = Devise.friendly_token[0, 20]
      user.password = password
      user.password_confirmation = password
      user.full_name = auth.info.name
      user.avatar_url = auth.info.image
      #If you are using confirmable and the provider(s) you use validate emails,
      #uncomment the line below to skip the confirmation emails.
      #user.skip_confirmation!
    end
  end
end
