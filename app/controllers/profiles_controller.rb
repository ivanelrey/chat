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

	def update_profile
		@profile_edit = Profile.find(current_user.profile.id)
		@profile_edit.update(user_params)
		@user = User.find(current_user.id)
		respond_to do |format|
    		format.js { render :action => "refresh_profile_info_div" }
 		end
	end

	private
	def user_params
		params.require(:profile).permit(:gender, :birth_date, :about_me, :avatar, :from_country, :last_location)
	end
end