class GamesController < ApplicationController
	def index
		@games = params[:search] ?  Game.where("name LIKE ?", "%#{params[:search]}%").order(:name).page(params[:page]).per(3) : Game.all.page(params[:page]).per(3)
	end

	def findGame
		@game = Game.find(params[:id])
	end
end
