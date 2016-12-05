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
    end  end

  def food_params
    params.require(:food).permit(:name, :price, :description, :image, :category_id)
  end

  def index
    #self.foods = foods.where(category_id: params[:category_id]) if params[:category_id]
    if params[:category_id]
      foods_hashes = Food.sort_category(params[:category_id])
      foods = []
      foods_hashes.each do |food_id|
        foods << Food.find(food_id["sort_category"])
      end
      self.foods = foods
    end
  end

  def destroy
    foods.delete food
    redirect_to :back
  end

end
