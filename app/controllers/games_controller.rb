class GamesController < ApplicationController
	def index
		@games = Game.all
	end

	def findGame
		@game = Game.find(params[:id])
	end
end
