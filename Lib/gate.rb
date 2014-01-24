class Gate 
	def initialize
		@plane = nil
	end
	def available?
		plane.nil?
	end
	

private

	attr_reader :plane

end