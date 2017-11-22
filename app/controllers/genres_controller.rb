class GenresController < ApplicationController

	before_action :authenticate_user!
	
	def index
		@genres = params[:search] ?  Genre.where("name LIKE ?", "%#{params[:search]}%") : Genre.all
	end
end
