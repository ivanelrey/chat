class ProfilesController < ApplicationController

	def edit
		@profile = Profile.find(params[:id])
	end

	def update
		@profile = Profile.find(params[:id])
		if @profile.update(user_params)
			flash[:success] = "Your profile was updated successfully"
			redirect_to user_path(@profile.user.id)
		else
			render 'edit'
		end
	end

	private
	def user_params
		params.require(:profile).permit(:gender, :birth_date, :about_me)
	end
end