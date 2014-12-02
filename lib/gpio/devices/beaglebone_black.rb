module GPIO
	module BeagleboneBlack
		extend Device

		VALIDATE_FILE = "/sys/class/gpio/gpiochip96/label"
		VALIDATE_VALUE = "chipset_gpio"

		MAPPING = :hardware
		HARDWARE_PINS = [2,3,4,5,7,14,15,20,26,27,30,31,40,44,45,46,47,48,49,51,60,61,65,66,67,68,69,117,120,121,122,123,125]
		SOFTWARE_PINS = [2,3,4,5,7,14,15,20,26,27,30,31,40,44,45,46,47,48,49,51,60,61,65,66,67,68,69,117,120,121,122,123,125]
		BASE_PATH = '/sys/class/gpio/'
		EXPORT_PATH = "#{BASE_PATH}export"
		UNEXPORT_PATH = "#{BASE_PATH}unexport"
		PIN_PREFIX = "gpio"
		DIRECTION_FILE = "direction"
		VALUE_FILE = "value"
	end
end
