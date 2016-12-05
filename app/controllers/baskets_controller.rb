class BasketsController < ApplicationController
  expose :food, attributes: :food_params
  expose :basket, -> { Basket.find_by(user: current_user) }

  def add_to_basket
    basket.foods << food
    redirect_to :back
  end

  def delete_from_basket
    basket.delete food
    redirect_to :back
  end

end
