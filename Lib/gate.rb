class Gate 
	def initialize
		@plane = nil
	end

	def available?
		plane.nil?
	end

	def dock plane
		self.plane = plane
	end

	def undock
		self.plane = nil
		
	end
private

	attr_accessor :plane

end