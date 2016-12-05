class RecipesController < ApplicationController
  expose :recipe, attributes: :recipe_params
  expose :recipes, -> { Recipe.all }
  expose :recipe_category
  expose :recipe_categories, -> { RecipeCategory.all }

  def create
    authorize recipe
    recipe.save
    redirect_to :back
  end

  def update
    recipe.save
    redirect_to :recipes
  end

  def recipe_params
    params.require(:recipe).permit(:content, :recipe_category_id, :image, :name)
  end

  def index
    self.recipes = recipes.where(recipe_category_id: params[:recipe_category_id]) if params[:recipe_category_id]
  end

  def destroy
    recipes.delete recipe
    redirect_to :back
  end
end
