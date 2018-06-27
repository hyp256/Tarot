
local PlayphoneScene = class("PlayphoneScene", cc.load("mvc").ViewBase)


local LEVEL_LEADER_BOARD_ID = "18993"
local SOLDIER_ACHIEVEMENT_ID =  "21133"

function PlayphoneScene:onCreate()
    print("Sample Startup")

    --local label = cc.Label:createWithSystemFont("QUIT", "sans", 32)
    local label = cc.Label:createWithSystemFont("AD", "sans", 32)
    local quit = cc.MenuItemLabel:create(label)
    quit:onClicked(function()
        --os.exit(0)
        package.loaded["End/AdScene"]  = nil
        self:getApp():enterScene("End/AdScene")        
    end)
    local size = label:getContentSize()
    local menu = cc.Menu:create(quit)
    menu:setPosition(display.right - size.width / 2 - 16, display.bottom + size.height / 2 + 16)
    self:addChild(menu)

    print("=============================================1")
    self:setupTestMenu()
end

function PlayphoneScene:setupTestMenu()
    local winsize = cc.Director:getInstance():getWinSize()

    local menu = cc.Menu:create(
--[[
        cc.MenuItemLabel:create(cc.Label:createWithSystemFont("load products", "sans", 24)):onClicked(function()
            sdkbox.IAP:refresh()
        end),
        cc.MenuItemLabel:create(cc.Label:createWithSystemFont("restore purchase", "sans", 24)):onClicked(function()
            sdkbox.IAP.restore();
        end),
]]--

        cc.MenuItemLabel:create(cc.Label:createWithSystemFont("update leaderboard random [1,100]", "sans", 24)):onClicked(function()
            local score = math.random() * 100 + 1
        --LEVEL_LEADER_BOARD_ID
            sdkbox.PluginLeaderboard:submitScore(LEVEL_LEADER_BOARD_ID, score)
        end),
        cc.MenuItemLabel:create(cc.Label:createWithSystemFont("get leaderboard", "sans", 24)):onClicked(function()
            sdkbox.PluginLeaderboard:getLeaderboard(LEVEL_LEADER_BOARD_ID)
        end),
        cc.MenuItemLabel:create(cc.Label:createWithSystemFont("achievement test", "sans", 24)):onClicked(function()
        --SOLDIER_ACHIEVEMENT_ID
            sdkbox.PluginAchievement:unlock(SOLDIER_ACHIEVEMENT_ID)
        end)
    )
    print("=============================================2")
    menu:setPosition(winsize.width / 2, winsize.height - 140)
    menu:alignItemsVerticallyWithPadding(50)
    self:addChild(menu)

--[[
    local txtCoin = cc.Label:createWithSystemFont("0", "sans", 24)
    txtCoin:setPosition(winsize.width / 2, 120)
    self:addChild(txtCoin)
]]--

    print("=============================================3")
--[[
    local menuIAP = cc.Menu:create()
    self:addChild(menuIAP)
    sdkbox.IAP:init()
    sdkbox.IAP:setDebug(true)
    sdkbox.IAP:setListener(function(args)
        if "onSuccess" == args.event then
            local product = args.product
            dump(product, "onSuccess:")
        elseif "onFailure" == args.event then
            local product = args.product
            local msg = args.msg
            dump(product, "onFailure:")
            print("msg:", msg)
        elseif "onCanceled" == args.event then
            local product = args.product
            dump(product, "onCanceled:")
        elseif "onRestored" == args.event then
            local product = args.product
            dump(product, "onRestored:")
        elseif "onProductRequestSuccess" == args.event then
            local products = args.products
            dump(products, "onProductRequestSuccess:")

            menuIAP:removeAllChildren()
            for _, product in ipairs(products) do
                local btn = cc.MenuItemFont:create(product.name):onClicked(function()
                    sdkbox.IAP:purchase(product.name)
                end)
                menuIAP:addChild(btn)
            end

            menuIAP:alignItemsVerticallyWithPadding(5)
            menuIAP:setPosition(winsize.width / 2, winsize.height / 2)
        elseif "onProductRequestFailure" == args.event then
            local msg = args.msg
            print("msg:", msg)
        else
            print("unknown event ", args.event)
        end
    end)
]]--

    print("=============================================4")
    sdkbox.PluginAchievement:init()
    sdkbox.PluginLeaderboard:init()
    sdkbox.PluginLeaderboard:setListener(function(event)
            dump(event, "IAP")
            if event.name == "onComplete" then
                print("[IAP] fetch leaderboard data complete ", event.leaderboard)
            elseif event.name == "onFail" then
                print("[IAP] fetch leaderboard date fail")
            end
        end)
    print("=============================================5")
end

return PlayphoneScene
