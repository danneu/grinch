class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by_slug!(params[:id])
  end

  def new
    current_user ? @post = Post.new : redirect_to(root_path)
  end

  def create
    redirect_to(root_path) unless current_user
    @post = Post.new(params[:post])
    if @post.save
      redirect_to root_path, notice: "Post created."
    else
      render :new
    end
  end
end
