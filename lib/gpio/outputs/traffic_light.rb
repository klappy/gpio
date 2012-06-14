module GPIO
	class TrafficLight
		attr_reader :red, :yellow, :green, :state
		def initialize(params)
			@red = GPIO::Led.new(pin: params[:red_pin])
			@yellow = GPIO::Led.new(pin: params[:yellow_pin])
			@green = GPIO::Led.new(pin: params[:green_pin])
			eval (params[:state] ? params[:state].to_s : 'power_outage')
		end

		def stop
			yellow.off
			green.off
			red.on
			@state == :stop
		end
		def warn
			green.off
			red.off
			yellow.on
			@state == :warn
		end
		def go
			red.off
			yellow.off
			green.on
			@state == :go
		end

		def turn
			case @state
			when :go; warn
			when :warn; stop
			when :stop; go
			end
			def cycle(iterations=1, durations={})
				iterations.times do
					go and sleep durations[:go] || 3
					warn and sleep durations[:warn] || 1
					stop and sleep durations[:stop] || 2
				end
			end

			def power_outage
				red.off
				yellow.off
				green.off
				@state = :power_outage
			end
			def all(state=:off)
				red.send(state)
				yellow.send(state)
				green.send(state)
			end
			def power_restore(iterations=1)
				iterations.times do
					all :on
					sleep 1
					all :off
					sleep 1
					@state = :power_restore
				end
			end
		end
	end
end