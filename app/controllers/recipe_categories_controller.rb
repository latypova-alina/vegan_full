class RecipeCategoriesController < ApplicationController
  expose :recipe_category, attributes: :recipe_category_params
  expose :recipe_categories, -> {RecipeCategory.all }

  def index
  end

  def create
    authorize recipe_category
    recipe_category.save
    redirect_to :back
  end

  def recipe_category_params
    params.require(:recipe_category).permit(:recipe_category_name)
  end

  def destroy
    recipe_categories.delete recipe_category
    redirect_to :back
  end
end
