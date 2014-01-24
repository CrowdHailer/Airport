require './Lib/plane'

describe Plane do

	let(:plane) { Plane.new }

	it 'has a flying status when created' do
		expect(plane).to be_flying
	end

	it 'can land' do
		expect(plane.land).not_to be_flying
	end

end