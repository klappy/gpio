module GPIO
	class Pin
		attr_reader :pin, :mode, :device, :hardware_pin, :software_pin, :file
		def initialize(params) #(pin, mode, device=:RaspberryPi)
			@device = GPIO.const_get(params[:device]||:RaspberryPi)

			@pin = params[:pin].to_i

			@hardware_pin = device.hardware_pin(pin)
			@software_pin = device.software_pin(pin)

			@mode = params[:mode].to_s
			raise "Mode should be :in, :out, :bi, :pwm." unless ['in','out'].include? @mode

			device.initialize_pin(software_pin, @mode)
			@mode ||= get_direction
			@file = @device.pin_file(software_pin, mode) rescue nil
		end

		def read
			file ? (file.rewind and file.getc) : device.read(software_pin)
		end
	end
end