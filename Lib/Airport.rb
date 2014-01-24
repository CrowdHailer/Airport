class Airport 
	def initialize(gates=[])
		@gates = gates
	end
	
	attr_reader :gates

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


	
end