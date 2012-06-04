Gem::Specification.new do |s|
  s.name        = 'gpio'
  s.version     = '0.0.1'
  s.date        = '2012-06-04'
  s.homepage    = 'http://klappy.github.com/gpio'
  s.summary     = "gpio allows for devices such as raspberry pi or systems with 1wire usb adapters to speak to the system's input/output pins."
  s.description = "gpio allows for devices such as raspberry pi or systems with 1wire usb adapters to speak to the system's input/output pins. The end goal is for people to contribute code for specific devices, sensors and outputs."
  s.authors     = ['Christopher Klapp']
  s.email       = 'christopher@klapp.name'
  s.files       = Dir.glob("{lib,examples}/**/*") + %w(README.md changelog)
end
