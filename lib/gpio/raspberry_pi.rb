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
			"#{base_path}gpio#{n}/"
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

		def self.get_pins(mapping=@mapping)
			pins = `sudo ls #{base_path}`.scan(/(?:gpio)(\d+)/).flatten.map!(&:to_i)
			pins.map!{|pin| Pin.new(pin,nil,self).pin}
		end
		def self.get_direction(software_pin)
			`sudo cat #{direction_path(software_pin)}`.chomp
		end

		def self.initialize_pin(software_pin, direction)
			unexport!(software_pin) if exported?(software_pin) && direction != get_direction(software_pin)
			export!(software_pin, direction) unless exported?(software_pin)
		end

		def self.exported?(software_pin)
			`sudo [ -d #{pin_path(software_pin)} ] && echo true || false`.chomp == 'true'
		end
		def self.export!(software_pin,direction)
			`sudo bash -c "echo #{software_pin} > #{export_path}"`
			`sudo bash -c "echo #{direction} > #{direction_path(software_pin)}"`
			exported?(software_pin)
		end
		def self.unexport!(software_pin)
			`sudo bash -c "echo #{software_pin} > #{unexport_path}"`
			!exported?(software_pin)
		end

		def self.read(software_pin)
			`sudo cat #{value_path(software_pin)}`.chomp == '1'
		end
		def self.write(software_pin,value)
			raise "This pin is an input." if get_direction(software_pin) == 'in'
			`sudo bash -c "echo #{value} > #{value_path(software_pin)} && echo true || false"`.chomp == 'true'
		end
	end
end