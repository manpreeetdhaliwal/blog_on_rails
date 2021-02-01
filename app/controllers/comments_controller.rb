class CommentsController < ApplicationController
    def create
        @post = Post.find params[:post_id]
        @comment=Comment.new comment_params
        @comment.post =@post
        # @comment.user=current_user
    
        
        if @comment.save
            redirect_to post_path(@post), notice: 'comment created!'
        else
            @comments=@post.comments.order(created_at: :desc)
            
            render '/posts/show'
            
        end
    end
    def destroy
    @post =Post.find params[:post_id]
    # questions/:question_id/answers/:id
    # questions/8/anaswers/1
    @comment=Comment.find params[:id]
    @comment.destroy
    redirect_to post_path(@post), notice: "comment deleted"
    
end
    

private
def comment_params
    params.require(:comment).permit(:body)
end
end
