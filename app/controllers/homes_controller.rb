class HomesController < ApplicationController

	def index
		@restaurants = Restaurant.all
		#@restaurants.order(:updated_at)
	end
	
end
