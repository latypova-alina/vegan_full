class FoodsController < ApplicationController
  expose :food, attributes: :food_params
  expose :foods, -> { Food.all }
  expose :category
  expose :categories, -> { Category.all }

  def create
    authorize food
    food.save
    redirect_to :back
  end

  def update
    if food.update(food_params)
      redirect_to :foods
    else
      render :edit
    end
  end

  def food_params
    params.require(:food).permit(:name, :price, :description, :image, :remote_image_url, :category_id)
  end

  def index
    self.foods = foods.where(category_id: params[:category_id]) if params[:category_id]
  end

  def destroy
    foods.delete food
    redirect_to :back
  end

end
