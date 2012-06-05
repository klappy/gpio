module GPIO
	class Sensor
		def initialize(params)
			@pin = Pin.new(:pin => params[:pin], :mode => :in, :device => params[:device])
		end
		def changed?
			@last_reading == @reading
		end
		def read
			@last_reading = @reading
			@reading = @pin.read
		end
	end
end