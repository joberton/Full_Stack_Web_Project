class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items do |t|
      t.string :product_name
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
