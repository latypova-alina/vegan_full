class BasketsController < ApplicationController
  expose :food, attributes: :food_params
  expose :basket, -> { Basket.find_by(user: current_user) }
  expose :foods, -> { basket.foods }

  def add_to_basket
    basket.foods << food
    redirect_to :back
  end

  def delete_from_basket
    basket.foods.delete food
    redirect_to :back
  end

  def index

  end

end
