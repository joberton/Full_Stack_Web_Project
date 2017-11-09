class GamesController < ApplicationController
	def index
		@games = params[:search] ?  Game.where("name LIKE ?", "%#{params[:search]}%") : Game.all
	end

	def findGame
		@game = Game.find(params[:id])
	end
end
