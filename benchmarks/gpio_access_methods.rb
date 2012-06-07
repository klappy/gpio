require 'benchmark'

n = 100
file = './gpioN'

Benchmark.bm do |x|
	puts "shelling out"
	x.report { n.times do `sudo bash -c "echo 1 > #{file}"`.chomp! end }
	puts "io.read"
	x.report { n.times do IO.read(file) end }
	puts "io.read.chomp!"
	x.report { n.times do IO.read(file).chomp! end }
	puts "io.read(file, 1)"
	x.report { n.times do IO.read(file, 1) end }
	puts "io.binread"
	x.report { n.times do IO.binread(file) end }
end

=begin
#run on Raspberry Pi
       user     system      total        real
shelling out
   0.070000   0.180000   5.250000 (  8.334373)
io.read
   0.010000   0.010000   0.020000 (  0.021178)
io.read.chomp!
   0.020000   0.000000   0.020000 (  0.021982)
io.read(file, 1)
   0.010000   0.010000   0.020000 (  0.015710)
io.binread
   0.030000   0.000000   0.030000 (  0.025154)
=end