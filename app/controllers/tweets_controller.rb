class TweetsController < ApplicationController
  
  def index
    @tweet = Tweet.all
  end

  def new
    
  end

  def create
    Tweet.create(title: tweet_params[:title], image: tweet_params[:image], text: tweet_params[:text])
  end

  private
  def tweet_params
    params.permit(:image, :text, :title)
  end
end
