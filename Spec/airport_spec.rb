require './Lib/Airport'

describe Airport do

	let(:gate) { double :gate }
	let(:available_gate) { double :gate, available?: true }
	let(:unavailable_gate) { double :gate, available?: false}
	let(:two_gate_airport) { Airport.new [available_gate, unavailable_gate] }

	it 'should be initialized with a number of gates' do
		airport = Airport.new [gate]
		expect(airport.gates).to eq([gate])
	end

	it 'should be able to return all avilable gates' do
		expect(two_gate_airport.available_gates).to eq([available_gate])
	end

	it 'should be able to test if gates available' do
		expect(two_gate_airport).not_to be_full
	end

	it 'should be full if no gates available' do
		airport = Airport.new [double(:gate, available?: false)]
		expect(airport).to be_full
	end

	context 'Weather conditions are randomly generated by the weather center' do

		it 'should return the weather conditions as "Clear"' do
			weather_center = double :weather_center, current_conditions: "Clear"

			airport = Airport.new
			expect(airport.weather_conditions(weather_center)).to eq("Clear")
		end

		it 'should return the weather conditions as "Stormy"' do
			weather_center = double :weather_center, current_conditions: "Stormy"

			airport = Airport.new
			expect(airport.weather_conditions(weather_center)).to eq("Stormy")
		end

	end	
end