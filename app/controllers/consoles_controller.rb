class ConsolesController < ApplicationController
	def index
		@consoles = params[:search] ?  Console.where("name LIKE ?", "%#{params[:search]}%").order(:name).page(params[:page]).per(3) : Console.all.page(params[:page]).per(3)
	end

	def add_to_cart
		@console = Console.find(params[:id])
		session[:cart] << @console.as_json.merge(:quantity => 1)
		redirect_to shopping_cart_index_url
	end

	def new
		@console = Console.new
	end

	def create
		@console = Console.create(params.require(:console).permit(:name,:price,:date_released,:description,:image,:product_type_id).merge(:product_type_id => 1))
		if(@console.valid?)
			redirect_to @console
		else
			render 'new'
		end
	end

	def show
		@console = Console.find(params[:id])
	end
end
