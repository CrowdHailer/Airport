module Weather
	CONDITIONS = ["Clear"]*7+["Stormy"]*2+["Blizzard"]
	def current_conditions
		CONDITIONS.sample
	end
	
	
end