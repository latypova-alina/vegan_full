class CreateFoodRecipes < ActiveRecord::Migration
  def change
    create_table :food_recipes do |t|
      t.belongs_to :food, index: true
      t.belongs_to :recipe, index: true

      t.timestamps null: false
    end
  end
end
