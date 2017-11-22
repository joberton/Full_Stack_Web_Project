class AddProductTypeToConsole < ActiveRecord::Migration[5.1]
  def change
  	add_foreign_key :product_types_id, :product_types
  end
end
