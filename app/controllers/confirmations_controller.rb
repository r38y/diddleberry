class ConfirmationsController < ApplicationController
  def new
  end

  def create
    @user, @email = *User.from_email(params[:email])
    Notifier.confirm_email(@email).deliver
    session[:email] = @email.address
    redirect_to check_email_url
  end
end
