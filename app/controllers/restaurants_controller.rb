class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def new
		@restaurant = Restaurant.new
	end
	def create
		@restaurant = Restaurant.new(params[:restaurant])
		@restaurant.save

		flash.notice = "Restaurant #{@restaurant.name} was registered"
		redirect_to restaurant_path(@restaurant)
		
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
		
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		@restaurant.update_attributes(params[:restaurant])

		flash.notice = "Restaurant #{@restaurant.name} was updated"

		redirect_to restaurant_path(@restaurant)
		
	end

	def destroy
		@restaurant.find(params[:id])
		@restaurant.destroy

		flash.notice = "Restaurant #{@restaurant.name} has been delisted"
		redirect_to root_path
	end
end
