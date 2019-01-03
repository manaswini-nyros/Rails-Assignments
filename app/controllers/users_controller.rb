class UsersController < ApplicationController
def new
  @user = User.new
end
def create
  @user = User.new(user_params[:article])
  if @user.save
    redirect_to root_url, :notice => "Signed up!"
    flash[:notice]="Thanks"
    if params[:remember_email]
    	cookies[:user_email]=@user.article
    else
    	cookies.delete(:user_email)
    end
     redirect_to @user.article   
  else
    render "new"
  end
end
# def show
#   @user=User.find(params[:id])
# rescue ActiveRecord::RecordNotFound => e
#   redirect_to :root,alert:'user not found'
# end  
# end
def user_params
    params.require(:user).permit( :email, :password, :salt, :encrypted_password)
  end
end
