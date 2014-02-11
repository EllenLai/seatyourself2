class Restaurant < ActiveRecord::Base
	has_many :reservations
	has_many :guests, :through => :reservations
	validates :name, :address, :category, :summary, :presence => true
end
