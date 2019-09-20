class AddLikeCountsToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :like_counts, :integer, default: '0'
  end
end
