class UserMailer < ApplicationMailer
	default from: "railscasts@example.com"
 
  def signup_confirmation(user)
  	@user =user
  	mail to: user,subject: "Signup Confirmation"
end
end
