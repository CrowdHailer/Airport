class Airport 
	def initialize(gates=[])
		@gates = gates
		@holding_pattern = []
	end
	
	attr_reader :gates, :holding_pattern

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