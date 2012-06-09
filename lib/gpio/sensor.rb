module GPIO
	class Sensor
		attr_reader :input
		def initialize(params)
			@input = InputPin.new(params)
		end
		def changed?
			input.changed?
		end
		def read
			input.read
		end
		def reading
			input.reading
		end
		def last_reading
			input.last_reading
		end
	end
end