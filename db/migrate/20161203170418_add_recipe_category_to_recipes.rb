class AddRecipeCategoryToRecipes < ActiveRecord::Migration
  def change
    add_reference :recipes, :recipe_category, index: true
  end
end
