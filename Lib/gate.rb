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


private

	attr_accessor :plane

end