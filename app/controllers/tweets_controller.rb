class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.order("created_at DESC").page(params[:page]).per(6)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    tweet = Tweet.new(tweet_params)
    # binding.pry
    tweet.save

  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.destroy
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:image, :text, :title).merge(user_id: current_user.id)
  end
end
