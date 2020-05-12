class UserMailer < ApplicationMailer
  default from: 'jane.lnr.17@gmail.com'

  def welcome_email(user)
    @user = user 

    @url = 'https://eventbrite-2020.herokuapp.com/'

    mail(to: @user.email, subject: 'Bienvenue sur notre super site Eventbrite!')
  end
  

end
