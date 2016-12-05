class CreateBasketFoods < ActiveRecord::Migration
  def change
    create_table :basket_foods do |t|
      t.belongs_to :food, index: true
      t.belongs_to :basket, index: true


      t.timestamps null: false
    end
  end
end
