class Game < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	validates :console_id, presence: true
	validates :genre_id, presence: true
	validates :product_type_id, presence: true
	validates :description, presence: true
	validates :date_released, presence: true
	validates :price, presence: true
	validates :price, numericality: {other_than: 0}
	
	belongs_to :console
	belongs_to :genre
	belongs_to :product_type
end
