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
