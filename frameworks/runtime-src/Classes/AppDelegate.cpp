#include "AppDelegate.h"
#include "CCLuaEngine.h"
#include "SimpleAudioEngine.h"
#include "cocos2d.h"
#ifdef SDKBOX_ENABLED
#include "PluginSdkboxAdsLua.hpp"
#include "PluginSdkboxAdsLuaHelper.h"
#endif
#include "lua_module_register.h"

#if (CC_TARGET_PLATFORM != CC_PLATFORM_LINUX)
#include "ide-support/CodeIDESupport.h"
#endif

#if (COCOS2D_DEBUG > 0) //&& (CC_CODE_IDE_DEBUG_SUPPORT > 0)
#include "runtime/Runtime.h"
#include "ide-support/RuntimeLuaImpl.h"
//playphone
#ifdef SDKBOX_ENABLED
#include "PluginAchievementLua.hpp"
#include "PluginAchievementLuaHelper.h"
#endif
#ifdef SDKBOX_ENABLED
#include "PluginLeaderboardLua.hpp"
#include "PluginLeaderboardLuaHelper.h"
#endif
#ifdef SDKBOX_ENABLED
#include "PluginIAPLua.hpp"
#include "PluginIAPLuaHelper.h"
#endif
//LeadBolt
#ifdef SDKBOX_ENABLED
#include "PluginLeadBoltLua.hpp"
#include "PluginLeadBoltLuaHelper.h"
#endif
#endif

using namespace CocosDenshion;

USING_NS_CC;
using namespace std;

AppDelegate::AppDelegate()
{
}

AppDelegate::~AppDelegate()
{
    SimpleAudioEngine::end();

#if (COCOS2D_DEBUG > 0) && (CC_CODE_IDE_DEBUG_SUPPORT > 0)
    // NOTE:Please don't remove this call if you want to debug with Cocos Code IDE
    RuntimeEngine::getInstance()->end();
#endif

}

//if you want a different context,just modify the value of glContextAttrs
//it will takes effect on all platforms
void AppDelegate::initGLContextAttrs()
{
    //set OpenGL context attributions,now can only set six attributions:
    //red,green,blue,alpha,depth,stencil
    GLContextAttrs glContextAttrs = {8, 8, 8, 8, 24, 8};

    GLView::setGLContextAttrs(glContextAttrs);
}

// If you want to use packages manager to install more packages,
// don't modify or remove this function
static int register_all_packages()
{
//playphone
#ifdef SDKBOX_ENABLED
    register_all_PluginAchievementLua(LuaEngine::getInstance()->getLuaStack()->getLuaState());
    register_all_PluginAchievementLua_helper(LuaEngine::getInstance()->getLuaStack()->getLuaState());
#endif
#ifdef SDKBOX_ENABLED
    register_all_PluginLeaderboardLua(LuaEngine::getInstance()->getLuaStack()->getLuaState());
    register_all_PluginLeaderboardLua_helper(LuaEngine::getInstance()->getLuaStack()->getLuaState());
#endif
#ifdef SDKBOX_ENABLED
    register_all_PluginIAPLua(LuaEngine::getInstance()->getLuaStack()->getLuaState());
    register_all_PluginIAPLua_helper(LuaEngine::getInstance()->getLuaStack()->getLuaState());
#endif

#ifdef SDKBOX_ENABLED
    register_all_PluginSdkboxAdsLua(LuaEngine::getInstance()->getLuaStack()->getLuaState());
    register_all_PluginSdkboxAdsLua_helper(LuaEngine::getInstance()->getLuaStack()->getLuaState());
#endif
//LeadBolt
#ifdef SDKBOX_ENABLED
    register_all_PluginLeadBoltLua(LuaEngine::getInstance()->getLuaStack()->getLuaState());
    register_all_PluginLeadBoltLua_helper(LuaEngine::getInstance()->getLuaStack()->getLuaState());
#endif

    return 0; //flag for packages manager
}

bool AppDelegate::applicationDidFinishLaunching()
{
    // set default FPS
    Director::getInstance()->setAnimationInterval(1.0 / 60.0f);

    // register lua module
    auto engine = LuaEngine::getInstance();
    ScriptEngineManager::getInstance()->setScriptEngine(engine);
    lua_State* L = engine->getLuaStack()->getLuaState();
    lua_module_register(L);
    //__android_log_print(ANDROID_LOG_DEBUG  , "AppDelegate.cpp", "===============================1");
    register_all_packages();
    //__android_log_print(ANDROID_LOG_DEBUG  , "AppDelegate.cpp", "===============================2");
    LuaStack* stack = engine->getLuaStack();
    stack->setXXTEAKeyAndSign("2dxLua", strlen("2dxLua"), "XXTEA", strlen("XXTEA"));

    //register custom function
    //LuaStack* stack = engine->getLuaStack();
    //register_custom_function(stack->getLuaState());

#if (COCOS2D_DEBUG > 0) && (CC_CODE_IDE_DEBUG_SUPPORT > 0)
    // NOTE:Please don't remove this call if you want to debug with Cocos Code IDE
    auto runtimeEngine = RuntimeEngine::getInstance();
    runtimeEngine->addRuntime(RuntimeLuaImpl::create(), kRuntimeEngineLua);
    runtimeEngine->start();
#else
    if (engine->executeScriptFile("src/main.lua"))
    {
        return false;
    }
#endif

    return true;
}

// This function will be called when the app is inactive. When comes a phone call,it's be invoked too
void AppDelegate::applicationDidEnterBackground()
{
    Director::getInstance()->stopAnimation();

    SimpleAudioEngine::getInstance()->pauseBackgroundMusic();
}

// this function will be called when the app is active again
void AppDelegate::applicationWillEnterForeground()
{
    Director::getInstance()->startAnimation();

    SimpleAudioEngine::getInstance()->resumeBackgroundMusic();
}
