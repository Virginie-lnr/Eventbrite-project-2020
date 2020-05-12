class UserMailer < ApplicationMailer
  default from: 'jane.lnr.17@gmail.com'

  def welcome_email(user)
    @user = user 

    @url = 'https://eventbrite-2020.herokuapp.com/'

    mail(to: @user.email, subject: 'Bienvenue sur notre super site Eventbrite!')
  end

  # def welcome_reset_password_instructions(user)
  #   create_reset_password_token(user)
  #   mail(to: @user.email, subject: 'Welcome to the New Site')
  # end

  # private

  # def create_reset_password_token(user)
  #   raw, hashed = Devise.token_generator.generate(User, :reset_password_token)
  #   @token = raw
  #   user.reset_password_token = hashed
  #   user.reset_password_sent_at = Time.now.utc
  #   user.save
  # end

end
