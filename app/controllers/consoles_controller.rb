class ConsolesController < ApplicationController
	def index
		@consoles = params[:search] ?  Console.where("name LIKE ?", "%#{params[:search]}%").order(:name).page(params[:page]).per(3) : Console.all.page(params[:page]).per(3)
	end

	def add_to_cart
		@console = Console.find(params[:id])
		session[:cart] << @console.as_json.merge(:quantity => 1)
		redirect_to shopping_cart_index_url
	end

	def edit
		@console = Console.find(params[:id])
	end

	def update
		@console = Console.find(params[:id])

		if(@console.update(permitted_parameters))
			redirect_to @console
		else
			render 'edit'
		end
	end

	def destroy
		Console.find(params[:id]).destroy
		redirect_to consoles_url
	end

	def new
		@console = Console.new
	end

	def create
		@console = Console.create(permitted_parameters)
		if(@console.valid?)
			redirect_to @console
		else
			render 'new'
		end
	end

	def show
		@console = Console.find(params[:id])
	end

	private 
		def permitted_parameters
			params.require(:console).permit(:name,:price,:date_released,:description,:image,:product_type_id).merge(:product_type_id => 1)
		end
end
