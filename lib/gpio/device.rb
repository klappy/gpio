module GPIO
	class Device
		attr_reader :mapping, :hardware_pins, :software_pins

		def software_pin(pin)
			raise "That software pin doesn't exist." unless software.include? pin
			mapping == :software ? pin : software[hardware.index(pin)]
		end
		def hardware_pin(pin)
			raise "That hardware pin doesn't exist." unless hardware.include? pin
			mapping == :hardware ? pin : hardware[software.index(pin)]
		end
		def load_pins
			get_pins(:hardware).map{|pin| Pin.new(pin,get_direction(pin),self)}
		end
		def unexport_all!
			load_pins.map(&unexport!)
		end
	end
end