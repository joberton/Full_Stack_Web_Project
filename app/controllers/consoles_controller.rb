class ConsolesController < ApplicationController
	def index
		@consoles = params[:search] ?  Console.where("name LIKE ?", "%#{params[:search]}%").order(:name).page(params[:page]).per(3) : Console.all.page(params[:page]).per(3)
	end

	def add_to_cart
		@console = Console.find(params[:id])
		session[:cart] << @console
		redirect_to shopping_cart_url
	end

	def show
		@console = Console.find(params[:id])
	end

end
