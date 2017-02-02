class LocaleController < ApplicationController
  def set
    locale = params[:id]
    raise 'unsupported locale' unless ['en', 'pl'].include?(locale)
    if current_user
      current_user.locale = locale
      current_user.save
    else
      session[:locale] = locale
    end

    redirect_to :back
  end
end
