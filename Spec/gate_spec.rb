require './Lib/gate'

describe Gate do

	let(:gate) { Gate.new }
	let(:plane) { double :plane }
	
	it 'should be created available' do
		expect(gate).to be_available
	end

	it 'should be unavailable after docking a plane' do
		gate.dock(plane)
		expect(gate).not_to be_available
	end

	it 'should be available after undocking a plane' do
		gate.dock(plane)
		gate.undock
		expect(gate).to be_available
	end

	it 'should return undocked plane' do
		gate.dock(plane)
		expect(gate.undock).to eq(plane)
	end


end