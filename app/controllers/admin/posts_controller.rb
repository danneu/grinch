class Admin::PostsController < ApplicationController
  layout "adminbar"
  before_filter :require_login

  def index
    @posts = Post.all
    render template: "posts/index"
  end

  def show
    @post = Post.find_by_slug!(params[:id])
    render template: "posts/show"

  end

  def new
    @post = Post.new 
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to admin_path, notice: "Post created."
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
      redirect_to admin_post_path(@post), notice: "Post updated."
    else
      flash.now[:error] = "Post not saved."
      render :edit
    end
  end

  def destroy
    @post = Post.find_by_slug!(params[:id])
    @post.destroy
    redirect_to admin_path, notice: "Post deleted."
  end
end
