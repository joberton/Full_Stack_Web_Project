class ProductType < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	
	has_many :consoles
	has_many :games
end
