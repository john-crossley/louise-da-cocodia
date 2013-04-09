class UserMailer < ActionMailer::Base
  default from: "notifications@louise-da-cocodia.dev"

  def welcome_email(user)
  	@user = user
  	@url = 'http://louise-da-cocodia.dev/login'
  	mail(to: user.email, subject: 'Welcome to Louise Da-Cocodia')
  end
end