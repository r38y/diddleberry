class ConfirmationsController < ApplicationController
  def new
  end

  def create
    @user, @email = *User.from_email(params[:email])
    Notifier.confirm_email(@email).deliver
    redirect_to root_url
  end
end
