class User < ActiveRecord::Base
	authenticates_with_sorcery!
  
  attr_accessible :email, :password, :password_confirmation, :username

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :username
  validates_uniqueness_of :username, :email

  has_many :reservations
  has_many :restaurants, through: :reservations
end
