class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :guest
end
