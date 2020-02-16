class SessionsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			render json: { message: "Successfully signed in"}
		else
			render json: { message: "Authentication error" }, status: :unauthorized
		end
	end

	def destroy
		session[:user_id] = nil
		render json: { message: "Successfully signed out"}
	end

end
