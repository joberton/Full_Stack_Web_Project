class HomeController < ApplicationController
	
	before_action :authenticate_user!

	def index
		@all_products = Game.all + Console.all
	end
end
