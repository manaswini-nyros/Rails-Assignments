class ApplicationController < ActionController::Base
	def default_url_options
      { locale: I18n.locale }
  end
  helper_method :current_user
  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end