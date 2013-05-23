class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  helper_method :current_user_is_admin?

  def set_locale
    if params[:new_locale] && I18n.available_locales.include?(params[:new_locale].to_sym)
      I18n.locale, session[:locale], params[:locale] = params[:new_locale]
    elsif params[:locale] && params[:locale] != session[:locale] && I18n.available_locales.include?(params[:locale].to_sym)
      I18n.locale, session[:locale] = params[:locale]
    else
      I18n.locale, session[:locale], params[:locale] = I18n.default_locale
    end
    return I18n.locale
	end

  def current_user_is_admin?
    current_user.role == "admin"
  end
end
