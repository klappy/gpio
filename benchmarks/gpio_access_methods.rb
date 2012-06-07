require 'benchmark'
require '../lib/gpio'

n = 1000

pin = 24
GPIO::Pin.new(pin: pin, mode: :in)
file = GPIO::RaspberryPi.value_path(pin)

Benchmark.bm(20) do |x|
#	x.report("shelling out") { n.times do `sudo bash -c "echo 1 > #{file}"`.chomp! end }
	x.report("io.read") { n.times do IO.read(file) end }
	x.report("io.read.chomp!") { n.times do IO.read(file).chomp! end }
	x.report("io.read(file, 1)") { n.times do IO.read(file, 1) end }
	x.report("io.binread") { n.times do IO.binread(file) end }
	x.report("file.getc.seek") { f=File.new(file); n.times do f.getc; f.seek(0) end }
	x.report("file.getc.rewind") { f=File.new(file); n.times do f.getc; f.rewind end }
	x.report("") {  }
end

=begin
using file system
                           user     system      total        real
io.read                0.180000   0.040000   0.220000 (  0.223272)
io.read.chomp!         0.170000   0.050000   0.220000 (  0.218061)
io.read(file, 1)       0.100000   0.050000   0.150000 (  0.148483)
io.binread             0.170000   0.070000   0.240000 (  0.246873)
file.getc.seek         0.020000   0.020000   0.040000 (  0.039365)
file.getc.rewind       0.030000   0.000000   0.030000 (  0.035750)

using real gpio
                           user     system      total        real
io.read                0.120000   0.160000   0.280000 (  0.281065)
io.read.chomp!         0.180000   0.120000   0.300000 (  0.303142)
io.read(file, 1)       0.130000   0.100000   0.230000 (  0.230991)
io.binread             0.190000   0.120000   0.310000 (  0.311984)
file.getc.seek         0.040000   0.000000   0.040000 (  0.040326)
file.getc.rewind       0.010000   0.020000   0.030000 (  0.036476)
=end
