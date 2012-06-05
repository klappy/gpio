module GPIO
	class Pin
		attr_reader :pin, :mode, :device, :hardware_pin, :software_pin
		def initialize(params) #(pin, mode, device=:RaspberryPi)
			@device = GPIO.const_get(params[:device]||:RaspberryPi)

			@pin = params[:pin].to_int
			@hardware_pin = device.hardware_pin(pin)
			@software_pin = device.software_pin(pin)

			@mode = params[:mode].to_s || device.get_direction
			raise "Mode should be :in, :out, :bi, :pwm." unless ['in','out'].include? @mode

			device.initialize_pin(software_pin, @mode)
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
			device.read(software_pin)
		end
	end
end