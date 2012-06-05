module GPIO
	module Device
		def software_pin(pin)
			raise "That software pin doesn't exist." unless software_pins.include? pin
			mapping == :software ? pin : software_pins[hardware_pins.index(pin)]
		end
		def hardware_pin(pin)
			raise "That hardware pin doesn't exist." unless hardware_pins.include? pin
			mapping == :hardware ? pin : hardware_pins[software_pins.index(pin)]
		end
		def load_pins
			get_pins(:hardware).map{|pin| Pin.new(pin,get_direction(pin),self)}
		end
		def unexport_all!
			load_pins.map(&unexport!)
		end
	end
end