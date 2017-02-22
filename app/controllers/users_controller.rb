class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save && @user.build_profile.save
			flash[:notice] = "You have created an account"
			redirect_to user_path(@user)
		else
			render 'new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:username,:email,:password)
	end
end