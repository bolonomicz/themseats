class ReservationsController < ApplicationController
	before_filter :require_login
	
	def index
		@reservations = Reservation.all 
		
	end

	def show
		@reservation = Reservation.find(params[:id])
	end

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = @restaurant.reservations.build(params[:resrvation])
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = @restaurant.reservations.build(params[:reservation])
		@reservation.user_id = current_user.id

		flash.notice = "Reservation  Starts @ #{@reservation.start_time} and ends @ #{@reservation.end_time} was booked" if @reservation.save
		redirect_to restaurant_path(@restaurant)	
	end
	
	def edit
		@reservation = Reservation.find(params[:id])
	end

	def update
		@reservation = Reservation.find(params[:id])
		@reservation.update_attributes(params[:reservation])


		flash.notice = "Reservation was updated"

		redirect_to reservation_path(@reservation)
	end

	def destroy
		@reservation.find(params[:id])
		@reservation.destroy

		flash.notice = "Reservation has been canceled"
		redirect_to root_path
	end

end
