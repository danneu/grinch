class SitemapsController < ApplicationController

  caches_page :index

  def index
    @static_paths = [about_me_path, projects_path]
    @posts = Post.all

    respond_to do |format|
      format.xml
    end
  end
end
