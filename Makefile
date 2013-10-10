GO_EASY_ON_ME = 1

include theos/makefiles/common.mk
export ARCHS = armv7
TWEAK_NAME = CamVolNormal
CamVolNormal_FILES = CamVolNormal.xm

include $(THEOS_MAKE_PATH)/tweak.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp -R CVN $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/CVN$(ECHO_END)
	$(ECHO_NOTHING)find $(THEOS_STAGING_DIR) -name .DS_Store | xargs rm -rf$(ECHO_END)