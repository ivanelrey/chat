class LanguagesUsersController < ApplicationController
	def remove_user_language
		#render plain: params[:remove_language_id].inspect
		@user_language = LanguagesUser.where(user_id: current_user.id, language_id: params[:remove_language_id]).delete_all
		redirect_to languages_path
	end

	def add_user_language
		#render plain: params[:languages_user][:language].inspect
		LanguagesUser.create(user_id: current_user.id, language_id: params[:languages_user][:language], action: "speaks")
		#redirect_to languages_path
		@user = User.find(current_user.id)
		respond_to do |format|
    		format.js { render :action => "refresh_spoken_languages_div" }
 		end
	end
end