class Recipe < ActiveRecord::Base
  mount_uploader :image, RecipeImageUploader

  has_many :food_recipes
  has_many :foods, through: :food_recipes
  belongs_to :recipe_category

end
