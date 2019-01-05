class UserJob < ApplicationJob
  queue_as :user

  def perform(*users)
    UserMailer.signup_confirmation(@user).deliver_now
  end
end
