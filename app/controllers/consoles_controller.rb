class ConsolesController < ApplicationController
	
	before_action :find_console, only: [:show,:edit,:destroy,:update,:add_to_cart]
	before_action :authenticate_user!

	def index
		@consoles = params[:search] ?  Console.where("name LIKE ?", "%#{params[:search]}%").order(:name).page(params[:page]).per(8) : Console.all.page(params[:page]).per(8)
	end

	def add_to_cart
		session[:cart] << @console.as_json.merge(:quantity => 1)
		flash[:notice] = "Item added to cart Successfully"
		redirect_to shopping_cart_index_url
	end

	def edit
		
	end

	def update
		if(@console.update(permitted_parameters))
			redirect_to @console
			flash[:notice] = "Console Updated Successfully"
		else
			render 'edit'
		end
	end

	def destroy
		@console.destroy
		flash[:notice] = "Console removed Successfully"
		redirect_to consoles_url
	end

	def new
		@console = Console.new
	end

	def create
		@console = Console.create(permitted_parameters)
		if(@console.valid?)
			flash[:notice] = "Console Created Successfully"
			redirect_to @console
		else
			render 'new'
		end
	end

	def show
		
	end

	private
		def find_console
			@console = Console.find(params[:console_id] || params[:id])
		end 
		def permitted_parameters
			params.require(:console).permit(:name,:price,:date_released,:description,:image,:product_type_id).merge(:product_type_id => 1)
		end
end
