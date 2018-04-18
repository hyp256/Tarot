cclog("WelcomeUI==========================================================")
--UI类,继承自ViewBase,是一个node类型的类
--Create root
local WelcomeUI = class("WelcomeUI", cc.load("mvc").ViewBase, function()
    root = cc.Node:create()
    root:setName("uiRoot")
    return root
end)


local function initUI()
--Create Cocos Studio UI
    local function createCocosStudioUI()
        -- using for layout to decrease count of local variables
        local layout = nil
        local localLuaFile = nil
        local innerCSD = nil
        local innerProject = nil
        local localFrame = nil

        --Create backGround
        local backGround = ccui.Layout:create()
        backGround:ignoreContentAdaptWithSize(false)
        backGround:setBackGroundImage("Photos/TAROTWELCOME.png",0)
        backGround:setClippingEnabled(false)
        backGround:setBackGroundColorType(1)
        backGround:setBackGroundColor({r = 0, g = 0, b = 0})
        backGround:setTouchEnabled(true);
        backGround:setLayoutComponentEnabled(true)
        backGround:setName("backGround")
        backGround:setTag(6)
        backGround:setCascadeColorEnabled(true)
        backGround:setCascadeOpacityEnabled(true)
        backGround:setAnchorPoint(0.5000, 0.5000)
        backGround:setPosition(480.0000, 320.0000)
        layout = ccui.LayoutComponent:bindLayoutComponent(backGround)
        layout:setPositionPercentXEnabled(true)
        layout:setPositionPercentYEnabled(true)
        layout:setPositionPercentX(0.5000)
        layout:setPositionPercentY(0.5000)
        layout:setPercentWidthEnabled(true)
        layout:setPercentHeightEnabled(true)
        layout:setPercentWidth(0.6250)
        layout:setPercentHeight(1.0000)
        layout:setSize({width = 600.0000, height = 640.0000})
        layout:setLeftMargin(180.0000)
        layout:setRightMargin(180.0000)
        root:addChild(backGround,UI_LAYERZORDER_BACKGROUND)

        --Create label_Aside
        local label_Aside = ccui.Text:create()
        label_Aside:ignoreContentAdaptWithSize(true)
        label_Aside:setTextAreaSize({width = 0, height = 0})
        label_Aside:setFontName("fonts/STHUPO.TTF")
        label_Aside:setFontSize(60)
        label_Aside:setString(Aside_Welcome["Aside_Welcome"])
        label_Aside:setTextHorizontalAlignment(1)
        label_Aside:setTextVerticalAlignment(1)
        label_Aside:setLayoutComponentEnabled(true)
        label_Aside:setName("label_Aside")
        label_Aside:setTag(7)
        label_Aside:setCascadeColorEnabled(true)
        label_Aside:setCascadeOpacityEnabled(true)
        label_Aside:setPosition(300.0000, 70.4000)
        layout = ccui.LayoutComponent:bindLayoutComponent(label_Aside)
        layout:setPositionPercentXEnabled(true)
        layout:setPositionPercentYEnabled(true)
        layout:setPositionPercentX(0.5000)
        layout:setPositionPercentY(0.1100)
        layout:setPercentWidth(0.9767)
        layout:setPercentHeight(0.0969)
        layout:setSize({width = 586.0000, height = 62.0000})
        layout:setLeftMargin(7.0000)
        layout:setRightMargin(7.0000)
        layout:setTopMargin(538.6000)
        layout:setBottomMargin(39.4000)
        backGround:addChild(label_Aside)

        local Daley = cc.DelayTime:create(2.0)
        local Hide = cc.Hide:create()
        local Show = cc.Show:create()
        local Sequence = cc.Sequence:create(Show, Daley, Hide, Daley)
        local Action = cc.RepeatForever:create(Sequence)
        label_Aside:runAction(Action)
    end

--退出APP button
    function exitMenuLayer()
        local function ExitApp()
            local targetPlatform = cc.Application:getInstance():getTargetPlatform()
            if cc.PLATFORM_OS_WINDOWS == targetPlatform then
                cclog("You pressed the close button. Windows Store Apps do not implement a close button.")
                return
            end

            cc.Director:getInstance():endToLua()

            if (cc.PLATFORM_OS_IPHONE == targetPlatform) or (cc.PLATFORM_OS_IPAD == targetPlatform) or (cc.PLATFORM_OS_MAC == targetPlatform) then
                exit(0)
            end

            cclog("app quit")

        end

        local ExitItem = cc.MenuItemImage:create("Photos/Button/CloseNormal.png", "Photos/Button/CloseSelected.png")
        ExitItem:setPosition(ORIGIN.x + WIN_SIZE.width - ExitItem:getContentSize().width/2, ORIGIN.y + ExitItem:getContentSize().height/2)
        ExitItem:registerScriptTapHandler(ExitApp)
        local Menu = cc.Menu:create(ExitItem)
        Menu:setPosition(0,0)
        Menu:addTo(root,UI_LAYERZORDER_MENU)

    end

--init
    createCocosStudioUI()
    exitMenuLayer()
end

--构造函数,在create中执行
function WelcomeUI:ctor()
cclog("WelcomeUI==========================================================hhhhhhhhh")
        initUI()
end

cclog("WelcomeUI==========================================================")
return WelcomeUI

