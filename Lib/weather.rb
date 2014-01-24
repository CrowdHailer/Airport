module Weather
	CONDITIONS = ["Clear"]*7+["Stormy"]*2+["Blizzard"]
	def current_conditions
		CONDITIONS.sample
	end

	def clear_to_fly?
		current_conditions == "Clear"
	end
	
	
end