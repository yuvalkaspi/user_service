class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
		@users = User.all
		render_user_json @users
	end

	def show
    	@user = User.find_by(id: params[:id])

  		if @user.nil?
    		render json: { message: "User not found" }, status: 404
    	else
    		render_user_json @user
    	end
  	end

	def create
    	@user = User.new(user_params)

    	if @user.save
    		render_user_json @user
  		else
    		render json: { message: "User validation failed", errors: @user.errors }, status: 400
  		end
	end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

  def render_user_json(user)
  	render json: user, :except => [:created_at, :updated_at]
  end

end
