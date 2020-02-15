class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token
	wrap_parameters :user, include: [:first_name, :last_name, :email, :password]

	def index
		users = User.all
		render_user_json users
	end

	def show
    	user = User.find_by(id: params[:id])

  		if user.nil?
    		render json: { message: "User not found" }, status: :not_found
    	else
    		render_user_json user
    	end
  	end

	def create
    	user = User.new(user_params)

    	if user.save
    		render_user_json user
  		else
    		render json: { message: "User validation failed", errors: user.errors }, status: :bad_request
  		end
	end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def render_user_json(user)
  	render json: user, :except => [:created_at, :updated_at, :password_digest]
  end

end
