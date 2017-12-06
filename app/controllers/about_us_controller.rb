class AboutUsController < ApplicationController
	before_action :company_details, only: [:edit,:index,:update]

	def index
		
	end

	def edit

	end

	def update
		if(@company_details.update(permitted_parameters))
			redirect_to about_us_url
		else
			render 'edit'
		end
	end

	private
		def company_details
			@company_details = AboutUs.first
		end

		def permitted_parameters
			params.require(:about_us).permit(:description,:address,:city,:phone_number,:contact_email)
		end
end
