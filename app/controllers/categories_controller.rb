class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by_slug!(params[:id])
    @posts = @category.posts
  end

  def new
    redirect_to(root_path) unless current_user
    @category = Category.new
  end

  def create
    redirect_to(root_path) unless current_user
    @category = Category.new(params[:category])
    if @category.save
      redirect_to root_path, notice: "Category created."
    else
      flash.now[:error] = "Category not saved."
      render :new
    end
  end

  def edit
    redirect_to(root_path) unless current_user
    @category = Category.find_by_slug!(params[:id])
  end

  def update
    redirect_to(root_path) unless current_user
    @category = Category.find_by_slug!(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to categories_path, notice: "Category updated."
    else
      flash.now[:error] = "Category not updated."
      render :edit
    end
  end

  def destroy
    redirect_to(root_path) unless current_user
    @category = Category.find_by_slug!(params[:id])
    @category.destroy
    redirect_to categories_path, notice: "Category deleted."
  end

end
