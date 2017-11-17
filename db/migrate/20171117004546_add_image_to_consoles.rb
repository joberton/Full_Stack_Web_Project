class AddImageToConsoles < ActiveRecord::Migration[5.1]
  def change
  	add_column :consoles, :image, :string
  	add_column :games, :image, :string
  end
end
