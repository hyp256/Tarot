LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := cocos2dlua_shared

LOCAL_MODULE_FILENAME := libcocos2dlua

LOCAL_SRC_FILES := ../../Classes/AppDelegate.cpp \
../../Classes/ide-support/SimpleConfigParser.cpp \
../../Classes/ide-support/RuntimeLuaImpl.cpp \
../../Classes/ide-support/lua_debugger.c \
hellolua/main.cpp \
../../Classes/PluginIAPLua.cpp \
../../Classes/PluginIAPLuaHelper.cpp \
../../Classes/PluginLeaderboardLua.cpp \
../../Classes/PluginLeaderboardLuaHelper.cpp \
../../Classes/PluginAchievementLua.cpp \
../../Classes/PluginAchievementLuaHelper.cpp \
../../Classes/PluginSdkboxAdsLua.hpp \
../../Classes/PluginSdkboxAdsLua.cpp \
../../Classes/PluginSdkboxAdsLuaHelper.cpp \
../../Classes/PluginSdkboxAdsLuaHelper.h \
../../Classes/SDKBoxLuaHelper.cpp \
../../Classes/SDKBoxLuaHelper.h \
../../Classes/PluginAdMobLua.cpp \
../../Classes/PluginAdMobLuaHelper.cpp \
../../Classes/PluginAdColonyLua.cpp \
../../Classes/PluginAdcolonyLuaHelper.cpp \
../../Classes/PluginInMobiLua.cpp \
../../Classes/PluginInMobiLuaHelper.cpp \
../../Classes/PluginLeadBoltLua.cpp \
../../Classes/PluginLeadBoltLuaHelper.cpp
#../../Classes/anysdk_manual_bindings.cpp
#../../Classes/anysdkbindings.cpp

LOCAL_CPPFLAGS := -DSDKBOX_ENABLED
LOCAL_LDLIBS := -landroid \
-llog
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../Classes
#LOCAL_SHARED_LIBRARIES := libadcolonyso \
#libjsso
LOCAL_WHOLE_STATIC_LIBRARIES := PluginIAP \
sdkbox \
android_native_app_glue \
PluginLeaderboard \
PluginAchievement \
PluginProtocolStatic \
PluginSdkboxAds \
PluginAdMob \
PluginAdColony \
PluginInMobi \
PluginLeadBolt 

# _COCOS_HEADER_ANDROID_BEGIN
# _COCOS_HEADER_ANDROID_END

LOCAL_STATIC_LIBRARIES := cocos2d_lua_static
LOCAL_STATIC_LIBRARIES += cocos2d_simulator_static

# _COCOS_LIB_ANDROID_BEGIN
# _COCOS_LIB_ANDROID_END

include $(BUILD_SHARED_LIBRARY)
$(call import-add-path, $(LOCAL_PATH))

$(call import-module,scripting/lua-bindings/proj.android/prebuilt-mk)
$(call import-module,tools/simulator/libsimulator/proj.android/prebuilt-mk)
$(call import-module, ./sdkbox)
$(call import-module, ./pluginiap)
$(call import-module, ./pluginleaderboard)
$(call import-module, ./pluginachievement)
$(call import-module,../protocols/android)
$(call import-module, ./pluginsdkboxads)
$(call import-module, ./pluginadmob)
$(call import-module, ./pluginadcolony)
$(call import-module, ./plugininmobi)
$(call import-module, ./pluginleadbolt)

# _COCOS_LIB_IMPORT_ANDROID_BEGIN
# _COCOS_LIB_IMPORT_ANDROID_END
