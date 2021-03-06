class Admin::PostsController < ApplicationController
  layout "adminbar"
  before_filter :require_login
  cache_sweeper :post_sweeper, only: [:create, :update, :destroy]
  cache_sweeper :sitemap_sweeper, only: [:create, :destroy]

  def index
    redirect_to(login_path) unless current_user
    @posts = Post.all
    render template: "posts/index"
  end

  def show
    @post = Post.find(params[:id])
    render template: "posts/show"
  end

  def new
    @post = Post.new 
  end

  def create
    @post = Post.new(params[:post])
    #@post.build_categories params[:post][:category_ids]
    if @post.save
      redirect_to admin_path, notice: "Post created."
    else
      flash.now[:error] = "Post not created."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to admin_post_path(@post), notice: "Post updated."
    else
      flash.now[:error] = "Post not saved."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_path, notice: "Post deleted."
  end
end
