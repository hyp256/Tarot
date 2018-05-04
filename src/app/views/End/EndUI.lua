cclog("EndUI==========================================================")
--UI类,继承自ViewBase,是一个node类型的类
--Create root
local EndUI = class("EndUI", cc.load("mvc").ViewBase, function()
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
        root:addChild(backGround)

        --Create scrollView_Aside
        local scrollView_Aside = ccui.ScrollView:create()
        scrollView_Aside:setInnerContainerSize({width = 768, height = 255})
        scrollView_Aside:ignoreContentAdaptWithSize(false)
        scrollView_Aside:setClippingEnabled(true)
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
        root:addChild(scrollView_Aside)

        --Create label_Aside
        local label_Aside = ccui.Text:create()
        label_Aside:ignoreContentAdaptWithSize(false)
        label_Aside:setFontName("fonts/simhei.ttf")
        label_Aside:setFontSize(36)
        label_Aside:setString(Aside_End["Aside_End"])
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
        layout:setSize({width = 768.0000, height = 256.0000})
        scrollView_Aside:addChild(label_Aside)

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

        --Create exitItem
        exitItem = ccui.Button:create()
        exitItem:ignoreContentAdaptWithSize(false)
        exitItem:loadTextureNormal("Photos/Button/3DBUTTONLARGE_NORMAL.png",0)
        exitItem:loadTexturePressed("Photos/Button/3DBUTTONLARGE_SELECTED.png",0)
        exitItem:loadTextureDisabled("Default/Button_Disable.png",0)
        exitItem:setTitleFontName("fonts/STHUPO.TTF")
        exitItem:setTitleFontSize(48)
        exitItem:setTitleText(Ui_End_Button["Ui_End_Button_Exit"])
        exitItem:setScale9Enabled(true)
        exitItem:setCapInsets({x = 15, y = 11, width = 470, height = 78})
        exitItem:setLayoutComponentEnabled(true)
        exitItem:setName("exitItem")
        exitItem:setTag(23)
        exitItem:setCascadeColorEnabled(true)
        exitItem:setCascadeOpacityEnabled(true)
        exitItem:setPosition(384.0000, 163.2000)
        layout = ccui.LayoutComponent:bindLayoutComponent(exitItem)
        layout:setPositionPercentXEnabled(true)
        layout:setPositionPercentYEnabled(true)
        layout:setPositionPercentX(0.5000)
        layout:setPositionPercentY(0.3000)
        layout:setPercentWidth(0.6510)
        layout:setPercentHeight(0.1838)
        layout:setSize({width = 500.0000, height = 100.0000})
        layout:setLeftMargin(134.0000)
        layout:setRightMargin(134.0000)
        layout:setTopMargin(330.8000)
        layout:setBottomMargin(113.2000)
        menuPanel:addChild(exitItem)

        --Create backToBeginItem
        backToBeginItem = ccui.Button:create()
        backToBeginItem:ignoreContentAdaptWithSize(false)
        backToBeginItem:loadTextureNormal("Photos/Button/3DBUTTONLARGE_NORMAL.png",0)
        backToBeginItem:loadTexturePressed("Photos/Button/3DBUTTONLARGE_SELECTED.png",0)
        backToBeginItem:loadTextureDisabled("Default/Button_Disable.png",0)
        backToBeginItem:setTitleFontName("fonts/STHUPO.TTF")
        backToBeginItem:setTitleFontSize(48)
        backToBeginItem:setTitleText(Ui_End_Button["Ui_End_Button_Again"])
        backToBeginItem:setScale9Enabled(true)
        backToBeginItem:setCapInsets({x = 15, y = 11, width = 470, height = 78})
        backToBeginItem:setLayoutComponentEnabled(true)
        backToBeginItem:setName("backToBeginItem")
        backToBeginItem:setTag(60)
        backToBeginItem:setCascadeColorEnabled(true)
        backToBeginItem:setCascadeOpacityEnabled(true)
        backToBeginItem:setPosition(384.0000, 299.2000)
        layout = ccui.LayoutComponent:bindLayoutComponent(backToBeginItem)
        layout:setPositionPercentXEnabled(true)
        layout:setPositionPercentYEnabled(true)
        layout:setPositionPercentX(0.5000)
        layout:setPositionPercentY(0.5500)
        layout:setPercentWidth(0.6510)
        layout:setPercentHeight(0.1838)
        layout:setSize({width = 500.0000, height = 100.0000})
        layout:setLeftMargin(134.0000)
        layout:setRightMargin(134.0000)
        layout:setTopMargin(194.8000)
        layout:setBottomMargin(249.2000)
        menuPanel:addChild(backToBeginItem)

        --Create backToAnswer1Item
        backToAnswer1Item = ccui.Button:create()
        backToAnswer1Item:ignoreContentAdaptWithSize(false)
        backToAnswer1Item:loadTextureNormal("Photos/Button/3DBUTTONLARGE_NORMAL.png",0)
        backToAnswer1Item:loadTexturePressed("Photos/Button/3DBUTTONLARGE_SELECTED.png",0)
        backToAnswer1Item:loadTextureDisabled("Default/Button_Disable.png",0)
        backToAnswer1Item:setTitleFontName("fonts/STHUPO.TTF")
        backToAnswer1Item:setTitleFontSize(48)
        backToAnswer1Item:setTitleText(Ui_End_Button["Ui_End_Button_Back"])
        backToAnswer1Item:setScale9Enabled(true)
        backToAnswer1Item:setCapInsets({x = 15, y = 11, width = 470, height = 78})
        backToAnswer1Item:setLayoutComponentEnabled(true)
        backToAnswer1Item:setName("backToAnswer1Item")
        backToAnswer1Item:setTag(61)
        backToAnswer1Item:setCascadeColorEnabled(true)
        backToAnswer1Item:setCascadeOpacityEnabled(true)
        backToAnswer1Item:setPosition(384.0000, 435.2000)
        layout = ccui.LayoutComponent:bindLayoutComponent(backToAnswer1Item)
        layout:setPositionPercentXEnabled(true)
        layout:setPositionPercentX(0.5000)
        layout:setPositionPercentY(0.8000)
        layout:setPercentWidth(0.6510)
        layout:setPercentHeight(0.1838)
        layout:setSize({width = 500.0000, height = 100.0000})
        layout:setLeftMargin(134.0000)
        layout:setRightMargin(134.0000)
        layout:setTopMargin(58.8000)
        layout:setBottomMargin(385.2000)
        menuPanel:addChild(backToAnswer1Item)

        --Create shareItem
        shareItem = ccui.Button:create()
        shareItem:ignoreContentAdaptWithSize(false)
        shareItem:loadTextureNormal("Photos/Button/3DBUTTONLARGE_NORMAL.png",0)
        shareItem:loadTexturePressed("Photos/Button/3DBUTTONLARGE_SELECTED.png",0)
        shareItem:loadTextureDisabled("Default/Button_Disable.png",0)
        shareItem:setTitleFontName("fonts/STHUPO.TTF")
        shareItem:setTitleFontSize(48)
        shareItem:setTitleText(Ui_End_Button["Ui_End_Button_Share"])
        shareItem:setScale9Enabled(true)
        shareItem:setCapInsets({x = 15, y = 11, width = 470, height = 78})
        shareItem:setLayoutComponentEnabled(true)
        shareItem:setName("shareItem")
        shareItem:setTag(9)
        shareItem:setCascadeColorEnabled(true)
        shareItem:setCascadeOpacityEnabled(true)
        shareItem:setPosition(384.0000, 27.2000)
        layout = ccui.LayoutComponent:bindLayoutComponent(shareItem)
        layout:setPositionPercentXEnabled(true)
        layout:setPositionPercentYEnabled(true)
        layout:setPositionPercentX(0.5000)
        layout:setPositionPercentY(0.0500)
        layout:setPercentWidth(0.6510)
        layout:setPercentHeight(0.1838)
        layout:setSize({width = 500.0000, height = 100.0000})
        layout:setLeftMargin(134.0000)
        layout:setRightMargin(134.0000)
        layout:setTopMargin(466.8000)
        layout:setBottomMargin(-22.8000)
        menuPanel:addChild(shareItem)

    end

--退出APP button
    function exitMenuLayer()
        local function ExitApp(ref,type)
            if type == ccui.TouchEventType.ended then
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
        end

        exitItem:addTouchEventListener(ExitApp)
    end

--分享button
    function shareMenu()
        local function shareApp(ref,type)
        local targetPlatform = cc.Application:getInstance():getTargetPlatform()
            if type == ccui.TouchEventType.ended and (cc.PLATFORM_OS_ANDROID == targetPlatform) then
                local item = Sdkplugin:getItem("SHARE_SYS","SHARE")
                Sdkplugin:menuCallback(item)
            end
        end

        shareItem:addTouchEventListener(shareApp)
    end

--init
    createCocosStudioUI()
    exitMenuLayer()
    shareMenu()
end

--构造函数,在create中执行
function EndUI:ctor()
        initUI()
end

function EndUI:getMenuItem(args)
    if (args == "backToBeginItem") then
        return backToBeginItem
    elseif (args == "backToAnswer1Item") then
        return backToAnswer1Item
    end
end

cclog("EndUI==========================================================")
return EndUI