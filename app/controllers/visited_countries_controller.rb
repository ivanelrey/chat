class VisitedCountriesController < ApplicationController

	def index
 		@countries = ISO3166::Country.all
	end

	def add_country
		#render plain: params[:visited_country][:country].inspect
		@country = params[:visited_country][:country]
		if VisitedCountry.where(user_id: current_user.id, country: @country).exists?
			render :partial => "visited_countries/visited_countries_partial"
		else
			VisitedCountry.create(user_id: current_user.id, country: @country)
			render :partial => "visited_countries/visited_countries_partial"
		end
	end
	
	private
	def country_params
		params.require(:visited_countries).permit(:country)
	end

end