
# Let's try to turn our colored leds into a traffic light.
light = TrafficLight.new(red_pin: 17, yellow_pin: 21, green_pin: 22)

# Test lights to make sure they all work by restoring power.
light.power_restore(5)

# Now that they work, let's simulate some traffic signals.
light.stop and sleep 1
light.turn and sleep 1
light.turn and sleep 0.5
light.turn and sleep 1
# Check the current state
light.state

# Now a few automated cycles.
light.cycle(3)

# The world has ended an there is no electricity to power the lights...
light.power_outage