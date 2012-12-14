class Notifier < ActionMailer::Base
  default from: "Disko <hi@disko.me>"

  def confirm_email(email)
    @email = email
    mail to: email.address,
      subject: "Log in to Diddleberry"
  end
end
