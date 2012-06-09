module GPIO
	module Other
		extend Device

		VALIDATE_FILE = "/sys/class/gpio/gpiochip0/label"
		VALIDATE_VALUE = "chipset_gpio"

		MAPPING = :hardware
		HARDWARE_PINS = [0,1,2]
		SOFTWARE_PINS = [2,1,0]
		BASE_PATH = '/sys/class/gpio/'
		EXPORT_PATH = "#{BASE_PATH}export"
		UNEXPORT_PATH = "#{BASE_PATH}unexport"
		PIN_PREFIX = "gpio"
		DIRECTION_FILE = "mode"
		VALUE_FILE = "value"
	end
end
