module GPIO
	module Device
		def self.software_pin(pin)
			raise "That software pin doesn't exist." unless software.include? pin
			mapping == :software ? pin : software[hardware.index(pin)]
		end
		def self.hardware_pin(pin)
			raise "That hardware pin doesn't exist." unless hardware.include? pin
			mapping == :hardware ? pin : hardware[software.index(pin)]
		end
		def self.load_pins
			get_pins(:hardware).map{|pin| Pin.new(pin,get_direction(pin),self)}
		end
		def self.unexport_all!
			load_pins.map(&unexport!)
		end
	end
end