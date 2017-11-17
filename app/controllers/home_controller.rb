class HomeController < ApplicationController
	def index
		@all_products = ProductType.all
	end
end
