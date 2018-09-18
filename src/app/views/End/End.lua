cclog("End==========================================================")

--������,�̳���ViewBaseʵ����һ��Sence
local End = class("End", cc.load("mvc").ViewBase)

--����playphone��
--local PlayphoneScene = require "End/PlayphoneScene"

--����AdScene��
local AdScene = require "End/AdScene"

--����UI��,�̳̽�����import,��requireһ��
local EndUI = require "End/EndUI"

--onCreate��cocos��create()ԭ��һ�������쳡������
function End:onCreate()
-- create UI,��node��������ֱ����create()����������Ϊnode
    local UI = EndUI:create()
    UI:addTo(self)

    --local Playphone = PlayphoneScene:create()
    --Playphone:addTo(self)

    local Ad = AdScene:create()
    Ad:addTo(self)

    --banner���
    --print("play placement-banner")
    --sdkbox.PluginSdkboxAds:placement("placement-banner")

    -- create Menu
    function End:regMenuItem()
        local function ReplaceToAnswer1Scene(ref,type)
            if type == ccui.TouchEventType.ended then
                --�ؿ����
                print("play placement-interstitial")
                sdkbox.PluginSdkboxAds:placement("placement-interstitial")
                --sdkbox.PluginSdkboxAds:hide("placement-banner")

                self:getApp():enterScene("Answer/Answer1")
            end
        end

        local function ReplaceToBeginScene(ref,type)
            if type == ccui.TouchEventType.ended then
                --������
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

