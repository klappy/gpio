require 'benchmark'
require '../lib/gpio'

n = 1000

pin = 24
GPIO::Pin.new(pin: pin, mode: :in)
file = GPIO::RaspberryPi.value_path(pin)

Benchmark.bm(20) do |x|
#	x.report("shelling out") { n.times do `cat #{file}`.chomp! end }
	x.report("io.read") { n.times do IO.read(file) end }
	x.report("io.read.chomp!") { n.times do IO.read(file).chomp! end }
	x.report("io.read(file, 1)") { n.times do IO.read(file, 1) end }
	x.report("io.binread") { n.times do IO.binread(file) end }
	x.report("io.getc.rewind") { f=IO.new(IO.sysopen(file,'r'),'r'); n.times do f.getc; f.rewind end }
	x.report("file.getc.rewind") { f=File.new(file,'r'); n.times do f.getc; f.rewind end }
end

=begin
using rpi gpio
                           user     system      total        real
io.read                0.130000   0.140000   0.270000 (  0.270053)
io.read.chomp!         0.200000   0.110000   0.310000 (  0.307686)
io.read(file, 1)       0.120000   0.110000   0.230000 (  0.233060)
io.binread             0.200000   0.120000   0.320000 (  0.318080)
io.getc.rewind         0.040000   0.010000   0.050000 (  0.054566)
file.getc.rewind       0.020000   0.010000   0.030000 (  0.036535)
=end
