class Basket < ActiveRecord::Base
  belongs_to :user
  has_many :basket_foods
  has_many :foods, through: :basket_foods
end
