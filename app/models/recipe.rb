class Recipe < ActiveRecord::Base
  mount_uploader :image, RecipeImageUploader

  has_many :food_recipes
  has_many :foods, through: :food_recipes
  belongs_to :recipe_category
  has_many :likes
  belongs_to :user
  has_many :liking_users, through: :likes, source: :user

  def liked?(user)
    user.liked_recipes.exists?(id)
  end

end
