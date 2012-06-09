%w[device devices/raspberry_pi pin pins/input_pin pins/output_pin sensor sensors/motion_detector sensors/ping_sonar].each{|file| require File.dirname(__FILE__)+'/gpio/'+file}
