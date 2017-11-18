class HomeController < ApplicationController
	def index
		@all_products = Game.all + Console.all
	end
end
