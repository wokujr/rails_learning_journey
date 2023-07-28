class PasswordsController < ApplicationController

  ##check if user is logged in, will not run edit and update method/function before user is logged in
  before_action :require_logged_in!

  def edit

  end

  def update
    if Current.user.update(password_params)
      redirect_to root_path, notice: "Password Successfully Changed"
    else
      ## if on edit it missing ' ' it will give MissingTemplate error
      render 'edit', status: :unprocessable_entity
    end
  end

  private
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end