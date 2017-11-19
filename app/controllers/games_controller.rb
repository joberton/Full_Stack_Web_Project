class GamesController < ApplicationController
	def index
		setup
		@games = Game.all.page(params[:page]).per(8).order(:name)
		if(params[:search])
			@games = !params[:category].empty? ? Game.where("name LIKE ?", "%#{params[:search]}%").where("console_id = #{params[:category]}").order(:name).page(params[:page]).per(8) : Game.where("name LIKE ?", "%#{params[:search]}%").order(:name).page(params[:page]).per(8)
		end
	end

	def new
		setup
	end

	def add_to_cart
		@game = Game.find(params[:id])
		session[:cart] << @game
		redirect_to shopping_cart_url
	end

	def create
		setup
		@game = Game.create(params.require(:game).permit(:name,:price,:date_released,:description,:console_id,:genre_id,:product_type_id,:image).merge(:product_type_id => 2))
		if @game.valid? 
			redirect_to @game
		else
			render 'new'
		end
	end

	def show
		@game = Game.find(params[:id])
	end

	def setup
		@game = Game.new
		@consoles = Console.all
		@genres = Genre.all
	end
end
