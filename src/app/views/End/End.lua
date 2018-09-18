cclog("End==========================================================")

--创建类,继承自ViewBase实质是一个Sence
local End = class("End", cc.load("mvc").ViewBase)

--加载playphone类
--local PlayphoneScene = require "End/PlayphoneScene"

--加载AdScene类
local AdScene = require "End/AdScene"

--加载UI类,教程建议用import,用require一样
local EndUI = require "End/EndUI"

--onCreate和cocos中create()原理一样，构造场景对象
function End:onCreate()
-- create UI,是node类型所以直接用create()方法创建成为node
    local UI = EndUI:create()
    UI:addTo(self)

    --local Playphone = PlayphoneScene:create()
    --Playphone:addTo(self)

    local Ad = AdScene:create()
    Ad:addTo(self)

    --banner广告
    --print("play placement-banner")
    --sdkbox.PluginSdkboxAds:placement("placement-banner")

    -- create Menu
    function End:regMenuItem()
        local function ReplaceToAnswer1Scene(ref,type)
            if type == ccui.TouchEventType.ended then
                --重看广告
                print("play placement-interstitial")
                sdkbox.PluginSdkboxAds:placement("placement-interstitial")
                --sdkbox.PluginSdkboxAds:hide("placement-banner")

                self:getApp():enterScene("Answer/Answer1")
            end
        end

        local function ReplaceToBeginScene(ref,type)
            if type == ccui.TouchEventType.ended then
                --重玩广告
                print("play placement-reward")
                sdkbox.PluginSdkboxAds:placement("placement-reward")
                --sdkbox.PluginSdkboxAds:hide("placement-banner")

                self:getApp():enterScene("Begin/Begin")
            end
        end


        local function ReplaceToPlayphoneScene()
            package.loaded["End/PlayphoneScene"]  = nil
            --self:getApp():enterScene("End/PlayphoneScene")
        end

        local function PlayphoneScene(ref, type)
            if type == ccui.TouchEventType.ended then
                print("play placement-interstitial")
                --sdkbox.PluginSdkboxAds:placement("placement-interstitial")
                --sdkbox.PluginSdkboxAds:hide("placement-banner")

                ReplaceToPlayphoneScene()
            end
        end

        UI:getMenuItem("backToAnswer1Item"):addTouchEventListener(ReplaceToAnswer1Scene)    
        UI:getMenuItem("backToBeginItem"):addTouchEventListener(ReplaceToBeginScene)

        UI:getMenuItem("shareItem"):addTouchEventListener(PlayphoneScene)
    end

    self:regMenuItem()
end

cclog("End==========================================================")
return End

