class TweetsController < ApplicationController
  before_action :require_logged_in!

  def index
    @tweets = Current.user.tweets
  end

  def new
    @tweets = Tweet.new
  end

end

