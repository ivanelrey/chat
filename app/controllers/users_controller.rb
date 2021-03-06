class UsersController < ApplicationController

	def index
		@users = User.all.where("id != ?", current_user.id)
	end

	def show
		@user = User.find(params[:id])
		@friends =  @user.inverse_friends + @user.friends 
		@visited_countries = @user.visited_countries.all	
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save && @user.build_profile.save
			flash[:notice] = "You have created an account"
			session[:user_id] = @user.id
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