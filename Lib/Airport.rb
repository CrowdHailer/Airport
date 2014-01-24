class Airport 
	def initialize(gates)
		@gates = gates
	end
	
	attr_reader :gates

	def weather_conditions location
		location.current_conditions
	end


	
end