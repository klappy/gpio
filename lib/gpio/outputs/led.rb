module GPIO
	class Led
		attr_reader :pin
		def initialize(params)
			@pin = OutputPin.new(params)
		end

		def on
			pin.on
		end
		def off
			pin.off
		end
		def blink(duration)
			pulse(duration)
		end
		def state
			pin.state
		end
	end
end