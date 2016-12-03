class CategoriesController < ApplicationController
  expose :category, attributes: :category_params
  expose :categories, -> { Category.all }

  def index
  end

  def create
    authorize category
    category.save
    redirect_to :back
  end

  def category_params
    params.require(:category).permit(:category_name)
  end

  def destroy
    categories.delete category
    redirect_to :back
  end
end
