class LanguagesUsersController < ApplicationController

	def remove_user_language
		#render plain: params[:remove_language_id].inspect
		@user_language = LanguagesUser.where(user_id: current_user.id, language_id: params[:remove_language_id]).delete_all
		@user = User.find(current_user.id)
		respond_to do |format|
    		format.js { render :action => "refresh_spoken_languages_div" }
 		end
	end

	def add_user_language
		#render plain: params[:languages_user][:language].inspect
		if LanguagesUser.where(user_id: current_user.id, language_id: params[:languages_user][:language], action: "speaks").exists?
			#LanguagesUser.where(user_id: current_user.id, language_id: params[:languages_user][:language],action: "speaks").delete_all
		elsif LanguagesUser.where(user_id: current_user.id, language_id: params[:languages_user][:language], action: "learns").exists?
			LanguagesUser.where(user_id: current_user.id, language_id: params[:languages_user][:language],action: "learns").delete_all
			LanguagesUser.create(user_id: current_user.id, language_id: params[:languages_user][:language], action: "speaks")
		else	
		LanguagesUser.create(user_id: current_user.id, language_id: params[:languages_user][:language], action: "speaks")
		end
		#redirect_to languages_path
		@user = User.find(current_user.id)
		respond_to do |format|
    		format.js { render :action => "refresh_spoken_languages_div" }
 		end
	end

	def remove_user_learns_language
		#render plain: params[:remove_language_id].inspect
		@user_language = LanguagesUser.where(user_id: current_user.id, language_id: params[:remove_language_id]).delete_all
		@user = User.find(current_user.id)
		respond_to do |format|
    		format.js { render :action => "refresh_spoken_languages_div" }
 		end
	end

	def add_user_learns_language
		#render plain: params[:languages_user][:language].inspect
		if LanguagesUser.where(user_id: current_user.id, language_id: params[:languages_user][:language], action: "learns").exists?
			#LanguagesUser.where(user_id: current_user.id, language_id: params[:languages_user][:language],action: "speaks").delete_all
		elsif LanguagesUser.where(user_id: current_user.id, language_id: params[:languages_user][:language], action: "speaks").exists?
			LanguagesUser.where(user_id: current_user.id, language_id: params[:languages_user][:language],action: "speaks").delete_all
			LanguagesUser.create(user_id: current_user.id, language_id: params[:languages_user][:language], action: "learns")
		else	
		LanguagesUser.create(user_id: current_user.id, language_id: params[:languages_user][:language], action: "learns")
		end
		#redirect_to languages_path
		@user = User.find(current_user.id)
		respond_to do |format|
    		format.js { render :action => "refresh_learning_languages_div" }
 		end
	end


end