class ShoppingCartController < ApplicationController
	
	before_action :authenticate_user!
	before_action :set_cart, only: [:index,:checkout]

	def index
		
	end

	def destroy
		session[:cart].delete_at(params[:id].to_i)
		flash[:notice] = "Item removed successfully"
		redirect_to shopping_cart_index_url
	end

	def checkout
		@provinces = Province.all
		@taxes = {GST: current_user.province.gst, PST: current_user.province.pst, HST: current_user.province.hst}
	end

	def update
		session[:cart][params[:id].to_i]["quantity"] = params[:quantity]
		flash[:notice] = "Item updated successfully"
		redirect_to shopping_cart_index_url
	end

	def edit
		@cart_item = params[:id]
	end

	private
		def set_cart
			@shopping_cart = session[:cart]
		end
end
