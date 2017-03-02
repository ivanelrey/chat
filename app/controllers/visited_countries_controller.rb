class VisitedCountriesController < ApplicationController

	def index
 		@countries = ISO3166::Country.all
	end

	def add_country
		#render plain: params[:visited_country][:country].inspect
		@country = params[:visited_country][:country]
		if VisitedCountry.where(user_id: current_user.id, country: @country).exists?
			#redirect_to user_path(current_user)
		else
			VisitedCountry.create(user_id: current_user.id, country: @country)
			#redirect_to user_path(current_user)
		end
		@visited_countries = current_user.visited_countries.all	
		@user = User.find(current_user.id)
		respond_to do |format|
    		format.js { render :action => "refresh_visited_countries_partial" }
 		end
	end
	def remove_country
		VisitedCountry.where(user_id: current_user.id, country: params[:visited_country]).delete_all
		#redirect_to user_path(current_user)
		@visited_countries = current_user.visited_countries.all	
		@user = User.find(current_user.id)
		respond_to do |format|
    		format.js { render :action => "refresh_visited_countries_partial" }
 		end
	end
	
	private
	def country_params
		params.require(:visited_countries).permit(:country)
	end

end