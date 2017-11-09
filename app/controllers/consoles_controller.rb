class ConsolesController < ApplicationController
	def index
		@consoles = params[:search] ?  Console.where("name LIKE ?", "%#{params[:search]}%") : Console.all
	end

	def findConsole
		@console = Console.find(params[:id])
	end
end
