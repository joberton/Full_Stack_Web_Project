class CustomersController < ApplicationController
	before_action :create_customer, :only => [:create]
	before_action :find_customer, :only => [:create,:index]
	before_action :set_cart, only: [:create]

	def index
		
	end

	def create
		@amount = (session[:summary]["grand_total"].to_f).round(2) * 100
		@order = Order.create(status: "new", amount: session[:summary]["grand_total"], user_id: current_user.id)
		if(@order.valid?)
			Stripe::Charge.create(customer: @customer.stripe_customer, amount: @amount.to_i, description: "product charge", currency: "usd")
			@shopping_cart.each do |line_item|
				LineItem.create(product_name: line_item["name"],price: line_item["price"],quantity: line_item["quantity"],order_id: @order.id)
			end
			session.delete(:cart)
			session.delete(:summary)
			redirect_to shopping_cart_index_url
		else
			render 'shopping_cart'
		end
	end

	private
		def find_customer
			@customer = Customer.where(user_id: current_user.id).first
		end

		def create_customer
			@customer = Customer.where(user_id: current_user.id)
			if(@customer.empty?)
				stripe_customer = Stripe::Customer.create(:email => params[:stripeEmail],:source => params[:stripeToken])
				@customer = Customer.create(permit_customer_params(stripe_customer))
				if(!@customer.valid?)
					render 'shopping_cart'
				end
			end
		end

		def set_cart
			@shopping_cart = session[:cart]
		end

		def permit_customer_params(stripe_cus)
			params.require(:customer).permit(:first_name,:last_name,:address,:postal_code,:email,:stripe_customer).merge(user_id: current_user.id, stripe_customer: stripe_cus.id)
		end

end
