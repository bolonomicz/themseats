class Restaurant < ActiveRecord::Base
  attr_accessible :name, :summary
  has_many :reservations
  has_many :users, through: :reservations
end
