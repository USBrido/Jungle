class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV["ADMIN_KEY"], password: ENV["ADMIN_SECRET"]

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @categories = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name,
      # :description
    )
  end

end
