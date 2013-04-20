class Notifier < ActionMailer::Base
  default from: "Disko <hi@disko.me>"

  def log_in_request(email)
    @email = email
    mail to: email.address,
      subject: "Log in to Diddleberry"
  end

  def confirm_email(email)
    @email = email
    mail to: email.address,
      subject: "Confirm your email"
  end
end
