class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :find_post, only:[:show, :edit, :update, :destroy]
    before_action :authorize_user!,only:[:edit,:update,:destroy]
    def new
        @post=Post.new
        # @post.user = current_user
    end
    def create
        @post=Post.new post_params
        @post.user = current_user

        if @post.save
            flash[:notice]="Post created successfully."
            redirect_to post_path(@post.id)
        else
            render :new
        end
    end
    def index
        
         @posts=Post.all.order(created_at: :desc)
            
    end
    def show
        @comments=@post.comments.order(created_at: :desc)
        
        @comment=Comment.new
        # @like=@idea.likes.find_by(user: current_user)
    end
    def edit
        
    end
    def update
        if @post.update post_params
            redirect_to post_path(@post.id), notice: "Post edited successfully."
            
        else
            render :edit
        end
    end
    def destroy
        byebug
    #    @post= Post.find(params[:id])
        @post.destroy
        
        redirect_to posts_path, notice: "post deleted"
    end
    private
    def find_post
        @post=Post.find params[:id] 
    end
    def post_params
        params.require(:post).permit(:title, :body)
    end
    def authorize_user!
        redirect_to root_path, alert: 'Not Authorized' unless can?(:crud, @post)
    end

end
