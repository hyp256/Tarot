
cc.FileUtils:getInstance():setPopupNotify(false)
cc.FileUtils:getInstance():addSearchPath("src/")
cc.FileUtils:getInstance():addSearchPath("res/")

require "config"
require "cocos.init"


local function main()
    cclog("//////////////////////////////////////////////////")
    --support debug
    local targetPlatform = cc.Application:getInstance():getTargetPlatform()
    local strPlatform = nil
    if (cc.PLATFORM_OS_WINDOWS == targetPlatform) then
        strPlatform = "WINDOWS"
    elseif (cc.PLATFORM_OS_LINUX == targetPlatform) then
        strPlatform = "LINUX"
    elseif (cc.PLATFORM_OS_ANDROID == targetPlatform) then
        strPlatform = "ANDROID"
    elseif (cc.PLATFORM_OS_IPHONE == targetPlatform) then
        strPlatform = "IPHONE"
    elseif (cc.PLATFORM_OS_IPAD == targetPlatform) then
        strPlatform = "IPAD"
    elseif (cc.PLATFORM_OS_BLACKBERRY == targetPlatform) then
        strPlatform = "BLACKBERRY"
    elseif (cc.PLATFORM_OS_NACL == targetPlatform) then
        strPlatform = "NACL"
    elseif (cc.PLATFORM_OS_EMSCRIPTEN == targetPlatform) then
        strPlatform = "EMSCRIPTEN"
    elseif (cc.PLATFORM_OS_TIZEN == targetPlatform) then
        strPlatform = "TIZEN"
    elseif (cc.PLATFORM_OS_WINRT == targetPlatform) then
        lstrPlatform = "WINRT"
    elseif (cc.PLATFORM_OS_WP8 == targetPlatform) then
        strPlatform = "WP8"
    end
        cclog("PLATFORM_OS is "..strPlatform)
    cclog("//////////////////////////////////////////////////")
    require("app.MyApp"):create():run()
end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end

if exp then

end