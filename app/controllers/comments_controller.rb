class CommentsController < ApplicationController

#   def create
#     @post = Post.find(params[:post_id])
#     @comment = @post.comments.create(params[:comment].permit(:post_id, :user_id, :body))
#     @comment.user == current_user
#     if @comment.save
#       redirect_to post_path(@post)
#   end
# end

# Philippe:
def create
  @post = Post.find(params[:post_id])
  @comment = current_user.comments.new(comment_params)
  @comment.post = @post
  if @comment.save
    redirect_to post_path(@post)
end
end

# Security feature so people cannot just go in there and change comment
private
def comment_params
  params.require(:comment).permit([:body])
end

end
