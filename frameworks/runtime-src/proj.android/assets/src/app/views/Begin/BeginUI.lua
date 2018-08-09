cclog("BeginUI==========================================================")
--UI类,继承自ViewBase,是一个node类型的类
--Create root
local BeginUI = class("BeginUI", cc.load("mvc").ViewBase, function()
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
        --内部容器大小,滚动可能延展size,与文本size,本身size关联
        scrollView:setInnerContainerSize({width = 768, height = 272})
        scrollView:ignoreContentAdaptWithSize(false)
        scrollView:setClippingEnabled(false)
        scrollView:setBackGroundColorType(1)
        scrollView:setBackGroundColor({r = 0, g = 0, b = 0})
        scrollView:setLayoutComponentEnabled(true)
        scrollView:setName("scrollView")
        scrollView:setTag(26)
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
        label_Aside:setString(Aside_Begin["Aside_Begin"])
        label_Aside:setLayoutComponentEnabled(true)
        label_Aside:setName("label_Aside")
        label_Aside:setTag(27)
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
        --文本显示size,偏小的话显示不全
        layout:setSize({width = 768.0000, height = 272.0000})
        --layout:setTopMargin(0.0000)
        --layout:setBottomMargin(96.0000)
        scrollView:addChild(label_Aside)

        --Create backGround
        local backGround = ccui.Layout:create()
        backGround:ignoreContentAdaptWithSize(false)
        backGround:setBackGroundImage("Photos/TAROTWELCOME.png",0)
        backGround:setClippingEnabled(true)
        backGround:setBackGroundColorType(1)
        backGround:setBackGroundColor({r = 0, g = 0, b = 0})
        backGround:setTouchEnabled(true);
        backGround:setLayoutComponentEnabled(true)
        backGround:setName("backGround")
        backGround:setTag(5)
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
        layout:setPercentWidth(0.8000)
        layout:setPercentHeight(0.7000)
        layout:setSize({width = 768.0000, height = 448.0000})
        layout:setLeftMargin(96.0000)
        layout:setRightMargin(96.0000)
        layout:setTopMargin(96.0000)
        layout:setBottomMargin(96.0000)
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
        menuPanel:setTag(28)
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

        --Create divineLifeItem
        divineLifeItem = ccui.Button:create()
        divineLifeItem:ignoreContentAdaptWithSize(false)
        divineLifeItem:loadTextureNormal("Photos/Button/3DBUTTONLARGE_NORMAL.png",0)
        divineLifeItem:loadTexturePressed("Photos/Button/3DBUTTONLARGE_SELECTED.png",0)
        divineLifeItem:loadTextureDisabled("Default/Button_Disable.png",0)
        divineLifeItem:setTitleFontName("fonts/junegull rg.ttf")
        divineLifeItem:setTitleFontSize(72)
        divineLifeItem:setTitleText(Ui_Begin_Button["Ui_Begin_Button_Life"])
        divineLifeItem:setScale9Enabled(true)
        divineLifeItem:setCapInsets({x = 15, y = 11, width = 470, height = 78})
        divineLifeItem:setLayoutComponentEnabled(true)
        divineLifeItem:setName("divineLifeItem")
        divineLifeItem:setTag(29)
        divineLifeItem:setCascadeColorEnabled(true)
        divineLifeItem:setCascadeOpacityEnabled(true)
        divineLifeItem:setAnchorPoint(0.5000, 0.0000)
        divineLifeItem:setPosition(384.0000, 380.8000)
        layout = ccui.LayoutComponent:bindLayoutComponent(divineLifeItem)
        layout:setPositionPercentXEnabled(true)
        layout:setPositionPercentYEnabled(true)
        layout:setPositionPercentX(0.5000)
        layout:setPositionPercentY(0.7000)
        layout:setPercentWidth(0.6510)
        layout:setPercentHeight(0.1838)
        layout:setSize({width = 500.0000, height = 100.0000})
        layout:setLeftMargin(134.0000)
        layout:setRightMargin(133.9999)
        layout:setTopMargin(63.2000)
        layout:setBottomMargin(380.8000)
        menuPanel:addChild(divineLifeItem)

        --Create divineEnterpriseItem
        divineEnterpriseItem = ccui.Button:create()
        divineEnterpriseItem:ignoreContentAdaptWithSize(false)
        divineEnterpriseItem:loadTextureNormal("Photos/Button/3DBUTTONLARGE_NORMAL.png",0)
        divineEnterpriseItem:loadTexturePressed("Photos/Button/3DBUTTONLARGE_SELECTED.png",0)
        divineEnterpriseItem:loadTextureDisabled("Default/Button_Disable.png",0)
        divineEnterpriseItem:setTitleFontName("fonts/junegull rg.ttf")
        divineEnterpriseItem:setTitleFontSize(72)
        divineEnterpriseItem:setTitleText(Ui_Begin_Button["Ui_Begin_Button_EnterPrise"])
        divineEnterpriseItem:setScale9Enabled(true)
        divineEnterpriseItem:setCapInsets({x = 15, y = 11, width = 470, height = 78})
        divineEnterpriseItem:setLayoutComponentEnabled(true)
        divineEnterpriseItem:setName("divineEnterpriseItem")
        divineEnterpriseItem:setTag(30)
        divineEnterpriseItem:setCascadeColorEnabled(true)
        divineEnterpriseItem:setCascadeOpacityEnabled(true)
        divineEnterpriseItem:setPosition(384.0000, 272.0000)
        layout = ccui.LayoutComponent:bindLayoutComponent(divineEnterpriseItem)
        layout:setPositionPercentXEnabled(true)
        layout:setPositionPercentYEnabled(true)
        layout:setPositionPercentX(0.5000)
        layout:setPositionPercentY(0.5000)
        layout:setPercentWidth(0.6510)
        layout:setPercentHeight(0.1838)
        layout:setSize({width = 500.0000, height = 100.0000})
        layout:setLeftMargin(134.0000)
        layout:setRightMargin(133.9999)
        layout:setTopMargin(222.0000)
        layout:setBottomMargin(222.0000)
        menuPanel:addChild(divineEnterpriseItem)

        --Create divineLoveItem
        divineLoveItem = ccui.Button:create()
        divineLoveItem:ignoreContentAdaptWithSize(false)
        divineLoveItem:loadTextureNormal("Photos/Button/3DBUTTONLARGE_NORMAL.png",0)
        divineLoveItem:loadTexturePressed("Photos/Button/3DBUTTONLARGE_SELECTED.png",0)
        divineLoveItem:loadTextureDisabled("Default/Button_Disable.png",0)
        divineLoveItem:setTitleFontName("fonts/junegull rg.ttf")
        divineLoveItem:setTitleFontSize(72)
        divineLoveItem:setTitleText(Ui_Begin_Button["Ui_Begin_Button_Love"])
        divineLoveItem:setScale9Enabled(true)
        divineLoveItem:setCapInsets({x = 15, y = 11, width = 470, height = 78})
        divineLoveItem:setLayoutComponentEnabled(true)
        divineLoveItem:setName("divineLoveItem")
        divineLoveItem:setTag(31)
        divineLoveItem:setCascadeColorEnabled(true)
        divineLoveItem:setCascadeOpacityEnabled(true)
        divineLoveItem:setPosition(384.0000, 108.8000)
        layout = ccui.LayoutComponent:bindLayoutComponent(divineLoveItem)
        layout:setPositionPercentXEnabled(true)
        layout:setPositionPercentYEnabled(true)
        layout:setPositionPercentX(0.5000)
        layout:setPositionPercentY(0.2000)
        layout:setPercentWidth(0.6510)
        layout:setPercentHeight(0.1838)
        layout:setSize({width = 500.0000, height = 100.0000})
        layout:setLeftMargin(134.0000)
        layout:setRightMargin(133.9999)
        layout:setTopMargin(385.2000)
        layout:setBottomMargin(58.8000)
        menuPanel:addChild(divineLoveItem)

--[[
        --Create mainSceneItem
        mainSceneItem = ccui.Button:create()
        mainSceneItem:ignoreContentAdaptWithSize(false)
        mainSceneItem:loadTextureNormal("Photos/Button/3DBUTTONSMALL_NORMAL.png",0)
        mainSceneItem:loadTexturePressed("Photos/Button/3DBUTTONSMALL_SELECTED.png",0)
        mainSceneItem:loadTextureDisabled("Default/Button_Disable.png",0)
        mainSceneItem:setTitleFontName("fonts/STHUPO.TTF")
        mainSceneItem:setTitleFontSize(36)
        mainSceneItem:setTitleText("SDKBOX")
        mainSceneItem:setScale9Enabled(true)
        mainSceneItem:setCapInsets({x = 15, y = 11, width = 470, height = 78})
        mainSceneItem:setLayoutComponentEnabled(true)
        mainSceneItem:setName("mainSceneItem")
        mainSceneItem:setTag(311)
        mainSceneItem:setCascadeColorEnabled(true)
        mainSceneItem:setCascadeOpacityEnabled(true)
        mainSceneItem:setPosition(384.0000, 60.0000)
        layout = ccui.LayoutComponent:bindLayoutComponent(mainSceneItem)
        layout:setPositionPercentXEnabled(true)
        layout:setPositionPercentYEnabled(true)
        layout:setPositionPercentX(0.5000)
        layout:setPositionPercentY(0.2000)
        layout:setPercentWidth(0.6510)
        layout:setPercentHeight(0.1838)
        layout:setSize({width = 500.0000, height = 100.0000})
        layout:setLeftMargin(134.0000)
        layout:setRightMargin(133.9999)
        layout:setTopMargin(385.2000)
        layout:setBottomMargin(58.8000)
        menuPanel:addChild(mainSceneItem)
]]--

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

    --    return Menu
    end

--init
    createCocosStudioUI()
    exitMenuLayer()
end

--构造函数,在create中执行
function BeginUI:ctor()
        initUI()
end

function BeginUI:getMenuItem(args)
    if (args == "divineLifeItem") then
        return divineLifeItem
    elseif (args == "divineEnterpriseItem") then
        return divineEnterpriseItem
    elseif (args == "divineLoveItem") then
        return divineLoveItem
    end
end

cclog("BeginUI==========================================================")
return BeginUI