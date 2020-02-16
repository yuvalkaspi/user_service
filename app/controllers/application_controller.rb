class ApplicationController < ActionController::Base
	def validate_user_authorized
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
		render json: { message: "User unauthorized" }, status: :unauthorized unless @current_user
	end
end
