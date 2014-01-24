class Plane 
	def initialize
		@flying = true	
	end


	def flying?
		flying
	end

private
	attr_reader :flying
end