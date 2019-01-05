class UsersController < ApplicationController
  def deliver
     @user = User.find(params[:id]) 
     UserMailer.delay(run_at: 1.minute.from_now).signup_confirmation(@user).deliver(params[:id])
     redirect_to log_in_url, notice: 'Successfully delivered' 
  end
  def new
    @user = User.new
  end
  def show
   @user = User.find(params[:id]) 
  end
  def create
    @user = User.new(user_params)

    if  @user.save
      UserMailer.signup_confirmation(@user.name).deliver
      redirect_to log_in_url, notice: 'Successfully created' 
    else
      render :new
    end 
  end
  
  private
  def user_params
    params.require(:user).permit(:email,:password_digest, :password, :encrypted_password, :name)
  end
end
