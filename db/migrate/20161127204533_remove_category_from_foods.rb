class RemoveCategoryFromFoods < ActiveRecord::Migration
  def change
    remove_column :foods, :category
  end
end
