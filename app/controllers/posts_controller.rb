class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all 
  end

  def create
    ## To create a new method.
    Post.create params[:post]
    redirect_to :back
  end

  def show
    @post = Post.find params[:id]
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    post = Post.find params[:id]

    if post.update_attributes params[:post]
      redirect_to posts_path, :notice => 'Your post was successfully updated.'
    else
      redirect_to :back, :notice => 'Cannot have an empty post.'
    end
  end

  def destroy
    Post.destroy params[:id]
    redirect_to :back, :notice => 'Post was successfully deleted'
  end

end
