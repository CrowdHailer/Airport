require './Lib/gate'

describe Gate do

	let(:gate) { Gate.new }
	
	it 'should be created available' do
		expect(gate).to be_available
	end


end