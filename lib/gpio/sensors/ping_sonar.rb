module GPIO
	class PingSonar < Sensor
		attr_reader :output
		def initialize(params)
			@output = OutputPin.new params
			super(params)
		end
		def detect
			@output.on; @output.off;
			start_time = Time.now
			start_subsec = start_time.to_i+start_time.subsec.to_f
			@readings = []
			current_subsec = start_subsec
			until current_subsec - start_subsec > 0.001
				@readings.push @input.read
				current_time = Time.now
				current_subsec = current_time.to_i+current_time.subsec.to_f
			end
			@readings
		end
	end
end