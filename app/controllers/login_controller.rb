class LoginController < ApplicationController
def twitter

  if Current.user.nil?
    redirect_to sign_in_path, alert: "Please sign in first before you use"
    return
  end

  #printed out the auth log method on console
  Rails.logger.info auth

  #this is how we will create twitter account in database
  Current.user.twitter_accounts.create(
    name: auth.info.name,
    username: auth.info.nickname,
    image: auth.info.image,
    token: auth.credentials.token,
    secret: auth.credentials.secret,
  )

  render plain: "Successfully connected your account."
end

  def auth
    #get hash credential back from twitter, this method from OmniAuth lib
    # it can grab credential from wherever connect such as fb, linkedin,github
    request.env['omniauth.auth']
  end

end

