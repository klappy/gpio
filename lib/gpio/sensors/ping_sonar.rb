module GPIO
	class PingSonar < Sensor
		attr_reader :output
		def initialize(params)
			@output = OutputPin.new params
			super(params)
		end
		def detect
			@output.on; @output.off;
			start = t.to_i+t.subsec.to_f
			@readings = []
			until t.to_i+t.subsec.to_f - start > 0.001
				@readings.push @input.read
			end
			@readings
		end
	end
end