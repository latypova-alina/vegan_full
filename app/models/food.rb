class Food < ActiveRecord::Base
  mount_uploader :image, FoodImageUploader


  belongs_to :category
  has_many :food_recipes
  has_many :recipes, through: :food_recipes
  has_many :basket_foods
  has_many :baskets, through: :basket_foods

  procedure :sort_category

end
