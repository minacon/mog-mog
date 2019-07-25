class CommentsController < ApplicationController
  def create
    comment = Comment.new(text: comment_params[:text], tweet_id: params[:tweet_id], user_id: current_user.id)
    comment.save
    redirect_to "/tweets/#{comment.tweet.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :tweet_id)
  end
  
end