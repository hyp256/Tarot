#APP_ABI := armeabi

APP_ALLOW_MISSING_DEPS := true

#NDK_TOOLCHAIN_VERSION := arm-linux-androideabi-4.9

APP_STL := gnustl_static
#APP_STL := c++_static

APP_CPPFLAGS := -frtti -DCC_ENABLE_CHIPMUNK_INTEGRATION=1 -std=c++11 -fsigned-char
APP_LDFLAGS := -latomic


ifeq ($(NDK_DEBUG),1)
  APP_CPPFLAGS += -DCOCOS2D_DEBUG=1
  APP_OPTIM := debug
else
  APP_CPPFLAGS += -DNDEBUG
  APP_OPTIM := release
endif
