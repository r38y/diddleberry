class UsersController < ApplicationController
  before_filter :authorize

  def show
  end

  def edit
  end

  def update
    if current_user.update_attributes(user_params)
      redirect_to root_url
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
