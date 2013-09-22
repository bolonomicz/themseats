class Reservation < ActiveRecord::Base

  belongs_to :user
  belongs_to :restaurant
  attr_accessible :end_time, :part_size, :start_time
end
