class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets.page(params[:page]).per(6).order("created_at DESC")
    @post = user.tweets
    @tweetlike = Tweet.where(user_id:current_user.id)
  end
end

