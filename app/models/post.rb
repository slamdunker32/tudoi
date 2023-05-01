class Post < ApplicationRecord
    belongs_to :user
    belongs_to :subject
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
  
    # validates :subject_id, presence: true
    mount_uploaders :images, ImageUploader
  
    def liked_by(current_user)
      # user_idが一致するlikeを検索する
      Like.find_by(user_id: current_user.id, post_id: id)
    end
  end