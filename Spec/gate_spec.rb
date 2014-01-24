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

	it 'should raise an error if dock is called when unavailable' do
		gate.dock(plane)
		expect{ gate.dock(plane) }.to raise_error
	end

	it 'should raise an error if undock is called on empty gate' do
		expect{ gate.undock }.to raise_error
	end


end