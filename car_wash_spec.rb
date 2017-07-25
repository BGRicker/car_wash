require 'rspec'
require_relative 'car_wash'

describe Truck do
		before { @truck = Truck.new(false, 12314)  }
		before { @repeat_truck = Truck.new(true, 12314)  }
		before { @muddy_truck = Truck.new(false, 12314, true)  }
		before { @repeat_muddy_truck = Truck.new(true, 12314, true)  }
		before { @open_bed_truck = Truck.new(false, 12314, false, true)  }
		before { @muddy_open_bed_truck = Truck.new(false, 12314, true, true)  }
		before { @open_bed_truck = Truck.new(false, 12314, true, true)  }
		before { @stolen_truck = Truck.new(false, 1111111)  }

	describe "creation" do
		it "is a class of Truck" do
			@truck.should be_an_instance_of Truck
		end

		it "class has Automobile as ancestor" do
			@truck.class.ancestors.include? Truck
		end

		it "has attributes we set" do
			@truck.repeat.should eql false
			@truck.license.should eql 12314
		end

		it "has optional attributes as false" do
			@truck.mud_in_bed.should eql false
			@truck.bed_open.should eql false
		end

		it "creates a repeat visit truck" do
			@repeat_truck.repeat.should eql true
		end

		it "creates muddy truck" do
			@muddy_truck.mud_in_bed.should eql true
		end

		it "creates truck with an open bed" do
			@open_bed_truck.bed_open.should eql true
		end

		it "creates muddy truck with an open bed" do
			@muddy_open_bed_truck.mud_in_bed.should eql true
			@muddy_open_bed_truck.bed_open.should eql true
		end
	end

	describe "cost of cleaning" do
		it "legal car, bed closed, no mud, first time visit" do
			expect(@truck.outcome).to eq(10)
		end
		it "legal car, bed closed, no mud, repeat visit" do
			expect(@repeat_truck.outcome).to eq(5)
		end
		it "legal car, bed closed, muddy truck, first time visit" do
			expect(@muddy_truck.outcome).to eq(12)
		end
		it "legal car, bed closed, muddy truck, repeat visit" do
			expect(@repeat_muddy_truck.outcome).to eq(6)
		end
	end

	describe "rejected trucks" do
		it "open bed rejection" do
			expect(@open_bed_truck.outcome).to eq("please close your truck bed so we can clean it")
		end
		it "stolen truck rejection" do
			expect(@stolen_truck.outcome).to eq("we can't clean your stolen automobile")
		end
	end
end

describe Car do
		before { @car = Car.new(false, 12314)  }
		before { @repeat_car = Car.new(true, 12314)  }
		before { @stolen_car = Car.new(false, 1111111)  }

	describe "creation" do
		it "is a class of Car" do
			@car.should be_an_instance_of Car
		end

		it "class has Automobile as ancestor" do
			@car.class.ancestors.include? Truck
		end

		it "has attributes we set" do
			@car.repeat.should eql false
			@car.license.should eql 12314
		end

		it "creates a repeat visit car" do
			@repeat_car.repeat.should eql true
		end
	end

	describe Truck, "cost of cleaning" do
		it "legal car, bed closed, no mud, first time visit" do
			expect(@car.outcome).to eq(5)
		end
		it "legal car, bed closed, no mud, repeat visit" do
			expect(@repeat_car.outcome).to eq(2.5)
		end
	end

	describe "rejected cars" do
		it "stolen car rejection" do
			expect(@stolen_car.outcome).to eq("we can't clean your stolen automobile")
		end
	end
end
