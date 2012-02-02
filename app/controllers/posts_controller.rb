class PostsController < ApplicationController

  caches_page :index, :show

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
end
