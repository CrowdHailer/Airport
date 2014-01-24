class Gate 
	def initialize
		@parking = []
	end

	def available?
		parking.empty?
	end

	def dock plane
		parking << plane
	end

	def undock
		parking.delete_at(0)
	end
private

	attr_accessor :parking

end