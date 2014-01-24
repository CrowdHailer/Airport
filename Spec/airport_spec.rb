require './Lib/Airport'

describe Airport do

	let(:plane) { double :plane }
	let(:gate) { double :gate }
	let(:available_gate) { double :gate, available?: true }
	let(:unavailable_gate) { double :gate, available?: false}

	
	let(:two_gate_airport) { Airport.new [available_gate, unavailable_gate] }

	context 'Airport and gates' do

		it 'should be initialized with a number of gates' do
			airport = Airport.new [gate]
			expect(airport.gates).to eq([gate])
		end

		it 'should be able to return all avilable gates' do
			expect(two_gate_airport.available_gates).to eq([available_gate])
		end

		it 'should be able to return first available gate' do
			expect(two_gate_airport.next_gate).to eq(available_gate)
		end

		it 'should be able to test if gates available' do
			expect(two_gate_airport).not_to be_full
		end

		it 'should be full if no gates available' do
			airport = Airport.new [double(:gate, available?: false)]
			expect(airport).to be_full
		end

		it 'should be initialized with an empty holding pattern' do
			airport = Airport.new
			expect(airport.holding_pattern).to eq([])
		end
	end

	context 'traffic control' do
		let(:airport) { Airport.new }

		it 'should be able to land a plane' do
			expect(plane).to receive(:land)
			airport.clear_to_land(plane)
		end

		it 'should be able to clear a plane to take off' do
			expect(plane).to receive(:take_off)
			airport.clear_to_take_off(plane)
		end



		it 'should hold a plane if weather not clear' do
			airport.hold_plane(plane)
			expect(airport.holding_pattern).to eq([plane])
		end


	end
end