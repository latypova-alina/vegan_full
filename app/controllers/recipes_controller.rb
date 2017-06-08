class RecipesController < ApplicationController
  expose :recipe, attributes: :recipe_params
  expose :recipes, -> { Recipe.all }
  expose :recipe_category
  expose :recipe_categories, -> { RecipeCategory.all }
  respond_to :html, :xml, :json

  def create
    authorize recipe
    recipe.save
    redirect_to :back
  end

  def update
    if recipe.update(recipe_params)
      redirect_to :recipes
    else
      render :edit
    end
  end

  def recipe_params
    params.require(:recipe).permit(:content, :recipe_category_id, :image, :name)
  end

  def index
    self.recipes = recipes.where(recipe_category_id: params[:recipe_category_id]) if params[:recipe_category_id]
    self.search if params[:search]
  end

  def destroy
    recipes.delete recipe
    redirect_to :back
  end

  def search
    @search = Recipe.search do
      fulltext params[:search]
    end

    render :search
  end


end
