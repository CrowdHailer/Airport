class Airport 
	def initialize(number_of_gates)
		@gates = number_of_gates
	end
	
	attr_reader :gates

	def weather_conditions location
		location.current_conditions
	end


	
end