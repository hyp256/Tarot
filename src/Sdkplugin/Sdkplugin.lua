local Sdkplugin = class("Sdkplugin")
cc.FileUtils:getInstance():addSearchPath("src/Sdkplugin")

-- CC_USE_DEPRECATED_API = true
require "cocos.init"
require "anysdkConst"
require "Ads"
require "Analytics"
require "Push"
require "Share"
require "Social"
require "REC"
require "Custom"
require "Crash"
require "PluginChannel"

function Sdkplugin:ctor()
    plugin_channel = PluginChannel.new()
    _ads = Ads.new()
    _social =  Social.new()
    _share =  Share.new()
    _push =  Push.new()
    _analytics =  Analytics.new()
    _crash = Crash.new()
    _rec =  REC.new()
    _custom =  Custom.new()

    BASE_LEVEL = 100
    USER_LEVEL = 200
    IAP_LEVEL = 300
    SHARE_LEVEL = 400
    ADS_LEVEL = 500
    SOCIAL_LEVEL = 600
    PUSH_LEVEL = 700
    ANALYTICS_LEVEL = 800
    CRASH_LEVEL = 900
    REC_LEVEL = 1000

    --函数索引
    user_menu = {
        "LOGIN",
        "LOGOUT",
        "ENTER_PLATFORM",
        "SHOW_TOOLBAR",
        "HIDE_TOOLBAR",
        "ACCOUNTSWITCH_PAY",
        "REALNAME_REGISTER",
        "ANTI_ADDICTION_QUERY",
        "SUBMIT_LOGIN_GAMEROLE",
    }

    iap_menu = {"PAY"}

    share_menu = {"SHARE"}

    ads_menu = {
        "PRELOAD_ADS",
        "SHOW_ADS", 
        "HIDE_ADS",
        "QUERY_POINTS",
        "SPEND_POINTS"
    }

    social_menu = {
        "SUBMIT_SCORE", 
        "SHOW_LEADERBOARD", 
        "UNLOCK_ACHIEVEMENT", 
        "SHOW_ACHIEVEMENT"
    }

    push_menu = {
        "START_PUSH", 
        "CLOSE_PUSH", 
        "SET_ALIAS", 
        "DEL_ALIAS", 
        "SET_TAGS", 
        "DEL_TAGS"
    }

    analytics_menu = {
        "START_SESSION", 
        "STOP_SESSION", 
        "LOG_ERROR", 
        "LOG_EVENT", 
        "SET_ACCOUNT",
        "ON_CHARGE_REQUEST",
        "ON_CHARGE_SUCCESS",
        "ON_CHARGE_ONLY_SUCCESS",
        "ON_CHARGE_FAIL"
    }

    crash_menu = {
        "SET_USER_IDENTIFIER",
        "REPORT_EXCEPTION",
        "LEAVE_BREAD_CRUMB"
    }

    rec_menu = {
        "START_RECORDING",
        "STOP_RECORDING",
        "SHARE",
        "PAUSE_RECORDING",
        "RESUME_RECORDING",
        "SHOW_TOOL_BAR",
        "HIDE_TOOL_BAR",
        "SHOW_VIDEO_CENTER",
        "ENTER_PLATFORM",
        "SET_META_DATA"
    }

    user_menu = CreatEnumTable(user_menu, 100)
    iap_menu = CreatEnumTable(iap_menu,200)
    share_menu = CreatEnumTable(share_menu,300)
    ads_menu = CreatEnumTable(ads_menu, 400)
    social_menu = CreatEnumTable(social_menu,500)
    push_menu = CreatEnumTable(push_menu,600)
    analytics_menu = CreatEnumTable(analytics_menu, 700)
    crash_menu = CreatEnumTable(crash_menu,800)
    rec_menu = CreatEnumTable(rec_menu,900)

    --SYS索引
    base = {
        USER_SYS = user_menu,
        IAP_SYS = iap_menu,
        SHARE_SYS = share_menu,
        ADS_SYS = ads_menu,
        SOCIAL_SYS = social_menu,
        PUSH_SYS = push_menu,
        ANALYTICS_SYS = analytics_menu,
        CRASH_SYS = crash_menu,
        REC_SYS = rec_menu
    }
end

function CreatEnumTable(tbl, index) 
    local enumtbl = {} 
    local enumindex = index or 0 
    for i, v in ipairs(tbl) do 
        enumtbl[v] = enumindex + i - 1
    end 
    return enumtbl 
end

--获取接口item
function Sdkplugin:getItem(sys,item)
    for k,v in pairs(base) do
        if k == sys then
            for i,j in pairs(v) do
                if i == item then
                    return j
                end
            end
        end
    end
end

--调用接口
function Sdkplugin:menuCallback(item)

    cclog("on click:%d", item)

    if item < USER_LEVEL then
        cclog("on clicked user.")
        if item == user_menu.LOGIN then
            plugin_channel:login()
        elseif item == user_menu.LOGOUT then
            plugin_channel:logout()
        elseif item == user_menu.ENTER_PLATFORM then
            plugin_channel:enterPlatform()
        elseif item == user_menu.SHOW_TOOLBAR then
            plugin_channel:showToolBar()
        elseif item == user_menu.HIDE_TOOLBAR then
            plugin_channel:hideToolBar()
        elseif item == user_menu.ACCOUNTSWITCH_PAY then
            plugin_channel:accountSwitch()
        elseif item == user_menu.REALNAME_REGISTER then
            plugin_channel:realNameRegister()
        elseif item == user_menu.ANTI_ADDICTION_QUERY then
            plugin_channel:antiAddictionQuery()
        elseif item == user_menu.SUBMIT_LOGIN_GAMEROLE then
            plugin_channel:submitLoginGameRole()
        end
    elseif item < IAP_LEVEL then
        cclog("on clicked pay.")
        if item == iap_menu.PAY then
            plugin_channel:pay();
        end
    elseif item < SHARE_LEVEL then
        cclog("on clicked share.")
        if item == share_menu.SHARE then
            _share:share()
        end
    elseif item < ADS_LEVEL then
        cclog("on clicked ads.")
        if item == ads_menu.PRELOAD_ADS then
            _ads:preloadAds(AdsType.AD_TYPE_FULLSCREEN)
        elseif item == ads_menu.SHOW_ADS then
            _ads:showAds(AdsType.AD_TYPE_FULLSCREEN)
        elseif item == ads_menu.HIDE_ADS then
            _ads:hideAds(AdsType.AD_TYPE_FULLSCREEN)
        elseif item == ads_menu.QUERY_POINTS then
            _ads:queryPoints()
        elseif item == ads_menu.SPEND_POINTS then
            _ads:spendPoints(100)
        end
    elseif item < SOCIAL_LEVEL then
        cclog("on clicked social.")
        if item == social_menu.SUBMIT_SCORE then
            _social:submitScore()
        elseif item == social_menu.SHOW_LEADERBOARD then
            _social:showLeaderboard();
        elseif item == social_menu.UNLOCK_ACHIEVEMENT then
            _social:unlockAchievement()
        elseif item == social_menu.SHOW_ACHIEVEMENT then
            _social:showAchievements()
        end
    elseif item < PUSH_LEVEL then
        cclog("on clicked push.")
        if item == push_menu.START_PUSH then
            _push:startPush()
        elseif item == push_menu.CLOSE_PUSH then
            _push:closePush()
        elseif item == push_menu.SET_ALIAS then
            _push:setAlias()
        elseif item == push_menu.DEL_ALIAS then
            _push:delAlias()
        elseif item == push_menu.SET_TAGS then
            _push:setTags()
        elseif item == push_menu.DEL_TAGS then
            _push:delTags()
        end
    elseif item < ANALYTICS_LEVEL then
        cclog("on clicked analytics.")
        if item == analytics_menu.START_SESSION then
            _analytics:startSession()
        elseif item == analytics_menu.STOP_SESSION then
            _analytics:stopSession()
        elseif item == analytics_menu.LOG_ERROR then
            _analytics:logError(1, "fail")
        elseif item == analytics_menu.LOG_EVENT then
            _analytics:logEvent(2, {key1 = "value1", key2 = "value2"})
        elseif item == analytics_menu.SET_ACCOUNT then
            _analytics:setAccount()
        elseif item == analytics_menu.ON_CHARGE_REQUEST then
            _analytics:onChargeRequest()
        elseif item == analytics_menu.ON_CHARGE_SUCCESS then
            _analytics:onChargeSuccess()
        elseif item == analytics_menu.ON_CHARGE_ONLY_SUCCESS then
            _analytics:onChargeOnlySuccess()
        elseif item == analytics_menu.ON_CHARGE_FAIL then
            _analytics:onChargeFail()
        end
    elseif item < CRASH_LEVEL then
        cclog("on clicked crash.")
        if item == crash_menu.SET_USER_IDENTIFIER then
            _crash:setUserIdentifier("AnySDK")
        elseif item == crash_menu.REPORT_EXCEPTION then
            _crash:reportException("ERROR","MESSAGE")
        elseif item == crash_menu.LEAVE_BREAD_CRUMB then
            _crash:leaveBreadcrumb("TEST")
        end
    elseif item < REC_LEVEL then
        cclog("on clicked rec.")
        if item == rec_menu.START_RECORDING then
            _rec:isAvailable()
            _rec:startRecording()
        elseif item == rec_menu.STOP_RECORDING then
            _rec:isRecording()
            _rec:stopRecording()
        elseif item == rec_menu.SHARE then
            _rec:share()
        elseif item == rec_menu.PAUSE_RECORDING then
            _rec:pauseRecording()
        elseif item == rec_menu.RESUME_RECORDING then
            _rec:resumeRecording()
        elseif item == rec_menu.SHOW_TOOL_BAR then
            _rec:showToolBar()
        elseif item == rec_menu.HIDE_TOOL_BAR then
            _rec:hideToolBar()
        elseif item == rec_menu.SHOW_VIDEO_CENTER then
            _rec:showVideoCenter()
        elseif item == rec_menu.ENTER_PLATFORM then
            _rec:enterPlatform()
        elseif item == rec_menu.SET_META_DATA then
            _rec:setMetaData()
        end
    end
end

return Sdkplugin
