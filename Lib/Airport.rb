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


	
end