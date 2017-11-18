class GamesController < ApplicationController
	def index
		@games = params[:search] ?  Game.where("name LIKE ?", "%#{params[:search]}%").order(:name).page(params[:page]).per(3) : Game.all.page(params[:page]).per(3)
	end

	def new
		@consoles = Console.all
		@genres = Genre.all
	end

	def create
		@game = Game.create(params.require(:game).permit(:name,:price,:date_released,:description,:console_id,:genre_id,:product_type_id).merge(:product_type_id => 2))
		redirect_to @game
	end

	def show
		@game = Game.find(params[:id])
	end
end
