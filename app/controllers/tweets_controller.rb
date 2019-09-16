class TweetsController < ApplicationController

before_action :move_to_index, except: [:index, :show]
before_action :set_tweet, only: [:destroy, :edit, :update, :show]

  def index
    @tweets = Tweet.order("created_at DESC").page(params[:page]).per(6)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    tweet = Tweet.new(tweet_params)
    tweet.save

  end

  def destroy
    if @tweet.user_id == current_user.id
      @tweet.destroy
    end
  end

  def edit
  end

  def update
    if @tweet.user_id == current_user.id
      @tweet.update(tweet_params)
    end
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end


  private
  def tweet_params
    params.require(:tweet).permit(:image, :text, :title).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
