# Let's setup a motion sensor on GPIO pin 17 on a RaspberryPi (default).
motion = GPIO::MotionDetector.new(pin: 17)

# Do we detect and motion yet?
motion.detect

# Let's print a message corresponding to the motion.detect?
puts motion.detect ? "Motion detected!" : "No motion detected."

# Was the value any different than the last time it detected?
motion.changed?
puts "last: #{motion.last_reading}, current: #{motion.reading}"

# Wait until the value changes before we move on.
until motion.changed? do
	motion.detect
	sleep 0.5
end
puts "Something changed!"
puts "last: #{motion.last_reading}, current: #{motion.reading}"