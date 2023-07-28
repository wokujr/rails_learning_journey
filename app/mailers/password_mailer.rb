class PasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  def reset

    #this will grab user variable(@user) from password_reset_controller that called by  ( with(user: @user) )
    params[:user]
    @token = params[:user].signed_id(purpose: "password_reset", expires_in: 15.minutes)


    mail to: params[:user].email

  end
end
