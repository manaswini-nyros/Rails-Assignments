class SessionsController < ApplicationController
before_action:authenticate
before_action :check_authorization, :only => [ :show]
  def new
  end
  def create
   user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_email] = user.email
      redirect_to articles_url
    else
      redirect_to log_in_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
  protected
  def authenticate
    authenticate_or_request_with_http_basic do |username,password|
     username==="manu"&&password==="manupa"
  end
  def check_authorization
    raise User::NotAuthorized unless current_user
  end
end
end