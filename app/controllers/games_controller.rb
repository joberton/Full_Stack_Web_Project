class GamesController < ApplicationController
	def index
		@games = params[:search] ?  Game.where("name LIKE ?", "%#{params[:search]}%").order(:name).page(params[:page]).per(8) : Game.all.page(params[:page]).per(8)
	end

	def new
		setup
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
