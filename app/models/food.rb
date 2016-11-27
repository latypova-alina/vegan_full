class Food < ActiveRecord::Base
  mount_uploader :image, FoodImageUploader


  belongs_to :category
  has_many :food_recipes
  has_many :recipes, through: :food_recipes

end
