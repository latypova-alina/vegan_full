class AddRemoteImageToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :remote_image_url, :string
  end
end
