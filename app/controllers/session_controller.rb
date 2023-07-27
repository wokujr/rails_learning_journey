class SessionController < ApplicationController

  def new
  end

  def create
    #find User in data base and store it in user
    user = User.find_by(email: params[:email])

    #check if password and email is match also available in database
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Login successful"
    else
      #pop up flash alert message when input password or email is invalid
      flash.now[:alert] = "Invalid username or password"
      render :new, status: :unprocessable_entity
    end
  end

  #this action will delete user from session[:user_id] AKA destroy it from database
  def delete
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out"
  end
end
