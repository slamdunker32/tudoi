class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: %i(show destroy)
  
    def new
      @post = Post.new
    end
  
    def create
      @post = Post.new(post_params)
      if @post.save
        flash[:notice] = "投稿が保存されました"
        redirect_to root_path
      else
        flash.now[:alert] = "投稿に失敗しました: " + @post.errors.full_messages.join(", ")
        render new_post_path
      end
    end
    
  
    def index
      if params[:subject_id]
        @subject = Subject.find(params[:subject_id])
        @posts = @subject.posts.page(params[:page]).per(10)
      else
        if params[:sort] == "toplike"
          @posts = Post.left_joins(:likes)
                       .group(:id)
                       .order('COUNT(likes.post_id) DESC')
                       .page(params[:page])
                       .per(2)
        elsif params[:sort] == "recent"
          @posts = Post.includes(:user)
                       .order('created_at DESC')
                       .page(params[:page])
                       .per(10)
        else
          @posts = Post.page(params[:page])
                       .per(10)
                       .includes(:user)
                       .order('created_at DESC')
        end
      end
    end
    
  
    def show
    end

    def destroy
      if @post.user == current_user
        flash[:notice] = "投稿が削除されました" if @post.destroy
      else
        flash[:alert] = "投稿の削除に失敗しました"
      end
      redirect_to root_path
    end

    def search
      if params[:search].blank?
        @posts = []
      else
        search_condition = "%" + params[:search] + "%"
        @posts = Post.joins(:subject).where("posts.description LIKE ? OR subjects.title LIKE ? OR caption ILIKE ?", search_condition, search_condition, search_condition).page(params[:page]).per(10)
      end
      render :index
    end
    

    def toplike
      if params[:order] == "like"
        @posts = Post.joins(:likes)
                     .group("posts.id")
                     .order('COUNT(likes.id) DESC')
                     .limit(10)
      end
    end
  
      private
        def post_params
          params.require(:post).permit(:subject_id, :caption, :description, {images: []}).merge(user_id: current_user.id)
        end
  
        def set_post
          @post = Post.find_by(id: params[:id])
        end
end  