class Restaurant < ActiveRecord::Base
	has_many :reservations
	has_many :guests, :through => :reservations
	validates :name, :address, :category, :summary, :presence => true

	def opening_hour
		11
	end

	def closing_hour
		20
	end

	def time_slots
		reservation_interval = 1.hour

		start_time = Time.zone.now + 10.minutes
		start_time = Time.zone.at((start_time.to_f / reservation_interval).ceil * reservation_interval)
		start_time = [start_time, start_time.change(hour: opening_hour)].max
		end_time = (start_time + 3.days).change(hour: closing_hour)

		all_times = []

		a_time = start_time

		begin
			all_times << a_time

			a_time += reservation_interval

			if (a_time + reservation_interval) > a_time.change(hour: closing_hour)
				a_time = (a_time + 1.day).change(hour: opening_hour)
			end
		end while a_time < end_time

		all_times
	end
end
