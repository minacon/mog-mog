class Tweet < ApplicationRecord
  belongs_to :user
  has_many   :comments
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :text, presence: true
  validates :title, presence: true
  validates :image, presence: true
  
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
  
  mount_uploader :image, ImageUploader
end