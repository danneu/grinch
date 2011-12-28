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
      flash.now[:error] = "Post not created."
      render :new
    end
  end

  def edit
    @post = Post.find_by_slug!(params[:id])
  end

  def update
    @post = Post.find_by_slug!(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to @post, notice: "Post updated."
    else
      flash.now[:error] = "Post not saved."
      render :edit
    end
  end

  def destroy
    redirect_to(root_path) unless current_user
    @post = Post.find_by_slug!(params[:id])
    @post.destroy
    redirect_to root_path, notice: "Post deleted."
  end
end
