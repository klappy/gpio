module GPIO
	class Pin
		attr_reader :pin, :mode, :device, :hardware_pin, :software_pin, :file
		def initialize(params) #(pin, mode, device=:RaspberryPi)
			@device = GPIO.const_get(params[:device]||:RaspberryPi)

			@pin = params[:pin].to_int
			@hardware_pin = device.hardware_pin(pin)
			@software_pin = device.software_pin(pin)

			@mode = params[:mode].to_s
			raise "Mode should be :in, :out, :bi, :pwm." unless ['in','out'].include? @mode

			device.initialize_pin(software_pin, @mode)
			@mode ||= get_direction
			@file = @device.pin_file(pin, mode)
		end

		def read
			file.rewind; file.getc
		end
	end
end