class UsersController < ApplicationController

    def show
        @user = User.find_by(id: params[:id])
        if params[:sort] == "toplike"
          @posts = @user.posts.left_joins(:likes)
                       .group(:id)
                       .order('COUNT(likes.post_id) DESC')
                       .page(params[:page])
                       .per(2)
        else
          @posts = @user.posts.order('created_at DESC')
                       .page(params[:page])
                       .per(10)
        end
      end

end
