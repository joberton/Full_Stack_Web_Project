class GamesController < ApplicationController
	
	before_action :find_game, only: [:show,:edit,:destory,:update,:add_to_cart]
	before_action :fetch_releated_data, only: [:index,:new,:edit,:update,:create]
		
	def index
		@games = Game.all.page(params[:page]).per(8).order(:name)
		if(params[:search])
			@games = !params[:category].empty? ? Game.where("name LIKE ?", "%#{params[:search]}%").where("console_id = #{params[:category]}").order(:name).page(params[:page]).per(8) : Game.where("name LIKE ?", "%#{params[:search]}%").order(:name).page(params[:page]).per(8)
		end
	end

	def new
		@game = Game.new
	end

	def edit
		
	end

	def update
		if(@game.update(permitted_parameters))
			redirect_to @game
		else
			render 'edit'
		end
	end

	def destroy
		@game.destroy
		redirect_to games_url
	end

	def add_to_cart
		session[:cart] << @game.as_json.merge(:quantity => 1)
		redirect_to shopping_cart_index_url
	end

	def create
		@game = Game.create(permitted_parameters)
		if @game.valid? 
			redirect_to @game
		else
			render 'new'
		end
	end

	def show
		
	end

	private
		def fetch_releated_data
			@consoles = Console.all
			@genres = Genre.all
		end

		def find_game
			@game = Game.find(params[:game_id] || params[:id])
		end
		
		def permitted_parameters
			params.require(:game).permit(:name,:price,:date_released,:description,:console_id,:genre_id,:product_type_id,:image).merge(:product_type_id => 2)
		end
end
