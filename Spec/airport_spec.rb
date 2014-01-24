require './Lib/Airport'

describe Airport do
	it 'should be initialized with a number of gates' do
		airport = Airport.new 12
		expect(airport.gates).to eq(12)
	end
end