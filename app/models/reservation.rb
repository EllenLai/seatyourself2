class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :guest
	validates :number_of_guests, :numericality => { :only_integer => true, :greater_than_or_equal_to => 1 }
end
