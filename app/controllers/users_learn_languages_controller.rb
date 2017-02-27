class UsersLearnLanguagesController < ApplicationController
	def remove_user_learns_language
		#render plain: params[:remove_language_id].inspect
		@user_language = UsersLearnLanguage.where(user_id: current_user.id, language_id: params[:remove_language_id]).delete_all
		redirect_to languages_learns_languages_path
	end

	def add_user_learns_language
		UsersLearnLanguage.create(user_id: current_user.id, language_id: params[:add_language_id])
		redirect_to languages_learns_languages_path
	end
end