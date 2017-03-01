class VisitedCountriesController < ApplicationController

	def index
 		@countries = ISO3166::Country.all
	end

	def add_country
		#render plain: params[:visited_country][:country].inspect
		@country = params[:visited_country][:country]
		if VisitedCountry.where(user_id: current_user.id, country: @country).exists?
			redirect_to user_path(current_user)
		else
			VisitedCountry.create(user_id: current_user.id, country: @country)
			redirect_to user_path(current_user)
		end
		#respond_to do |format|
    	#	format.js
 		#end
	end
	def remove_country
		VisitedCountry.where(user_id: current_user.id, country: params[:visited_country]).delete_all
		redirect_to user_path(current_user)
	end
	
	private
	def country_params
		params.require(:visited_countries).permit(:country)
	end

end