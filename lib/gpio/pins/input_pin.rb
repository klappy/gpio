module GPIO
	class InputPin < Pin
		attr_reader :last_reading, :reading
		def initialize(params) #(pin, mode, device=:RaspberryPi)
			params.merge! :mode => :in, :pin => params[:input_pin] || params[:pin]
			super(params)
		end

		def changed?
			@last_reading != @reading
		end
		def read
			@last_reading = @reading
			@reading = super
		end
	end
end