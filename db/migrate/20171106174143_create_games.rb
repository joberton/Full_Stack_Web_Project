class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :console_id
      t.integer :genre_id
      t.integer :product_type_id
      t.string :name
      t.decimal :price
      t.text :description
      t.date :date_released

      t.timestamps
    end
  end
end
