import RPi.GPIO as GPIO
from ButtonControl import ButtonControl


class Main:
    common_pin = 26
    relay_pins = [18, 23, 24, 25, 12, 16, 20, 21, 4, 17, 27, 22, 5, 6, 13]

    def __init__(self):
        GPIO.setmode(GPIO.BCM)
        for pin in self.relay_pins:
            GPIO.setup(pin, 1)

    def start(self):
        pass


if __name__ == '__main__':
    try:
        main = Main()
        ButtonControl(relay_pins=main.relay_pins).init_button_listener()
        main.start()
    except KeyboardInterrupt:
        GPIO.cleanup()
        exit()
