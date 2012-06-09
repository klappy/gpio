Gem::Specification.new do |s|
  s.name        = 'gpio'
  s.version     = '0.0.6'
  s.date        = '2012-06-08'
  s.homepage    = 'http://klappy.github.com/gpio'
  s.summary     = "a ruby gem and repository to contribute gpio code for devices such as Raspberry Pi to read sensors and control outputs."
  s.description = "gpio allows for devices such as raspberry pi or systems with 1wire usb adapters to speak to the system's input/output pins."
  s.authors     = ['Christopher Klapp']
  s.email       = 'christopher@klapp.name'
  s.files       = Dir.glob("{lib}/**/*") + %w(README.md changelog)
end
