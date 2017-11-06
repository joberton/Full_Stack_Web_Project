class ConsolesController < ApplicationController
	def index
		@consoles = Console.all
	end

	def findConsole
		@console = Console.find(params[:id])
	end
end
