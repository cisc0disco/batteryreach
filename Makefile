INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = batteryReach

batteryReach_FILES = Tweak.x
batteryReach_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
