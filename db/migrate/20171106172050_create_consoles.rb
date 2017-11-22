class CreateConsoles < ActiveRecord::Migration[5.1]
  def change
    create_table :consoles do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.date :date_released

      t.timestamps
    end
  end
end
