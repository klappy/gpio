Gem::Specification.new do |s|
  s.name        = 'gpio'
  s.version     = '0.0.1'
  s.date        = '2012-06-03'
  s.homepage    = 'http://klappy.github.com/gpio'
  s.summary     = "A rubygem for communicating with Linux GPIO pins in particular Raspberry Pi's GPIO pins."
  s.description = "This gem communicates with the Pi's /sys/class/gpio/* system. Scripts which use it must be run as a user with sudo privliges."
  s.authors     = ['Christopher Klapp']
  s.email       = 'christopher@klapp.name'
  s.files       = Dir.glob("{lib,examples}/**/*") + %w(README.md changelog)
end
