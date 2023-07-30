class TwitterAccountsController < ApplicationController

  #make sure that user logged in before they can access the linked account
  before_action :require_logged_in!
  def index
    @twitter_accounts = Current.user.twitter_accounts
  end

  def destroy
    @twitter_accounts = Current.user.twitter_accounts.find(params[:id])

    #this destroy method also callback to destroy other records if we need to. so always want to call destroy to delete out of database
    @twitter_accounts.destroy
    redirect_to twitter_accounts_path, notice: "You have been Disconnected @#{@twitter_accounts.username}"
  end
end