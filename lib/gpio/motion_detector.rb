module GPIO
	class MotionDetector < Sensor
		def detect
			read
		end
	end
end