cclog("==========================================================")

--创建类,继承自ViewBase实质是一个Sence
local Welcome = class("Welcome", cc.load("mvc").ViewBase)

--加载UI类,教程建议用import,用require一样
local WelcomeUI = require "Welcome/WelcomeUI"

--onCreate和cocos中create()原理一样，构造场景对象
function Welcome:onCreate()
-- create UI,是node类型所以直接用create()方法创建成为node
    local UI = WelcomeUI:create()
    UI:addTo(self)

end

cclog("==========================================================")
return Welcome

