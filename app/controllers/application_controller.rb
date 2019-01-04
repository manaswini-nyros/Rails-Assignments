class ApplicationController < ActionController::Base
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  helper_method :current_user
	def default_url_options
      { locale: I18n.locale }
  end
  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    def record_not_found
      render plain: "404 Not Found", status: 404
    end
end