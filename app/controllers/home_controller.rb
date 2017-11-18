class HomeController < ApplicationController
	def index
		product_type_assoications = ProductType.reflections.keys
		@all_products = ProductType.all.product_type_assoications[0]
	end
end
