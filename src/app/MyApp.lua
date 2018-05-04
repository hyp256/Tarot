cc.FileUtils:getInstance():addSearchPath("src/app/views/")
cc.FileUtils:getInstance():addSearchPath("src/app/models/")

local MyApp = class("MyApp", cc.load("mvc").AppBase)
require "AppMacros"
require "Word/UiWord"
require "Word/AsideWord"

function MyApp:onCreate()
    math.randomseed(os.time())
    AppMacros()
    AsideWord()
    UiWord()
    
    -- play background music, preload effect
	if audio.isMusicPlaying() ~= true then
       local bgMusicPath = cc.FileUtils:getInstance():fullPathForFilename("background.mp3")
       audio.preloadMusic(bgMusicPath)
       audio.playMusic(bgMusicPath, true)
    end

    --≥ı ºªØAnySdk
    local targetPlatform = cc.Application:getInstance():getTargetPlatform()
    if (cc.PLATFORM_OS_ANDROID == targetPlatform) then
    --º”‘ÿSdkplugin
        Sdkplugin = require "AnySdkplugin/Sdkplugin"
        Sdkplugin.new()
    end
end

return MyApp
