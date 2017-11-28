class CustomersController < ApplicationController
	before_action :create_customer, :only => [:create]

	def index
		@customer = Customer.where("user_id = #{current_user.id}")
	end

	def create
		@order = Order.create(status: "new", amount: session[:summary]["grand_total"], user_id: current_user.id)
		if(@order.valid?)
			redirect_to shopping_cart_index_url
		else
			render 'shopping_cart'
		end
	end

	private
		def create_customer
			customer = Customer.where(user_id: current_user.id)
			if(customer.empty?)
				@customer = Customer.create(permit_customer_params)
				if(@customer.valid?)
					redirect_to customers_url
				else
					render 'shopping_cart'
				end
			end
		end

		def permit_order_parmas
			params.require(:session).permit(:grand_total,:status,:user_id)
		end
		def permit_customer_params
			params.require(:customer).permit(:first_name,:last_name,:address,:postal_code,:email).merge(user_id: current_user.id)
		end

end
