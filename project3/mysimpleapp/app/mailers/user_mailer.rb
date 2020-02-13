class UserMailer < ApplicationMailer

  def signup_confirmation
    @user = params[:user]

    mail(to: @user.email , subject: 'Sign Up Confirmation.')
  end
end
