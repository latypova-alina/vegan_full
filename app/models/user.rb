class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :basket, dependent: :destroy

  enum role: {
    user: "user",
    administrator: "administrator"
  }

  has_many :recipes
  has_many :likes
  has_many :liked_recipes, through: :likes, source: :recipe
  after_create :create_basket

  def create_basket
    Basket.create(user_id: id)
  end
end
