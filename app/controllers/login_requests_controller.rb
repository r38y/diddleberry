class LoginRequestsController < ApplicationController
  def new
  end

  def create
    @user, @email = *User.from_email(params[:email])
    if @user.valid?
      SuckerPunch::Queue[:emails].async.perform(:confirm_email, @email)
      session[:email] = @email.address
      redirect_to check_email_url
    else
      render :new
    end
  end
end
