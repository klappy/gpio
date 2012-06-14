module GPIO
	class PingSonar < Sensor
		attr_reader :output, :detect_time, :prep_time
		def initialize(params)
			@output = OutputPin.new params
			super(params)
		end
		def detect
			begin_time = Time.now.to_f
			@readings = []
			@output.on;
			@output.off;
			@prep_time = Time.now.to_f - begin_time
			start = Time.now.to_f
			until Time.now.to_f - start > 0.1
				@readings.push @input.read
			end
			@detect_time = Time.now.to_f - start
			@readings
		end
	end
end