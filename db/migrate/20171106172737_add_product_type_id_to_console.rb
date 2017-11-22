class AddProductTypeIdToConsole < ActiveRecord::Migration[5.1]
  def change
    add_reference :consoles, :product_type, foreign_key: true 
  end
end
