class ReservationsController < ApplicationController
	before_filter :require_login
	
	def index
		@reservations = Reservation.where(customer: current_user.id)
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
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = Reservation.find(params[:id])
	end

	def update
		@reservation = Reservation.find(params[:id])
		 if @reservation.update_attributes(params[:reservation])
      redirect_to restaurant_reservation_path(@reservation)
    else
      render 'edit'
    end

	# @restaurant = Restaurant.find(params[:restaurant_id])
	# @reservation = @restaurant.reservations.update_attributes(params[:reservation])
	# 		redirect_to root_path
	# 		flash.notice = "Reservation was updated"
	# 	# else
	# 	# 	render 'edit'
	# 	#end
	end

	def destroy
		@reservation.find(params[:id])
		@reservation.destroy

		flash.notice = "Reservation has been canceled"
		redirect_to root_path
	end

end
