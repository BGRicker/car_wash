class Automobile
	attr_reader :repeat, :license

	def initialize(repeat, license, mud_in_bed = false, bed_open = false)
		@repeat = repeat
		@license = license
	end

	def legal?
		if @license == 1111111
			return false
		else
			return true
		end
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
