module GPIO
	class OutputPin < Pin
		def initialize(params) #(pin, mode, device=:RaspberryPi)
			params.merge!(:mode => :out)
			super(params)
		end

		def on
			device.write software_pin, 1
			read
		end
		def off
			device.write software_pin, 0
			read
		end
	end
end