INSTALL_TARGET_PROCESSES = SpringBoard

#THEOS_DEVICE_IP = "localhost"
#THEOS_DEVICE_PORT = 2222

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = batteryReach

batteryReach_FILES = Tweak.xm
batteryReach_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
