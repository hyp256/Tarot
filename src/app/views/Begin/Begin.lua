cclog("Begin==========================================================")

local Begin = class("Begin", cc.load("mvc").ViewBase)

--加载UI类,教程建议用import,用require一样
local BeginUI = require "Begin/BeginUI"

--onCreate和cocos中create()原理一样，构造场景对象
function Begin:onCreate()
-- create UI,是node类型所以直接用create()方法创建成为node
    local UI = BeginUI:create()
    UI:addTo(self)


function Begin:regDivineMenu()
--------------------------------------------------------------------------------------------------------------------------------------------------------------
        --[[占卜问题选择,并切换场景
        全局变量:
                 DIVINE:代表问题内容
        ]]--
--------------------------------------------------------------------------------------------------------------------------------------------------------------
    local function ReplaceToShuffle1Scene()
        local targetPlatform = cc.Application:getInstance():getTargetPlatform()
        if (cc.PLATFORM_OS_ANDROID == targetPlatform) then
            --local item = Sdkplugin:getItem("ANALYTICS_SYS","START_SESSION")
            --Sdkplugin:menuCallback(item)
        end

        package.loaded["Shuffle/Shuffle1"]  = nil
        self:getApp():enterScene("Shuffle/Shuffle1")
    end

    local function DivineLife(ref, type)
        if type == ccui.TouchEventType.ended then
            DIVINE = LIFE
            ReplaceToShuffle1Scene()
        end
    end

    local function DivineEnterprise(ref, type)
        if type == ccui.TouchEventType.ended then
            DIVINE = ENTERPRISE
            ReplaceToShuffle1Scene()
        end
    end

    local function DivineLove(ref, type)
        if type == ccui.TouchEventType.ended then
            DIVINE = LOVE
            ReplaceToShuffle1Scene()
        end
    end

    UI:getMenuItem("divineLifeItem"):addTouchEventListener(DivineLife)
    UI:getMenuItem("divineEnterpriseItem"):addTouchEventListener(DivineEnterprise)
    UI:getMenuItem("divineLoveItem"):addTouchEventListener(DivineLove)
end 

    self:regDivineMenu()
end

cclog("Begin==========================================================")
return Begin
