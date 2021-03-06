class LogInRequestsController < ApplicationController
  def new
  end

  def create
    @user, @email = *User.from_email(params[:email])
    if @user.valid?
      SuckerPunch::Queue[:emails].async.perform(:log_in_request, @email)
      session[:email] = @email.address
      redirect_to check_email_url
    else
      render :new
    end
  end
end
