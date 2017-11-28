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
		@tax_rates = {GST: current_user.province.gst/100, PST: current_user.province.pst/100, HST: current_user.province.hst/100}
		@order_summary = {sub_total: 0, gst_amount: 0, pst_amount: 0, hst_amount: 0, grand_total: 0}
		@shopping_cart.each do |item|
			@order_summary[:sub_total] += item["price"].to_d * item["quantity"].to_i
		end
		@order_summary[:gst_amount] = @order_summary[:sub_total] * @tax_rates[:GST]
		@order_summary[:pst_amount] = @order_summary[:sub_total] * @tax_rates[:PST]
		@order_summary[:hst_amount] = @order_summary[:sub_total] * @tax_rates[:HST]
		@order_summary[:grand_total] = @order_summary[:sub_total] + @order_summary[:hst_amount] + @order_summary[:pst_amount] + @order_summary[:gst_amount]
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
