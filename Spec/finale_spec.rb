require './Lib/gate'
require './Lib/plane'

describe "System" do
	gates = [Gate.new,Gate.new,Gate.new,Gate.new,Gate.new,Gate.new,Gate.new,Gate.new]
	planes = [Plane.new,Plane.new,Plane.new,Plane.new,Plane.new,Plane.new]
	airport = Airport.new (gates)
	it 'should land 6 planes' do
		planes.each{ |plane| airport.approach(plane) }
		while airport.holding_pattern.count != 0 do
			airport.approach(airport.holding_pattern.delete_at(0))
		end
		expect(airport.holding_pattern).to eq([])
		expect(airport.full_gates.count).to eq(6)
		expect(planes[0]).not_to be_flying 
	end
	it 'should launch 6 planes' do
		while airport.full_gates.count != 0 do
			airport.depart(airport.full_gates[0])
		end
		expect(airport.full_gates.count).to eq(0)
		expect(planes[0]).to be_flying 
	end
end