class ProductType < ApplicationRecord
	has_many :consoles
	has_many :games
end
