class FoodsController < ApplicationController
  expose :food, attributes: :food_params
  expose :foods, -> { Food.all }
  expose :category
  expose :categories, -> { Category.all }
  respond_to :html, :js

  def create
    food.save
    redirect_to :back
  end

  def update
    respond_with food
  end

  def food_params
    params.require(:food).permit(:name, :price, :description, :image, :category)
  end

  def index
    self.foods = foods.where(category_id: params[:category_id]) if params[:category_id]
  end

end
