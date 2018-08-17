
local AdScene = class("AdScene", cc.load("mvc").ViewBase)

function AdScene:onCreate()
    print("Sample Startup")

--[[
    local label = cc.Label:createWithSystemFont("QUIT", "sans", 32)
    local quit = cc.MenuItemLabel:create(label)
    quit:onClicked(function()
        os.exit(0)
    end)
    local size = label:getContentSize()
    local menu = cc.Menu:create(quit)
    menu:setPosition(display.right - size.width / 2 - 16, display.bottom + size.height / 2 + 16)
    self:addChild(menu)
]]--

    self:setupTestMenu()
end


function AdScene:setupTestMenu()
    sdkbox.PluginSdkboxAds:init()
    sdkbox.PluginSdkboxAds:setListener(function(args)
        dump(args)
    end)

--[[
    sdkbox.PluginLeadBolt:init()
    sdkbox.PluginLeadBolt:setListener(function(args)
        dump(args)
    end)

    local menu = cc.Menu:create()

    local label = cc.Label:createWithSystemFont("play default ad", "sans", 28)
    local item = cc.MenuItemLabel:create(label)
    item:onClicked(function()
        print("play default ad")
        sdkbox.PluginSdkboxAds:playAd()
    end)
    menu:addChild(item)

    local label = cc.Label:createWithSystemFont("play placement-interstitial", "sans", 28)
    local item = cc.MenuItemLabel:create(label)
    item:onClicked(function()
        print("play placement-interstitial")
        sdkbox.PluginSdkboxAds:placement("placement-interstitial")
    end)
    menu:addChild(item)

    local label = cc.Label:createWithSystemFont("play placement-reward", "sans", 28)
    local item = cc.MenuItemLabel:create(label)
    item:onClicked(function()
        print("play placement-reward")
        sdkbox.PluginSdkboxAds:placement("placement-reward")
    end)
    menu:addChild(item)

    local label = cc.Label:createWithSystemFont("play placement-banner", "sans", 28)
    local item = cc.MenuItemLabel:create(label)
    item:onClicked(function()
        print("play placement-banner")
        sdkbox.PluginSdkboxAds:placement("placement-banner")
    end)
    menu:addChild(item)

    local label = cc.Label:createWithSystemFont("play placement 4", "sans", 28)
    local item = cc.MenuItemLabel:create(label)
    item:onClicked(function()
        print("play placement 4")
        sdkbox.PluginSdkboxAds:placement("placement-4")
    end)
    menu:addChild(item)

    --local label = cc.Label:createWithSystemFont("------", "sans", 28)
    --local item = cc.MenuItemLabel:create(label)
    --menu:addChild(item)

    menu:addChild(cc.MenuItemLabel:create(cc.Label:createWithSystemFont("AdColony Interstital", "sans", 24)):onClicked(function()
        print("AdColony Interstital")
        sdkbox.PluginSdkboxAds:playAd("AdColony", "video")
    end))

    menu:addChild(cc.MenuItemLabel:create(cc.Label:createWithSystemFont("AdColony Reward", "sans", 24)):onClicked(function()
        print("AdColony Reward")
        sdkbox.PluginSdkboxAds:playAd("AdColony", "v4vc")
    end))

    menu:addChild(cc.MenuItemLabel:create(cc.Label:createWithSystemFont("Fyber Interstital", "sans", 24)):onClicked(function()
        print("Fyber Interstital")
        sdkbox.PluginSdkboxAds:playAd("Fyber", "INTERSTITIAL")
    end))

    menu:addChild(cc.MenuItemLabel:create(cc.Label:createWithSystemFont("Fyber Reward", "sans", 24)):onClicked(function()
        print("Fyber Reward")
        sdkbox.PluginSdkboxAds:playAd("Fyber", "REWARDED")
    end))

    menu:addChild(cc.MenuItemLabel:create(cc.Label:createWithSystemFont("Chartboost Interstital", "sans", 24)):onClicked(function()
        print("Chartboost Interstital")
        sdkbox.PluginSdkboxAds:playAd("Chartboost", "Default")
    end))

    menu:addChild(cc.MenuItemLabel:create(cc.Label:createWithSystemFont("Chartboost Reward", "sans", 24)):onClicked(function()
        print("Chartboost Reward")
        sdkbox.PluginSdkboxAds:playAd("Chartboost", "Level Complete")
    end))

    menu:addChild(cc.MenuItemLabel:create(cc.Label:createWithSystemFont("Vungle Interstital", "sans", 24)):onClicked(function()
        print("Vungle Interstital")
        sdkbox.PluginSdkboxAds:playAd("Vungle", "video")
    end))

    menu:addChild(cc.MenuItemLabel:create(cc.Label:createWithSystemFont("Vungle Reward", "sans", 24)):onClicked(function()
        print("Vungle Reward")
        sdkbox.PluginSdkboxAds:playAd("Vungle", "reward")
    end))

    menu:addChild(cc.MenuItemLabel:create(cc.Label:createWithSystemFont("Bee7 Interstital", "sans", 24)):onClicked(function()
        print("Bee7 Interstital")
        sdkbox.PluginSdkboxAds:playAd("Fyber", "any")
    end))

    menu:addChild(cc.MenuItemLabel:create(cc.Label:createWithSystemFont("AdMob Interstital", "sans", 24)):onClicked(function()
        print("AdMob Interstital")
        sdkbox.PluginSdkboxAds:playAd("AdMob", "gameover")
    end))

    menu:addChild(cc.MenuItemLabel:create(cc.Label:createWithSystemFont("AdMob Reward", "sans", 24)):onClicked(function()
        print("AdMob Reward")
        sdkbox.PluginSdkboxAds:playAd("AdMob", "rewarded")
    end))

    menu:addChild(cc.MenuItemLabel:create(cc.Label:createWithSystemFont("InMobi Banner", "sans", 24)):onClicked(function()
        print("InMobi Banner")
        sdkbox.PluginSdkboxAds:playAd("InMobi", "ad1")
    end))

    menu:addChild(cc.MenuItemLabel:create(cc.Label:createWithSystemFont("InMobi Interstital", "sans", 24)):onClicked(function()
        print("InMobi Interstital")
        sdkbox.PluginSdkboxAds:playAd("InMobi", "ad2")
    end))

    menu:addChild(cc.MenuItemLabel:create(cc.Label:createWithSystemFont("Leadbolt Direct Deals load", "sans", 24)):onClicked(function()
        print("Leadbolt Direct Deals load")
        sdkbox.PluginSdkboxAds:cacheControl("LeadBolt", {name = "ad1"})
        --sdkbox.PluginLeadBolt:loadModuleToCache("ad1");
    end))

    menu:addChild(cc.MenuItemLabel:create(cc.Label:createWithSystemFont("Leadbolt Direct Deals", "sans", 24)):onClicked(function()
        print("Leadbolt Direct Deals")
        sdkbox.PluginSdkboxAds:playAd("LeadBolt", "ad1")
    end))

    menu:addChild(cc.MenuItemLabel:create(cc.Label:createWithSystemFont("Leadbolt Rewarded Ads load", "sans", 24)):onClicked(function()
        print("Leadbolt Rewarded Ads load")
        sdkbox.PluginSdkboxAds:cacheControl("LeadBolt", {name = "ad2"})
        --sdkbox.PluginLeadBolt:loadModuleToCache("ad2");
    end))

    menu:addChild(cc.MenuItemLabel:create(cc.Label:createWithSystemFont("Leadbolt Rewarded Ads", "sans", 24)):onClicked(function()
        print("Leadbolt Rewarded Ads")
        sdkbox.PluginSdkboxAds:playAd("LeadBolt", "ad2")
    end))

    menu:setPosition(display.width * 1 / 4, display.height / 2)
    menu:alignItemsVerticallyWithPadding(24)
    self:addChild(menu)


    -- menu 2

    menu = cc.Menu:create()

    -- show and hide placement
    menu:addChild(cc.MenuItemLabel:create(cc.Label:createWithSystemFont("Play banners", "sans", 24)):onClicked(function()
        sdkbox.PluginSdkboxAds:placement("placement-banner")
    end))
    menu:addChild(cc.MenuItemLabel:create(cc.Label:createWithSystemFont("Hide banners", "sans", 24)):onClicked(function()
        sdkbox.PluginSdkboxAds:hide("placement-banner")
    end))

    -- show and hide Admob banner
    menu:addChild(cc.MenuItemLabel:create(cc.Label:createWithSystemFont("play AdMob home", "sans", 24)):onClicked(function()
        print("AdMob banner")
        sdkbox.PluginSdkboxAds:playAd("AdMob", "home")
    end))

    menu:addChild(cc.MenuItemLabel:create(cc.Label:createWithSystemFont("Hide InMobi/AdMob banner", "sans", 24)):onClicked(function()
        sdkbox.PluginSdkboxAds:hideAd("AdMob", "home")
        sdkbox.PluginSdkboxAds:hideAd("InMobi", "ad1")
    end))

    menu:setPosition(display.width * 3 / 4, display.height / 2)
    menu:alignItemsVerticallyWithPadding(24)
    self:addChild(menu)
]]--

end


return AdScene
