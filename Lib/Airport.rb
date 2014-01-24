require './Lib/weather'

class Airport 
	include Weather

	def initialize(gates=[])
		@gates = gates
		@holding_pattern = []
	end
	
	attr_reader :gates, :holding_pattern

	def approach plane
		if !full? && clear_to_fly?
			clear_to_land plane
		else
			hold_plane plane
		end
	end

	def weather_conditions location
		location.current_conditions
	end

	def available_gates
		gates.select{|g| g.available?}
	end

	def next_gate
		available_gates.first
	end

	def full?
		available_gates.count == 0
	end

	def clear_to_land plane
		plane.land
	end

	def clear_to_take_off plane
		plane.take_off
	end

	def hold_plane plane
		holding_pattern << plane
	end

	def unhold_plane plane
		holding_pattern.delete(plane)
	end

	
end