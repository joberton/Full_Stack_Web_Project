class GenresController < ApplicationController
	def index
		@genres = params[:search] ?  Genre.where("name LIKE ?", "%#{params[:search]}%") : Genre.all
	end
end
