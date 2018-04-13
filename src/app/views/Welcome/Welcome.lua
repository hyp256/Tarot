cclog("Welcome==========================================================")

--����Welcome��,�̳���ViewBaseʵ����һ��Sence
local Welcome = class("Welcome", cc.load("mvc").ViewBase)

--����UI��,�̳̽�����import,��requireһ��
local WelcomeUI = require "Welcome/WelcomeUI"
--local WelcomeUI = import(".Welcome.WelcomeUI")

--onCreate��cocos��create()ԭ��һ�������쳡������
function Welcome:onCreate()
-- create UI,��node��������ֱ����create()����������Ϊnode
    local UI = WelcomeUI:create()
    UI:addTo(self)



-- create WelcomeTouchLayer
    local function createWelcomeTouchLayer()
        local WelcomeTouchLayer = cc.Layer:create()
        local EventDispatcher = WelcomeTouchLayer:getEventDispatcher()

        local function ReplaceToBeginScene()
            self:getApp():enterScene("Begin/Begin")
        end

        local function onTouchBegan(touch, event)
            ReplaceToBeginScene()
        end

        local function onTouchMoved(touch, event)

        end

        local function onTouchEnded(touch, event)

        end

        local Listener = cc.EventListenerTouchOneByOne:create()
        Listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
        Listener:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCH_MOVED )
        Listener:registerScriptHandler(onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED )
        Listener:setSwallowTouches(true)
        EventDispatcher:addEventListenerWithSceneGraphPriority(Listener, WelcomeTouchLayer)

        WelcomeTouchLayer:addTo(UI,UI_LAYERZORDER_MID)
    end

    createWelcomeTouchLayer()
end

cclog("Welcome==========================================================")
return Welcome
