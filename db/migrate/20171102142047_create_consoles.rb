class CreateConsoles < ActiveRecord::Migration[5.1]
  def change
    create_table :consoles do |t|
      t.references :productType, foreign_key: true
      t.string :name
      t.decimal :price
      t.text :description
      t.date :dateReleased

      t.timestamps
    end
  end
end
