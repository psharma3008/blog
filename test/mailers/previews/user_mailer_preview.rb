# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def user_mailer
    user = User.pluck(:email)[0]
    UserMailer.user_mailer(user)
  end
end
