class CategoriesController < ApplicationController
  def show
    @category = Category.find_by_slug!(params[:id])
    @posts = @category.posts
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to root_path, notice: "Category created."
    else
      render :new
    end
  end

end
