cclog("Welcome==========================================================")

--创建Welcome类,继承自ViewBase实质是一个Sence
local Welcome = class("Welcome", cc.load("mvc").ViewBase)

--加载UI类,教程建议用import,用require一样
local WelcomeUI = require "Welcome/WelcomeUI"
--local WelcomeUI = import(".Welcome.WelcomeUI")

--onCreate和cocos中create()原理一样，构造场景对象
function Welcome:onCreate()
-- create UI,是node类型所以直接用create()方法创建成为node
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
