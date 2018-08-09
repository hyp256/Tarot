cclog("Shuffle1UI==========================================================")
--UI类,继承自ViewBase,是一个node类型的类
--Create root
local Shuffle1UI = class("Shuffle1UI", cc.load("mvc").ViewBase, function()
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
        scrollView:setInnerContainerSize({width = 768, height = 272})
        scrollView:ignoreContentAdaptWithSize(false)
        scrollView:setClippingEnabled(false)
        scrollView:setBackGroundColorType(1)
        scrollView:setBackGroundColor({r = 0, g = 0, b = 0})
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
        label_Aside:setString(Aside_Shuffle["Aside_Shuffle1"])
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
        layout:setSize({width = 768.0000, height = 272.0000})
        layout:setRightMargin(1.0000)
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
        root:addChild(backGround)

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
        root:addChild(menuPanel)

        --Create shuffleTopItem
        shuffleTopItem = ccui.Button:create()
        shuffleTopItem:ignoreContentAdaptWithSize(false)
        shuffleTopItem:loadTextureNormal("Photos/Button/3DBUTTONSMALL_NORMAL.png",0)
        shuffleTopItem:loadTexturePressed("Photos/Button/3DBUTTONSMALL_SELECTED.png",0)
        shuffleTopItem:loadTextureDisabled("Default/Button_Disable.png",0)
        shuffleTopItem:setTitleFontName("fonts/junegull rg.ttf")
        shuffleTopItem:setTitleFontSize(36)
        shuffleTopItem:setTitleText(Ui_Shuffle_Button["Ui_Shuffle_Button_Top"])
        shuffleTopItem:setScale9Enabled(true)
        shuffleTopItem:setCapInsets({x = 15, y = 11, width = 270, height = 38})
        shuffleTopItem:setLayoutComponentEnabled(true)
        shuffleTopItem:setName("shuffleTopItem")
        shuffleTopItem:setTag(20)
        shuffleTopItem:setCascadeColorEnabled(true)
        shuffleTopItem:setCascadeOpacityEnabled(true)
        shuffleTopItem:setPosition(691.2000, 489.6000)
        layout = ccui.LayoutComponent:bindLayoutComponent(shuffleTopItem)
        layout:setPositionPercentXEnabled(true)
        layout:setPositionPercentYEnabled(true)
        layout:setPositionPercentX(0.9000)
        layout:setPositionPercentY(0.9000)
        layout:setPercentWidth(0.3906)
        layout:setPercentHeight(0.1103)
        layout:setSize({width = 300.0000, height = 60.0000})
        layout:setLeftMargin(541.2000)
        layout:setRightMargin(-73.2000)
        layout:setTopMargin(24.4000)
        layout:setBottomMargin(459.6000)
        menuPanel:addChild(shuffleTopItem)

        --Create shuffleCenterItem
        shuffleCenterItem = ccui.Button:create()
        shuffleCenterItem:ignoreContentAdaptWithSize(false)
        shuffleCenterItem:loadTextureNormal("Photos/Button/3DBUTTONSMALL_NORMAL.png",0)
        shuffleCenterItem:loadTexturePressed("Photos/Button/3DBUTTONSMALL_SELECTED.png",0)
        shuffleCenterItem:loadTextureDisabled("Default/Button_Disable.png",0)
        shuffleCenterItem:setTitleFontName("fonts/junegull rg.ttf")
        shuffleCenterItem:setTitleFontSize(36)
        shuffleCenterItem:setTitleText(Ui_Shuffle_Button["Ui_Shuffle_Button_Center"])
        shuffleCenterItem:setScale9Enabled(true)
        shuffleCenterItem:setCapInsets({x = 15, y = 11, width = 270, height = 38})
        shuffleCenterItem:setLayoutComponentEnabled(true)
        shuffleCenterItem:setName("shuffleCenterItem")
        shuffleCenterItem:setTag(21)
        shuffleCenterItem:setCascadeColorEnabled(true)
        shuffleCenterItem:setCascadeOpacityEnabled(true)
        shuffleCenterItem:setPosition(691.2000, 326.4000)
        layout = ccui.LayoutComponent:bindLayoutComponent(shuffleCenterItem)
        layout:setPositionPercentXEnabled(true)
        layout:setPositionPercentYEnabled(true)
        layout:setPositionPercentX(0.9000)
        layout:setPositionPercentY(0.6000)
        layout:setPercentWidth(0.3906)
        layout:setPercentHeight(0.1103)
        layout:setSize({width = 300.0000, height = 60.0000})
        layout:setLeftMargin(541.2000)
        layout:setRightMargin(-73.2000)
        layout:setTopMargin(187.6000)
        layout:setBottomMargin(296.4000)
        menuPanel:addChild(shuffleCenterItem)

        --Create shuffleBottomItem
        shuffleBottomItem = ccui.Button:create()
        shuffleBottomItem:ignoreContentAdaptWithSize(false)
        shuffleBottomItem:loadTextureNormal("Photos/Button/3DBUTTONSMALL_NORMAL.png",0)
        shuffleBottomItem:loadTexturePressed("Photos/Button/3DBUTTONSMALL_SELECTED.png",0)
        shuffleBottomItem:loadTextureDisabled("Default/Button_Disable.png",0)
        shuffleBottomItem:setTitleFontName("fonts/junegull rg.ttf")
        shuffleBottomItem:setTitleFontSize(36)
        shuffleBottomItem:setTitleText(Ui_Shuffle_Button["Ui_Shuffle_Button_Bottom"])
        shuffleBottomItem:setScale9Enabled(true)
        shuffleBottomItem:setCapInsets({x = 15, y = 11, width = 270, height = 38})
        shuffleBottomItem:setLayoutComponentEnabled(true)
        shuffleBottomItem:setName("shuffleBottomItem")
        shuffleBottomItem:setTag(22)
        shuffleBottomItem:setCascadeColorEnabled(true)
        shuffleBottomItem:setCascadeOpacityEnabled(true)
        shuffleBottomItem:setPosition(691.2000, 163.2000)
        layout = ccui.LayoutComponent:bindLayoutComponent(shuffleBottomItem)
        layout:setPositionPercentXEnabled(true)
        layout:setPositionPercentYEnabled(true)
        layout:setPositionPercentX(0.9000)
        layout:setPositionPercentY(0.3000)
        layout:setPercentWidth(0.3906)
        layout:setPercentHeight(0.1103)
        layout:setSize({width = 300.0000, height = 60.0000})
        layout:setLeftMargin(541.2000)
        layout:setRightMargin(-73.2000)
        layout:setTopMargin(350.8000)
        layout:setBottomMargin(133.2000)
        menuPanel:addChild(shuffleBottomItem)

        --Create shuffleNextItem
        shuffleNextItem = ccui.Button:create()
        shuffleNextItem:ignoreContentAdaptWithSize(false)
        shuffleNextItem:loadTextureNormal("Photos/Button/3DBUTTONSMALL_NORMAL.png",0)
        shuffleNextItem:loadTexturePressed("Photos/Button/3DBUTTONSMALL_SELECTED.png",0)
        shuffleNextItem:loadTextureDisabled("Default/Button_Disable.png",0)
        shuffleNextItem:setTitleFontName("fonts/junegull rg.ttf")
        shuffleNextItem:setTitleFontSize(36)
        shuffleNextItem:setTitleText(Ui_Shuffle_Button["Ui_Shuffle_Button_Next"])
        shuffleNextItem:setScale9Enabled(true)
        shuffleNextItem:setCapInsets({x = 15, y = 11, width = 270, height = 38})
        shuffleNextItem:setLayoutComponentEnabled(true)
        shuffleNextItem:setName("shuffleNextItem")
        shuffleNextItem:setTag(23)
        shuffleNextItem:setCascadeColorEnabled(true)
        shuffleNextItem:setCascadeOpacityEnabled(true)
        shuffleNextItem:setPosition(384.0000, 54.4000)
        layout = ccui.LayoutComponent:bindLayoutComponent(shuffleNextItem)
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
        menuPanel:addChild(shuffleNextItem)
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
function Shuffle1UI:ctor()
        initUI()
end

function Shuffle1UI:getMenuItem(args)
    if (args == "shuffleTopItem") then
        return shuffleTopItem
    elseif (args == "shuffleCenterItem") then
        return shuffleCenterItem
    elseif (args == "shuffleBottomItem") then
        return shuffleBottomItem
    elseif (args == "shuffleNextItem") then
        return shuffleNextItem
    end
end

cclog("Shuffle1UI==========================================================")
return Shuffle1UI