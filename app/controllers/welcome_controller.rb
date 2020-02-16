class WelcomeController < ApplicationController
	before_action :validate_user_authorized

	#Test authentication
	def index
		render json: "Welcome #{@current_user.first_name} #{@current_user.last_name}!"
	end

end
