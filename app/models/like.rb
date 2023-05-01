class Like < ApplicationRecord
    belongs_to :user
    belongs_to :post
  
    # ここの行を追加する
    validates :user_id, uniqueness: { scope: :post_id }
end
  