class EmailsController < ApplicationController
  def create
    @email = current_user.emails.new(email_params)

    if @email.save
      SuckerPunch::Queue[:emails].async.perform(:confirm_email, @email)
      flash[:notice] = "Please check #{@email.address} for a link to confirm the email address. "
      redirect_to root_url
    else
      flash[:error] = "That address is invalid. Please try entering a valid email address. "
      redirect_to root_url
    end
  end

  def destroy
    email = current_user.emails.find_by_token(params[:token])
    email.destroy
    redirect_to root_url, notice: "#{email.address} has been removed from your account."
  end

  private
  def email_params
    params.require(:email).permit(:address)
  end
end
