class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(params.require(:post).permit(:title, :city, :venue, :address, :date, :start_hour, :end_hour, :theme, :body))

    if @post.save
      redirect_to posts_path
     else
       render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    redirect_to posts_path unless @post.user == current_user
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new 
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params.require(:post).permit(:title, :city, :venue, :address, :date, :start_hour, :end_hour, :theme, :body, :posted_by))
    redirect_to posts_path
  else
    render :edit
  end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end


end
