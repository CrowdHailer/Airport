require './Lib/Airport'

describe Airport do
	it 'should be initialized with a number of gates' do
		airport = Airport.new 12
		expect(airport.gates).to eq(12)
	end

	context 'Weather conditions are randomly generated by the weather center' do

		it 'should return the weather conditions as "Clear"' do
			weather_center = double :weather_center, current_conditions: "Clear"

			airport = Airport.new 10
			expect(airport.weather_conditions(weather_center)).to eq("Clear")
		end

		it 'should return the weather conditions as "Stormy"' do
			weather_center = double :weather_center, current_conditions: "Stormy"

			airport = Airport.new 10
			expect(airport.weather_conditions(weather_center)).to eq("Stormy")
		end

	end	
end