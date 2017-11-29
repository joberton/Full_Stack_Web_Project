class OrdersController < ApplicationController

	def index
		@orders = Order.where(user_id: current_user.id)
	end

	def show
		@line_items = LineItem.where(order_id: params[:id])
	end
end
