class ShoppingCartController < ApplicationController
	
	before_action :authenticate_user!

	def index
		@shopping_cart = session[:cart]
	end

	def destroy
		session[:cart].delete_at(params[:id].to_i)
		redirect_to shopping_cart_index_url
	end

	def update
		session[:cart][params[:id].to_i]["quantity"] = params[:quantity]
		redirect_to shopping_cart_index_url
	end

	def edit
		@cart_item = params[:id]
	end
end
