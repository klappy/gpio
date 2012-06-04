module GPIO
	class RaspberryPi < Device
		def initialize(mapping)
			@mapping = mapping || :hardware
			raise "mapping must either be :hardware or :software" unless [:hardware,:software].include? mapping
			@hardware_pins = [3,5,7,8,10,11,12,13,15,16,17,19,21,22,23,24,26]
			@software_pins = [0,1,4,14,15,17,18,21,22,23,24,10,9,25,11,8,7]
		end

		def get_pins(mapping=@mapping)
			pins = `sudo ls /sys/class/gpio`.scan(/(?:gpio)(\d+)/).flatten.map!(&:to_i)
			pins.map!{|pin| Pin.new(pin,nil,self).pin}
		end
		def get_direction(software_pin)
			`sudo cat /sys/class/gpio/gpio#{software_pin}/direction`.chomp
		end

		def initialize_pin(software_pin, direction)
			unexport!(software_pin) if exported?(software_pin) && direction != get_direction(software_pin)
			export!(software_pin) unless exported?(software_pin)
		end

		def exported?(software_pin)
			`sudo [ -d /sys/class/gpio/gpio#{software_pin} ] && echo true || false`.chomp == 'true'
		end
		def export!(software_pin,direction)
			`sudo bash -c "echo #{software_pin} > /sys/class/gpio/export"`
			`sudo bash -c "echo #{direction} > /sys/class/gpio/gpio#{software_pin}/direction"`
			exported?(software_pin)
		end
		def unexport!(software_pin)
			`sudo bash -c "echo #{software_pin} > /sys/class/gpio/unexport"`
			!exported?(software_pin)
		end

		def read(software_pin)
			`sudo cat /sys/class/gpio/gpio#{software_pin}/value`.chomp == '1'
		end
		def write(software_pin,value)
			raise "This pin is an input." if get_direction(software_pin) == 'in'
			`sudo bash -c "echo #{value} > /sys/class/gpio/gpio#{software_pin}/value && echo true || false"`.chomp == 'true'
		end
	end
end