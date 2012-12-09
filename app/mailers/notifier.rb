class Notifier < ActionMailer::Base
  default from: "from@example.com"

  def confirm_email(email)
    @email = email
    mail to: email.address,
      subject: "Log in to Diddleberry"
  end
end
