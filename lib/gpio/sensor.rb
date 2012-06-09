module GPIO
	class Sensor
		attr_reader :pin
		def initialize(params)
			@pin = InputPin.new(:pin => params[:pin], :mode => :in, :device => params[:device])
		end
		def changed?
			pin.changed?
		end
		def read
			pin.read
		end
		def reading
			pin.reading
		end
		def last_reading
			pin.last_reading
		end
	end
end