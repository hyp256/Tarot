cclog("Begin==========================================================")

local Begin = class("Begin", cc.load("mvc").ViewBase)

--����UI��,�̳̽�����import,��requireһ��
local BeginUI = require "Begin/BeginUI"

--onCreate��cocos��create()ԭ��һ�������쳡������
function Begin:onCreate()
-- create UI,��node��������ֱ����create()����������Ϊnode
    local UI = BeginUI:create()
    UI:addTo(self)


function Begin:regDivineMenu()
--------------------------------------------------------------------------------------------------------------------------------------------------------------
        --[[ռ������ѡ��,���л�����
        ȫ�ֱ���:
                 DIVINE:������������
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
