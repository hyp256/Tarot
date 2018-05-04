
local user_plugin = nil
local iap_plugin_maps = nil

local function onUserResult( plugin, code, msg )
    print("on user action listener.")
    print("code:"..code..",msg:"..msg)
    if code == UserActionResultCode.kInitSuccess then
        --do
    elseif code == UserActionResultCode.kInitFail then
        --do
    elseif code == UserActionResultCode.kLoginSuccess then
        --do
    elseif code == UserActionResultCode.kLoginNetworkError then
        --do
    elseif code == UserActionResultCode.kLoginNoNeed then
        --do
    elseif code == UserActionResultCode.kLoginFail then
        --do
    elseif code == UserActionResultCode.kLoginCancel then
        --do
    elseif code == UserActionResultCode.kLogoutSuccess then
        --do
    elseif code == UserActionResultCode.kLogoutFail then
        --do
    elseif code == UserActionResultCode.kPlatformEnter then
        --do
    elseif code == UserActionResultCode.kPlatformBack then
        --do
    elseif code == UserActionResultCode.kPausePage then
        --do
    elseif code == UserActionResultCode.kExitPage then
        --do
    elseif code == UserActionResultCode.kAntiAddictionQuery then
        --do
    elseif code == UserActionResultCode.kRealNameRegister then
        --do
    elseif code == UserActionResultCode.kAccountSwitchSuccess then
        --do
    elseif code == UserActionResultCode.kAccountSwitchFail then
        --do
    elseif code == UserActionResultCode.kOpenShop then
        --do
    end
end

local function onPayResult( code, msg, info )
    print("on iap result listener.")
    print("code:"..code..",msg:"..msg)
    if code == PayResultCode.kPaySuccess then
        --do
    elseif code == PayResultCode.kPayFail then
        --do
    elseif code == PayResultCode.kPayCancel then
        --do
    elseif code == PayResultCode.kPayNetworkError then
        --do
    elseif code == PayResultCode.kPayProductionInforIncomplete then
        --do
    elseif code == PayResultCode.kPayInitSuccess then
        --do
    elseif code == PayResultCode.kPayInitFail then
        --do
    elseif code == PayResultCode.kPayNowPaying then
        --do
    elseif code == PayResultCode.kPayRechargeSuccess then
        --do
    end
end

PluginChannel = class()
function PluginChannel:ctor()
    --for anysdk
    local agent = AgentManager:getInstance()
    --init
    --anysdk //c++层初始化
    local appKey = "A39145B1-D831-BCED-E5A2-589AAD41F747";
    local appSecret = "a5a8008fa444edd8028acb38e75e26fb";
    local privateKey = "35A3CD91B0C12DD15DE0C29FA96ADDDA";

    local oauthLoginServer = "http://oauth.anysdk.com/api/OauthLoginDemo/Login.php";
    agent:init(appKey,appSecret,privateKey,oauthLoginServer)
    --load
    agent:loadAllPlugins()

    -- get user plugin
    user_plugin = agent:getUserPlugin()
    if user_plugin ~= nil then
        user_plugin:setActionListener(onUserResult)
    end

    iap_plugin_maps = agent:getIAPPlugin()
    for key, value in pairs(iap_plugin_maps) do
        print("key:" .. key)
        print("value: " .. type(value))
        value:setResultListener(onPayResult)
    end

    agent:setIsAnaylticsEnabled(true)
end

function PluginChannel:login()
	if user_plugin ~= nil then
        user_plugin:setActionListener(onUserResult)
	    user_plugin:login()
	end
end

function PluginChannel:logout()
	if user_plugin ~= nil then
        if user_plugin:isFunctionSupported("logout") then
            user_plugin:callFuncWithParam("logout")
        end
	end
end

function PluginChannel:enterPlatform()
	if user_plugin ~= nil then
        if user_plugin:isFunctionSupported("enterPlatform") then
            user_plugin:callFuncWithParam("enterPlatform")
        end
	end
end

function PluginChannel:showToolBar()
	if user_plugin ~= nil then
	    if user_plugin:isFunctionSupported("showToolBar") then
	        local param1 = PluginParam:create(ToolBarPlace.kToolBarTopLeft)
	        user_plugin:callFuncWithParam("showToolBar", param1)
	    end
	end
end

function PluginChannel:hideToolBar()
	if user_plugin ~= nil then
        if user_plugin:isFunctionSupported("hideToolBar") then
            user_plugin:callFuncWithParam("hideToolBar")
        end
	end
end

function PluginChannel:accountSwitch()
	if user_plugin ~= nil then
        if user_plugin:isFunctionSupported("accountSwitch") then
            user_plugin:callFuncWithParam("accountSwitch")
        end
	end
end

function PluginChannel:realNameRegister()
	if user_plugin ~= nil then
        if user_plugin:isFunctionSupported("realNameRegister") then
            user_plugin:callFuncWithParam("realNameRegister")
        end
	end
end

function PluginChannel:antiAddictionQuery()
	if user_plugin ~= nil then
        if user_plugin:isFunctionSupported("antiAddictionQuery") then
            user_plugin:callFuncWithParam("antiAddictionQuery")
        end
	end
end

function PluginChannel:submitLoginGameRole()
	if user_plugin ~= nil then
        if user_plugin:isFunctionSupported("submitLoginGameRole") then
            local data = PluginParam:create({roleId="123456",roleName="test",roleLevel="10",zoneId="123",zoneName="test",dataType="1",ext="login"})
            user_plugin:callFuncWithParam("submitLoginGameRole", data)
        end
	end
end

function PluginChannel:pay()
	if iap_plugin_maps ~= nil then
        local info = {
                Product_Price="0.1", 
                Product_Id="monthly",  
                Product_Name="gold",  
                Server_Id="13",  
                Product_Count="1",  
                Role_Id="1001",  
                Role_Name="asd"
            }
        -- analytics_plugin:logEvent("pay", info)
        for key, value in pairs(iap_plugin_maps) do
            print("key:" .. key)
            print("value: " .. type(value))
            value:payForProduct(info)
        end
	end
end