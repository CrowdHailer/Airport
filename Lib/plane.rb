class Plane 
	def initialize
		@flying = true	
	end

	def flying?
		flying
	end

	def land
		# you could have done @flying = false to avoid having a private accessor
		self.flying = false
	end

	def take_off
		self.flying = true
	end


private
	attr_accessor :flying
end