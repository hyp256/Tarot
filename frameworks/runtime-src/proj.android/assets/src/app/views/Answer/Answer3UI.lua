cclog("Answer3UI==========================================================")
--UI类,继承自ViewBase,是一个node类型的类
--Create root
local Answer3UI = class("Answer3UI", cc.load("mvc").ViewBase, function()
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
        backGround:setBackGroundImage("Photos/HelloWorld.png",0)
        backGround:setClippingEnabled(false)
        backGround:setBackGroundColorType(1)
        backGround:setBackGroundColor({r = 0, g = 0, b = 0})
        backGround:setTouchEnabled(true);
        backGround:setLayoutComponentEnabled(true)
        backGround:setName("backGround")
        backGround:setTag(15)
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
        layout:setPercentWidth(0.9000)
        layout:setPercentHeight(0.9000)
        layout:setSize({width = 864.0000, height = 576.0000})
        layout:setLeftMargin(48.0000)
        layout:setRightMargin(48.0000)
        layout:setTopMargin(32.0000)
        layout:setBottomMargin(32.0000)
        root:addChild(backGround,UI_LAYERZORDER_BACKGROUND)

        --Create scrollView_Aside
        scrollView_Aside = ccui.ScrollView:create()
        scrollView_Aside:setInnerContainerSize({width = 768, height = 192})
        scrollView_Aside:ignoreContentAdaptWithSize(false)
        scrollView_Aside:setClippingEnabled(false)
        scrollView_Aside:setBackGroundColorType(1)
        scrollView_Aside:setBackGroundColor({r = 0, g = 0, b = 0})
        scrollView_Aside:setBackGroundColorOpacity(0)
        scrollView_Aside:setLayoutComponentEnabled(true)
        scrollView_Aside:setName("scrollView_Aside")
        scrollView_Aside:setTag(13)
        scrollView_Aside:setCascadeColorEnabled(true)
        scrollView_Aside:setCascadeOpacityEnabled(true)
        scrollView_Aside:setAnchorPoint(0.5000, 0.5000)
        scrollView_Aside:setPosition(480.0000, 576.0000)
        layout = ccui.LayoutComponent:bindLayoutComponent(scrollView_Aside)
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
        root:addChild(scrollView_Aside,UI_LAYERZORDER_LABEL)

        --Create label_Aside
        local label_Aside = ccui.Text:create()
        label_Aside:ignoreContentAdaptWithSize(false)
        label_Aside:setFontName("fonts/arial.ttf")
        label_Aside:setFontSize(36)
        label_Aside:setString(Aside_Answer["Aside_Answer3"])
--        label_Aside:enableShadow({r = 110, g = 110, b = 110, a = 255}, {width = 2, height = -2}, 0)
--        label_Aside:enableOutline({r = 0, g = 0, b = 0, a = 255}, 1)
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
        scrollView_Aside:addChild(label_Aside)

        --Create scrollView_Context
        scrollView_Context = ccui.ScrollView:create()
        scrollView_Context:setBounceEnabled(true)
        scrollView_Context:setInnerContainerSize({width = 815, height = 880})
        scrollView_Context:ignoreContentAdaptWithSize(false)
        scrollView_Context:setBackGroundImage("Photos/14.png",0)
        scrollView_Context:setClippingEnabled(true)
        scrollView_Context:setBackGroundImageCapInsets({x = 114, y = 168, width = 60, height = 146})
        scrollView_Context:setBackGroundColorType(1)
        scrollView_Context:setBackGroundColor({r = 0, g = 0, b = 0})
        scrollView_Context:setBackGroundColorOpacity(0)
        scrollView_Context:setBackGroundImageScale9Enabled(true)
        scrollView_Context:setLayoutComponentEnabled(true)
        scrollView_Context:setName("scrollView_Context")
        scrollView_Context:setTag(23)
        scrollView_Context:setCascadeColorEnabled(true)
        scrollView_Context:setCascadeOpacityEnabled(true)
        scrollView_Context:setVisible(false)
        scrollView_Context:setAnchorPoint(0.5000, 0.0000)
        scrollView_Context:setPosition(480.0000, 96.0000)
        scrollView_Context:setScaleX(0.0100)
        scrollView_Context:setScaleY(0.0100)
        layout = ccui.LayoutComponent:bindLayoutComponent(scrollView_Context)
        layout:setPositionPercentXEnabled(true)
        layout:setPositionPercentYEnabled(true)
        layout:setPositionPercentX(0.5000)
        layout:setPositionPercentY(0.1500)
        layout:setPercentWidthEnabled(true)
        layout:setPercentHeightEnabled(true)
        layout:setPercentWidth(0.8500)
        layout:setPercentHeight(0.7500)
        layout:setSize({width = 815.9999, height = 480.0000})
        layout:setLeftMargin(72.0000)
        layout:setRightMargin(72.0000)
        layout:setTopMargin(64.0000)
        layout:setBottomMargin(96.0000)
        root:addChild(scrollView_Context,UI_LAYERZORDER_MID)

        --Create context_Aside
        context_Aside = ccui.Text:create()
        context_Aside:ignoreContentAdaptWithSize(false)
        context_Aside:setFontName("fonts/arial.ttf")
        context_Aside:setFontSize(26)
        context_Aside:setString("")
        context_Aside:enableShadow({r = 110, g = 110, b = 110, a = 255}, {width = 2, height = -2}, 0)
        context_Aside:enableOutline({r = 0, g = 0, b = 0, a = 255}, 1)
        context_Aside:setLayoutComponentEnabled(true)
        context_Aside:setName("context_Aside")
        context_Aside:setTag(27)
        context_Aside:setCascadeColorEnabled(true)
        context_Aside:setCascadeOpacityEnabled(true)
        context_Aside:setPosition(408.0000, 440.0000)
        layout = ccui.LayoutComponent:bindLayoutComponent(context_Aside)
        layout:setPositionPercentXEnabled(true)
        layout:setPositionPercentYEnabled(true)
        layout:setPositionPercentX(0.5000)
        layout:setPositionPercentY(0.5000)
        layout:setPercentWidthEnabled(true)
        layout:setPercentHeightEnabled(true)
        layout:setPercentWidth(0.7500)
        layout:setPercentHeight(1.0000)
        layout:setSize({width = 611.9999, height = 880.0000})
        layout:setLeftMargin(102.0000)
        layout:setRightMargin(102.0000)
        scrollView_Context:addChild(context_Aside)

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
        choiceEndItem:setTitleText(Ui_Answer_Button["Ui_Answer_Button_end"])
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

        --Create closeContextAsideItem
        closeContextAsideItem = ccui.Button:create()
        closeContextAsideItem:ignoreContentAdaptWithSize(false)
        closeContextAsideItem:loadTextureNormal("Photos/Button/add_button_48px.png",0)
        closeContextAsideItem:loadTexturePressed("Photos/Button/delete_button_48px.png",0)
        closeContextAsideItem:loadTextureDisabled("Default/Button_Disable.png",0)
        closeContextAsideItem:setTitleFontName("fonts/junegull rg.ttf")
        closeContextAsideItem:setTitleFontSize(16)
        closeContextAsideItem:setTitleColor({r = 0, g = 0, b = 0})
        closeContextAsideItem:setLayoutComponentEnabled(true)
        closeContextAsideItem:setName("closeContextAsideItem")
        closeContextAsideItem:setTag(10)
        closeContextAsideItem:setCascadeColorEnabled(true)
        closeContextAsideItem:setCascadeOpacityEnabled(true)
        closeContextAsideItem:setVisible(false)
        closeContextAsideItem:setPosition(691.2000, 108.8000)
        layout = ccui.LayoutComponent:bindLayoutComponent(closeContextAsideItem)
        layout:setPositionPercentXEnabled(true)
        layout:setPositionPercentYEnabled(true)
        layout:setPositionPercentX(0.9000)
        layout:setPositionPercentY(0.2000)
        layout:setPercentWidth(0.0625)
        layout:setPercentHeight(0.0882)
        layout:setSize({width = 48.0000, height = 48.0000})
        layout:setLeftMargin(667.2000)
        layout:setRightMargin(52.8001)
        layout:setTopMargin(411.2000)
        layout:setBottomMargin(84.8000)
        menuPanel:addChild(closeContextAsideItem)
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
function Answer3UI:ctor()
        initUI()
end

function Answer3UI:getUIItem(args)
    if (args == "scrollView_Aside") then
        return scrollView_Aside
    elseif (args == "scrollView_Context") then
        return scrollView_Context
    elseif (args == "context_Aside") then
        return context_Aside
    elseif (args == "closeContextAsideItem") then
        return closeContextAsideItem       
    elseif (args == "choiceEndItem") then
        return choiceEndItem
    end
end

cclog("Answer3UI==========================================================")
return Answer3UI