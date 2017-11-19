class HomeController < ApplicationController
	def index
		if(session[:cart].nil?)
			session[:cart] = []
		end
		@all_products = Game.all + Console.all
	end
end
