# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

test1 = ProductType.first.games
puts test1.inspect
# puts ProductType.first.inspect
#console = Console.create(:product_type_id => 1, :name => "Super Nintendo Entertainment System", :price => 159.99, :description => "the king of the 16-bit consoles")
# console1 = Console.create(:product_type_id => 1, :name => "Nintendo Entertainment System" , :price => 129.99, :description => "the king of the 8-bit consoles")
# game = Game.create(:name => "Super Mario World", :console_id => 1, :genre_id => 1, :price => 29.99, :description => "You can fly over entire levels bro")
# puts ProductType.first.inspect
# productType = ProductType.new(:name => "Consoles")
# puts productType.valid?
# puts console1.errors.inspect
# puts console1.valid?
# puts game.errors.inspect
# puts game.valid?