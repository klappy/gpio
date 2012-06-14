module GPIO
	class PingSonar < Sensor
		attr_reader :output
		def initialize(params)
			@output = OutputPin.new params
			super(params)
		end
		def detect
			@readings = []
			@output.on;
			@output.off;
			start = Time.now.to_f
			until Time.now.to_f - start > 0.001
				@readings.push @input.read
			end
			@detect_time = Time.now.to_f - start
			@readings
		end
	end
end