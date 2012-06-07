module GPIO
	module RaspberryPi
		extend Device

		def self.mapping
			:hardware
		end
		def self.hardware_pins
			[3,5,7,8,10,11,12,13,15,16,17,19,21,22,23,24,26]
		end
		def self.software_pins
			[0,1,4,14,15,17,18,21,22,23,24,10,9,25,11,8,7]
		end
		
		def self.base_path
			'/sys/class/gpio/'
		end
		def self.pin_path(n)
			"#{base_path}#{pin_prefix}#{n}/"
		end
		def self.direction_path(n)
			"#{pin_path(n)}direction"
		end
		def self.value_path(n)
			"#{pin_path(n)}value"
		end
		def self.export_path
			"#{base_path}export"
		end
		def self.unexport_path
			"#{base_path}unexport"
		end
		def self.pin_prefix
			"gpio"
		end
	end
end
