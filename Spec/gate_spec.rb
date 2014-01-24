require './Lib/gate'

describe Gate do

	let(:gate) { Gate.new }
	
	it 'should be created available' do
		expect(gate).to be_available
	end

	it 'should be unavailable after docking a plane' do
		plane = double :plane
		gate.dock(plane)
		expect(gate).not_to be_available
	end

	it 'should be available after undocking a plane' do
		plane = double :plane
		gate.dock(plane)
		gate.undock(plane)
		expect(gate).to be_available
	end


end