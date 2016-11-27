class CategoriesController < ApplicationController
  expose :category, attributes: :category_params
  expose :categories, -> { Category.all }

  def index

  end

  def category_params
    params.require(:category).permit(:category_name)
  end
end
