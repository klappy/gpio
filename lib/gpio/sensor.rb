module GPIO
	class Sensor
		def initialize(params)
			@pin = Pin.new(:pin => params[:pin], :mode => :in, :device => params[:device])
		end
		def value
			@pin.read
		end
	end
end