class AddConsoleToGames < ActiveRecord::Migration[5.1]
  def change
    add_reference :games, :console, foreign_key: true
    add_reference :games, :genre, foreign_key: true
    add_reference :games, :product_type, foreign_key: true 
  end
end
