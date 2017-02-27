class LanguagesController < ApplicationController
	def index
		@languages = Language.all
	end

	def show
		@learn_languages = Language.all
	end
end