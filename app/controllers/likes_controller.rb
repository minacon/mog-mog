class LikesController < ApplicationController

  def create
    @tweet = Tweet.find(params[:format])
    @like = Like.create(user_id: current_user.id, tweet_id: params[:format])
    @likes = Like.where(tweet_id: params[:format])
    @tweet.reload
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @like = Like.find_by(user_id: current_user.id, tweet_id: params[:id])
    @like.destroy
    @likes = Like.where(tweet_id: params[:id])
    @tweet.reload
  end

end