# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'shubahm.tomar.chu@gmail.com'

  def user_mailer(user)
    @user = user
    @url  = 'http://0.0.0.0:3000/sign_in'
    mail(to: @user, subject: 'Welcome to My Awesome Site')
  end

  def welcome_email
    @user = params[:user]
    @url  = 'http://0.0.0.0:3000/sign_in'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
