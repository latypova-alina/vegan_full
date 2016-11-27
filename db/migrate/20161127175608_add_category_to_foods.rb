class AddCategoryToFoods < ActiveRecord::Migration
  def change
    add_reference :foods, :category, index: true
  end
end
