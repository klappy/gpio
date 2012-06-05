# description
====

a ruby gem and repository to contribute gpio code for devices such as Raspberry Pi to read sensors and control outputs.

gpio allows for devices such as raspberry pi or systems with 1wire usb adapters to speak to the system's input/output pins.

# installation
====

### bundler

using bundler, add this to your Gemfile in the root of your app

```ruby
gem 'gpio'
```
install bundler and then run bundle install
```bash
gem install bundler
bundle install
```


### gem install

from command line

```bash
gem install gpio
```

require in your ruby file

```ruby
require 'gpio'
```

# example
====

let's setup a motion sensor on GPIO pin 17 on a RaspberryPi (default).

```ruby
motion = GPIO::MotionDetector.new(pin: 17)
```

do we detect and motion yet?

```ruby
motion.detect
```

let's print a message corresponding to the motion.detect?

```ruby
puts motion.detect ? "Motion detected!" : "No motion detected."
```

was the value any different than the last time it detected?

```ruby
motion.changed?
puts "last: #{motion.last_reading}, current: #{motion.reading}"
```

wait until the value changes before we move on.

```ruby
until motion.changed? do
	motion.detect
	sleep 0.5
end
puts "Something changed!"
puts "last: #{motion.last_reading}, current: #{motion.reading}"
```