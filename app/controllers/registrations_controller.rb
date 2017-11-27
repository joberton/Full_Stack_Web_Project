class RegistrationsController < Devise::RegistrationsController
	before_action :sign_up_params, :only => [:create]
	before_action :load_provinces

	private
		def load_provinces
			@provinces = Province.all
		end
		
		def sign_up_params
			params.require(:user).permit(:province_id,:email,:password,:password_confirmation)
		end

		def account_update_params
			params.require(:user).permit(:province_id,:email,:password,:password_confirmation,:current_password)
		end
end