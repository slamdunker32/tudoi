class Subject < ApplicationRecord
    has_many :posts

    def limited_posts(int)
        self.posts.limit(int)
    end
end
