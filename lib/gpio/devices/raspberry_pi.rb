module GPIO
	module RaspberryPi
		extend Device

		VALIDATE_FILE = "/sys/class/gpio/gpiochip0/label"
		VALIDATE_VALUE = "bcm2708_gpio"

		MAPPING = :hardware
		HARDWARE_PINS = [3,5,7,8,10,11,12,13,15,16,17,19,21,22,23,24,26]
		SOFTWARE_PINS = [0,1,4,14,15,17,18,21,22,23,24,10,9,25,11,8,7]
		BASE_PATH = '/sys/class/gpio/'
		EXPORT_PATH = "#{BASE_PATH}export"
		UNEXPORT_PATH = "#{BASE_PATH}unexport"
		PIN_PREFIX = "gpio"
		DIRECTION_FILE = "direction"
		VALUE_FILE = "value"
	end
end
