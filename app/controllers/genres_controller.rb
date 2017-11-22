class GenresController < ApplicationController

	before_action :find_genre, only: [:destroy,:update,:edit]
	before_action :authenticate_user!
	
	def index
		@genres = params[:search] ?  Genre.where("name LIKE ?", "%#{params[:search]}%") : Genre.all
	end

	def new
		@genre = Genre.new
	end

	def edit

	end

	def update
		if(@genre.update(permitted_parameters))
			redirect_to genres_url
		else
			render "edit"
		end
	end

	def destroy
		@genre.destroy
		redirect_to genres_url
	end

	def create
		@genre = Genre.create(permitted_parameters)
		if(@genre.valid?)
			redirect_to genres_url
		else
			render 'new'
		end
	end

	private
		def find_genre
			@genre = Genre.find(params[:id])
		end
		def permitted_parameters
			params.require(:genre).permit(:name)
		end
end
