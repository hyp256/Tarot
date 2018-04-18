
local share_plugin = nil

local function onShareResult(code, msg)
    print("on share result listener.")
    print("code:"..code..",msg:"..msg)
    if code == ShareResultCode.kShareSuccess then
        --do
    elseif code == ShareResultCode.kShareFail then
        --do
    elseif code == ShareResultCode.kShareCancel then
        --do
    elseif code == ShareResultCode.kShareNetworkError then
        --do
    end
end

Share = class()
function Share:ctor()
	share_plugin = AgentManager:getInstance():getSharePlugin()
	if share_plugin ~= nil then
	    share_plugin:setResultListener(onShareResult)
	end
end

function Share:share()
	if share_plugin ~= nil then
        local info = {
            --标题
            title = "Tarot真有趣",
            --标题链接
            --titleUrl = "http://sharesdk.cn",

            --分享此内容的网站名称
            site = "Tarot",
            --分享此内容的网站链接
            --siteUrl = "http://sharesdk.cn",

            --分享内容
            text = "我刚玩了Tarot,很有趣哦,来看看吧",
            --评论
            comment = "无",
        }
        share_plugin:share(info)
	end
end