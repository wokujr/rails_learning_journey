class ApplicationController < ActionController::Base
  # this mean before we run everything check if Current.user is set. reference shared/_navbar_html.erb
  before_action :set_current_user

  def set_current_user
    ##check if user exist and logged in
    if session[:user_id]
      ##find_by will act same like logged out if user/data deleted from database
      Current.user = User.find_by(id: session[:user_id])
    end
  end


  #make sure that user login before proceed
  def require_logged_in!
    redirect_to sign_in_path, alert: "You have to sign in to proceed" if Current.user.nil?
  end

end
