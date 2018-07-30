cclog("Choice==========================================================")
--UI类,继承自ViewBase,是一个node类型的类
--Create root
local ChoiceUI = class("ChoiceUI", cc.load("mvc").ViewBase, function()
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

--Create scrollView
local scrollView = ccui.ScrollView:create()
scrollView:setInnerContainerSize({width = 768, height = 192})
scrollView:ignoreContentAdaptWithSize(false)
scrollView:setClippingEnabled(false)
scrollView:setBackGroundColorType(1)
scrollView:setBackGroundColor({r = 0, g = 0, b = 0})
scrollView:setBackGroundColorOpacity(0)
scrollView:setLayoutComponentEnabled(true)
scrollView:setName("scrollView")
scrollView:setTag(13)
scrollView:setCascadeColorEnabled(true)
scrollView:setCascadeOpacityEnabled(true)
scrollView:setAnchorPoint(0.5000, 0.5000)
scrollView:setPosition(480.0000, 576.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(scrollView)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.9000)
layout:setPercentWidthEnabled(true)
layout:setPercentHeightEnabled(true)
layout:setPercentWidth(0.8000)
layout:setPercentHeight(0.2000)
layout:setSize({width = 768.0000, height = 128.0000})
layout:setLeftMargin(96.0000)
layout:setRightMargin(96.0000)
layout:setBottomMargin(512.0000)
root:addChild(scrollView)

--Create label_Aside
local label_Aside = ccui.Text:create()
label_Aside:ignoreContentAdaptWithSize(false)
label_Aside:setFontName("fonts/arial.ttf")
label_Aside:setFontSize(36)
label_Aside:setString(Aside_Choice["Aside_Choice"])
label_Aside:setLayoutComponentEnabled(true)
label_Aside:setName("label_Aside")
label_Aside:setTag(14)
label_Aside:setCascadeColorEnabled(true)
label_Aside:setCascadeOpacityEnabled(true)
label_Aside:setAnchorPoint(0.5000, 0.0000)
label_Aside:setPosition(384.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(label_Aside)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPercentWidthEnabled(true)
layout:setPercentHeightEnabled(true)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 768.0000, height = 192.0000})
scrollView:addChild(label_Aside)

--Create backGround
local backGround = ccui.Layout:create()
backGround:ignoreContentAdaptWithSize(false)
backGround:setBackGroundImage("Photos/TAROTBACKGROUND.jpg",0)
backGround:setClippingEnabled(true)
backGround:setBackGroundColorType(1)
backGround:setBackGroundColor({r = 0, g = 0, b = 0})
backGround:setTouchEnabled(true);
backGround:setLayoutComponentEnabled(true)
backGround:setName("backGround")
backGround:setTag(15)
backGround:setCascadeColorEnabled(true)
backGround:setCascadeOpacityEnabled(true)
backGround:setAnchorPoint(0.5000, 0.5000)
backGround:setPosition(480.0000, 256.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(backGround)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.4000)
layout:setPercentWidthEnabled(true)
layout:setPercentHeightEnabled(true)
layout:setPercentWidth(0.9000)
layout:setPercentHeight(0.9000)
layout:setSize({width = 864.0000, height = 576.0000})
layout:setLeftMargin(48.0000)
layout:setRightMargin(48.0000)
layout:setTopMargin(96.0000)
layout:setBottomMargin(-32.0000)
root:addChild(backGround,UI_LAYERZORDER_BACKGROUND)

--Create menuPanel
local menuPanel = ccui.Layout:create()
menuPanel:ignoreContentAdaptWithSize(false)
menuPanel:setClippingEnabled(false)
menuPanel:setBackGroundColorType(1)
menuPanel:setBackGroundColor({r = 0, g = 0, b = 0})
menuPanel:setBackGroundColorOpacity(0)
menuPanel:setLayoutComponentEnabled(true)
menuPanel:setName("menuPanel")
menuPanel:setTag(16)
menuPanel:setCascadeColorEnabled(true)
menuPanel:setCascadeOpacityEnabled(true)
menuPanel:setAnchorPoint(0.5000, 0.0000)
menuPanel:setPosition(480.0000, 0.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(menuPanel)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPercentWidthEnabled(true)
layout:setPercentHeightEnabled(true)
layout:setPercentWidth(0.8000)
layout:setPercentHeight(0.8500)
layout:setSize({width = 768.0000, height = 544.0000})
layout:setLeftMargin(96.0000)
layout:setRightMargin(96.0000)
layout:setTopMargin(96.0000)
root:addChild(menuPanel,UI_LAYERZORDER_MENU)

--Create choiceEndItem
choiceEndItem = ccui.Button:create()
choiceEndItem:ignoreContentAdaptWithSize(false)
choiceEndItem:loadTextureNormal("Photos/Button/3DBUTTONSMALL_NORMAL.png",0)
choiceEndItem:loadTexturePressed("Photos/Button/3DBUTTONSMALL_SELECTED.png",0)
choiceEndItem:loadTextureDisabled("Default/Button_Disable.png",0)
choiceEndItem:setTitleFontName("fonts/junegull rg.ttf")
choiceEndItem:setTitleFontSize(36)
choiceEndItem:setTitleText(Ui_Choice_Button["Ui_Choice_Button_end"])
choiceEndItem:setScale9Enabled(true)
choiceEndItem:setCapInsets({x = 15, y = 11, width = 270, height = 38})
choiceEndItem:setLayoutComponentEnabled(true)
choiceEndItem:setName("choiceEndItem")
choiceEndItem:setTag(23)
choiceEndItem:setCascadeColorEnabled(true)
choiceEndItem:setCascadeOpacityEnabled(true)
choiceEndItem:setPosition(384.0000, 54.4000)
layout = ccui.LayoutComponent:bindLayoutComponent(choiceEndItem)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.1000)
layout:setPercentWidth(0.3906)
layout:setPercentHeight(0.1103)
layout:setSize({width = 300.0000, height = 60.0000})
layout:setLeftMargin(234.0000)
layout:setRightMargin(234.0000)
layout:setTopMargin(459.6000)
layout:setBottomMargin(24.4000)
menuPanel:addChild(choiceEndItem)
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
        Menu:addTo(root,3)

    end

--init
    createCocosStudioUI()
    exitMenuLayer()
end

--构造函数,在create中执行
function ChoiceUI:ctor()
        initUI()
end

function ChoiceUI:getMenuItem(args)
    if (args == "choiceEndItem") then
        return choiceEndItem
    end
end

cclog("ChoiceUI==========================================================")
return ChoiceUI