require './Lib/weather'

class WeatherSpec 
	include Weather
	
end
describe Weather do

	let(:weather) { WeatherSpec.new }

	# Don't worry about checking return types
	it 'should return a string describing the weather' do
		expect(weather.current_conditions.class).to eq(String)
	end

	# this will only check that at least one is clear, not mostly clear as the test name implies
	it 'should mostly return Clear' do
		records = (0..100).map { weather.current_conditions }
		# records = (0..100).inject([]){ |t| t << weather.current_conditions }
		expect(records.any? { |e| e == "Clear" }).to be_true
	end

	it 'should sometimes return other conditions' do
		records = (0..100).inject([]){ |t| t << weather.current_conditions }
		non_clear_days = records.select { |e| e != "Clear" }
		expect(non_clear_days.count).not_to eq(0)
	end

	it 'should return clear to fly on clear days' do
		weather.stub(:current_conditions) { "Clear" }
		expect(weather).to be_clear_to_fly
	end

	it 'should not return clear to fly on Stormy days' do
		weather.stub(:current_conditions) { "Stormy" }
		expect(weather).not_to be_clear_to_fly
	end
end