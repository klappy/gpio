%w[device devices/raspberry_pi pin pins/input_pin pins/output_pin sensor sensors/motion_detector].each{|file| require File.dirname(__FILE__)+'/gpio/'+file}
