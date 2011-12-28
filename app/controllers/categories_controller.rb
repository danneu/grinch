class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

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

  def edit
    @category = Category.find_by_slug!(params[:id])
  end

  def update
    @category = Category.find_by_slug!(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to categories_path, notice: "Category updated."
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find_by_slug!(params[:id])
    @category.destroy
    redirect_to categories_path, notice: "Category deleted."
  end

end
