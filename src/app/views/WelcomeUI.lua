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
        ExitItem:setPosition(ORIGIN.x + VISIBLE_SIZE.width - ExitItem:getContentSize().width/2, ORIGIN.y + ExitItem:getContentSize().height/2)
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
function WelcomeUI:ctor()
        initUI()
end

cclog("WelcomeUI==========================================================")
return WelcomeUI