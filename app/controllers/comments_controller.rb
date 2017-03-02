class CommentsController < ApplicationController

def create
  @post = Post.find(params[:post_id])
  @comment = current_user.comments.new(comment_params)
  @comment.post = @post
  if @comment.save
    redirect_to post_path(@post)
  else
    flash[:danger] = "Please make sure your comment is no more than 300 characters"
    redirect_to post_path(@post)
end
end

# Security feature so people cannot just go in there and change comment
private
def comment_params
  params.require(:comment).permit([:body])
end

end
