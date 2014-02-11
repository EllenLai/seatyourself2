class Guest < ActiveRecord::Base
	has_secure_password
	has_many :reservations
	has_many :restaurants, :through => :reservations
	validates_presence_of :first_name
end
