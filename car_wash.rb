class Automobile
	attr_reader :license
	attr_accessor :repeat

	def initialize(repeat, license, mud_in_bed = false, bed_open = false)
		@repeat = repeat
		@license = license
	end

	def legal?
		@license == 1111111 ? false : true
	end

	def outcome
		if !legal?
			return "we can't clean your stolen automobile"
		elsif @bed_open
			return "please close your truck bed so we can clean it"
		else
			charge
		end
	end
end

class Car < Automobile
	def initialize(repeat, license)
		super
	end

	def charge
		charge = 5.0
		@repeat ? charge = charge / 2 : charge
	end

end

class Truck < Automobile
	attr_reader :mud_in_bed, :bed_open

	def initialize(repeat, license, mud_in_bed = false, bed_open = false)
		super
		@mud_in_bed = mud_in_bed
		@bed_open = bed_open
	end

	def charge
		charge = 10.0
		@mud_in_bed ? charge = charge + 2 : charge
		@repeat ? charge = charge / 2 : charge
	end
end

# car = Car.new(false, 111712897)
# car2 = Car.new(true, 1111111)
# car3 = Car.new(true, 11)
# truck = Truck.new(false, 12314)
# stolen_truck = Truck.new(true, 1111111, true)
# mud_truck = Truck.new(false, 111, true, false)
# bed_open_truck = Truck.new(false, 111, true, true)

# puts "car with false revisit, legal plate  - \t\t #{car.outcome}"
# puts "car with true revisit, illegal plate   - \t\t #{car2.outcome}"
# puts "car with true revisit, legal plate   - \t\t #{car3.outcome}"
# puts " truck with legal plates  - \t\t #{truck.outcome}"
# puts " truck with illegal plates, mud in bed  - \t\t #{stolen_truck.outcome}"
# puts " truck with legal plates, mud in bed, bed open  - \t\t #{mud_truck.outcome}"
# puts " truck with legal plates, bed open - \t\t #{bed_open_truck.outcome}"
