class Gate 
	def initialize
		@parking = []
	end

	def available?
		parking.empty?
	end

	def dock plane
		raise 'This gate is already occupied' unless available?
		parking << plane
	end

	def undock
		raise 'This gate has no plane' if available?
		parking.delete_at(0)
	end
private

	attr_accessor :parking

end