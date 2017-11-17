class ConsolesController < ApplicationController
	def index
		@consoles = params[:search] ?  Console.where("name LIKE ?", "%#{params[:search]}%").order(:name).page(params[:page]).per(3) : Console.all.page(params[:page]).per(3)
	end

	def findConsole
		@console = Console.find(params[:id])
	end
end
