class Recipe < ActiveRecord::Base
  has_many :food_recipes
  has_many :foods, through: :food_recipes

end
