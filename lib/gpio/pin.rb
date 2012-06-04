module GPIO
	class Pin
		attr_reader :hardware_pin, :software_pin, :pin, :direction, :device
		def initialize(pin, direction, device)
			@device = device

			@hardware_pin = device.hardware_pin(pin)
			@software_pin = device.software_pin(pin)
			@pin = device.mapping ? software : hardware

			@direction = direction.to_s || get_direction
			raise "Direction should be :in, :out." unless ['in','out'].include? @direction

			device.initialize_pin(software_pin, @direction)
		end

		def on
			device.write software_pin, 1
			read
		end
		def off
			device.write software_pin, 0
			read
		end
		def read
			device.read(pin)
		end
	end
end