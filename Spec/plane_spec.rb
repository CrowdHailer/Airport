require './Lib/plane'

describe Plane do
	it 'has a flying status when created' do
		expect(Plane.new).to be_flying
	end

end