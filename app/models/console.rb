class Console < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	validates :product_type_id, presence: true
	validates :description, presence: true
	validates :date_released, presence: true
	validates :price, presence: true
	validates :price, numericality: {other_than: 0}
	
	has_many :games
	belongs_to :product_type
end
