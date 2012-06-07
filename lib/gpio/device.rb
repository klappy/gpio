module GPIO
	module Device
		def software_pin(pin)
			raise "That software pin #{pin} doesn't exist." unless software_pins.include? pin
			mapping == :software ? pin : software_pins[hardware_pins.index(pin)]
		end
		def hardware_pin(pin)
			raise "That hardware pin #{pin} doesn't exist." unless hardware_pins.include? pin
			mapping == :hardware ? pin : hardware_pins[software_pins.index(pin)]
		end
		def load_pins
			get_pins(:hardware).map{|pin| Pin.new(pin,get_direction(pin),self)}
		end
		def unexport_all!
			load_pins.map(&unexport!)
		end

		def get_pins(mapping)
			pins = Dir.entries base_path.select!{|pin| pin[/(?:#{pin_prefix})(\d+)/]}.to_i
			pins.map!{|pin| Pin.new(pin,nil,self).pin}
		end
		def get_direction(software_pin)
			IO.read(direction_path(software_pin)).chomp!
		end

		def initialize_pin(software_pin, direction)
			unexport!(software_pin) if exported?(software_pin) && direction != get_direction(software_pin)
			export!(software_pin, direction) unless exported?(software_pin)
		end

		def exported?(software_pin)
			Dir.exists? pin_path(software_pin)
		end
		def export!(software_pin,direction)
			path_write export_path, software_pin
			path_write direction_path(software_pin), direction
			exported?(software_pin)
		end
		def unexport!(software_pin)
			path_write unexport_path, software_pin
			!exported? software_pin
		end

		def read(software_pin)
			IO.read(value_path(software_pin), 1) == '1'
		end
		def write(software_pin,value)
			raise "This pin is an input." if get_direction(software_pin) == 'in'
			path_write value_path(software_pin), value
		end
		def path_write(path, value)
			File::Stat.writable?(path) ? IO.write(path, value) : path_write_sudo(path, value)
		end
		def path_write_sudo(path, value)
			`sudo bash -c "echo #{value} > #{path}"`.chomp!
		end
	end
end
