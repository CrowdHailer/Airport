require './Lib/Airport'

describe Airport do

	let(:plane) { double :plane, land: nil, take_off: nil }
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

		it 'should be able to hold a plane' do
			airport.hold_plane(plane)
			expect(airport.holding_pattern).to eq([plane])
		end

		it 'should be able to remove a plane from holding pattern' do
			airport.hold_plane(plane)
			airport.unhold_plane(plane)
			expect(airport.holding_pattern).to be_empty
		end

		it 'should return any plane removed from holding' do
			airport.hold_plane(plane)
			expect(airport.unhold_plane(plane)).to eq(plane)
		end
	end

	context 'traffic control in good weather' do
		let(:available_gate) { double :gate, available?: true, dock: :plane }
		let(:airport) { Airport.new [available_gate]}
		let(:unavailable_gate) { double :gate, available?: false, undock: plane}
		let(:full_airport) { Airport.new [unavailable_gate]}

		before do
			Airport.any_instance.stub(:current_conditions) { "Clear"}
		end

		it 'should land an approaching plane if gate available' do
			expect(plane).to receive(:land)
			airport.approach(plane)
		end

		it 'should not land a plane if airport full' do
			expect(plane).not_to receive(:land)
			full_airport.approach(plane)
		end

		it 'should hold a plane if airport full' do
			full_airport.approach(plane)
			expect(full_airport.holding_pattern).to eq([plane])
		end

		it 'should place a landed plane in gate' do
			expect(available_gate).to receive(:dock)
			airport.approach(plane)
		end

		it 'should be able to undock a plane from gate' do
			expect(unavailable_gate).to receive(:undock)
			full_airport.depart(unavailable_gate)
		end

		it 'should launch a plane from gate' do
			expect(plane).to receive(:take_off)
			full_airport.depart(unavailable_gate)
		end

	end
	context 'traffic control in bad weather' do
		let(:unavailable_gate) { double :gate, available?: false, undock: plane}
		let(:full_airport) { Airport.new [unavailable_gate]}

		before do
			Airport.any_instance.stub(:current_conditions) { "Stormy"}
		end
		it 'should not be able to undock a plane from gate' do
			expect(unavailable_gate).not_to receive(:undock)
			full_airport.depart(unavailable_gate)
		end

		it 'should not launch a plane from gate' do
			expect(plane).not_to receive(:take_off)
			full_airport.depart(unavailable_gate)
		end

	end

end