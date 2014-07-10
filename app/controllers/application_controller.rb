class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def set_locale
    locale = params.permit(:locale)[:locale]
    if locale
      session[:locale] = locale
      redirect_to url_for(locale: nil)
    end
    if session[:locale]
      I18n.locale = session[:locale]
    end
  end
  private :set_locale
  before_action :set_locale
end
