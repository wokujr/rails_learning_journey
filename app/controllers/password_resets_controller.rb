class PasswordResetsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      #send email reset password
      # send email on background job, so its happen immediately, and user will see response quickly.
      PasswordMailer.with(user: @user).reset.deliver_now

      #whether found or not will redirect to root_path
      redirect_to root_path, notice: "if we found your password we will send you reset password email."


    end
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    ## escape when the token is invalid or its has been expired
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: "Your token has been expired/invalid "
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user  .update(password_params)
      redirect_to sign_in_path, notice: "Password has been successfully reset please login"
    else
      render edit, status: :unprocessable_entity
    end
  end

  private
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end

