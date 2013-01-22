class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @the_new_user_who_signed_up = user

    mail to: user.email, from: "jeff@startergrill.com"
  end
end
