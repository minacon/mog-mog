class RemoveLikesCountFromTweets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tweets, :likes_count, :integer
  end
end
