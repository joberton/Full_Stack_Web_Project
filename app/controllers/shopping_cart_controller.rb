class ShoppingCartController < ApplicationController
	def index
		@shopping_cart = session[:cart]
	end
end
