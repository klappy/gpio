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
			start = Time.now.to_f
			@output.off;
			until Time.now.to_f - start > 0.001
				@readings.push @input.read
			end
			@readings
		end
	end
end