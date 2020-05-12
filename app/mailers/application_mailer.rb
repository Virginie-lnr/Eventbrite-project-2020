class ApplicationMailer < ActionMailer::Base
  default from: 'jane.lnr.17@gmail.com'
  layout 'mailer'
end


# User.create(first_name:"Vivi", last_name:"coucou" email:"vivi@yopmail.com")