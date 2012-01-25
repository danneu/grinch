class Admin::CategoriesController < ApplicationController
  layout "adminbar"
  before_filter :require_login

  def index
    @categories = Category.all
    render template: "categories/index"
  end

  def show
    @category = Category.find_by_slug!(params[:id])
    @posts = @category.posts
    render template: "categories/show"
  end

  def new
    redirect_to(admin_path) unless current_user
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to admin_path, notice: "Category created."
    else
      flash.now[:error] = "Category not saved."
      render :new
    end
  end

  def edit
    @category = Category.find_by_slug!(params[:id])
  end

  def update
    @category = Category.find_by_slug!(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to admin_categories_path, notice: "Category updated."
    else
      flash.now[:error] = "Category not updated."
      render :edit
    end
  end

  def destroy
    @category = Category.find_by_slug!(params[:id])
    @category.destroy
    redirect_to admin_categories_path, notice: "Category deleted."
  end

end
