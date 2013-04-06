class UserSessionsController < ApplicationController
  def create
    @email = Email.find_by_token!(params[:token])
    @email.confirm!
    session[:user_id] = @email.user.id
    if current_user.name?
      redirect_to root_url
    else
      redirect_to edit_me_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
