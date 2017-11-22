class HomeController < ApplicationController
	
	before_action :authenticate_user!

	def index
		@all_products = Game.all
		if(!params[:filter].blank?)
			@all_products =  params[:filter].eql?("recently_updated") ? Game.where(updated_at: 3.days.ago..Time.current) : Game.where(created_at: 3.days.ago..Time.current)
		end
	end
end
