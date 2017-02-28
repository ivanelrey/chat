class VisitedCountriesController < ApplicationController

	def index
 		@countries = ISO3166::Country.all
	end

end