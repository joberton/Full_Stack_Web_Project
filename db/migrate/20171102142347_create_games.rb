class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.references :console, foreign_key: true
      t.references :genre, foreign_key: true
      t.references :productType, foreign_key: true
      t.decimal :price
      t.text :description
      t.date :dateReleased
      t.string :name

      t.timestamps
    end
  end
end
