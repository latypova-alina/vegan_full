class Food < ActiveRecord::Base
  mount_uploader :image, FoodImageUploader


  validates :name, :price, :presence => true

  belongs_to :category
  has_many :food_recipes
  has_many :recipes, through: :food_recipes
  has_many :basket_foods
  has_many :baskets, through: :basket_foods

  def in_users_basket?(user)
    user.basket.foods.exists?(id)
  end

end
