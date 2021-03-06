# frozen_string_literal: true
class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    generic_callback('facebook')
  end

  def github
    generic_callback('github')
  end

  def google_oauth2
    generic_callback('google_oauth2')
  end

  def generic_callback(provider)
    @identity = Identity.find_for_oauth request.env['omniauth.auth']

    @user = @identity.user || current_user

    if @user.nil?
      @user = User.new(name: @identity.name, email: @identity.email, oauth_callback: true)
      @user.skip_confirmation!
      @user.save!

      @identity.update_attribute(:user_id, @user.id)
    end

    if @user.email.blank? && @identity.email
      @user.update_attribute(:email, @identity.email)
    end

    if @user.persisted?
      @identity.update_attribute(:user_id, @user.id)
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
