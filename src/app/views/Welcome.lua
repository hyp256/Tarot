cclog("==========================================================")

--������,�̳���ViewBaseʵ����һ��Sence
local Welcome = class("Welcome", cc.load("mvc").ViewBase)

--����UI��,�̳̽�����import,��requireһ��
local WelcomeUI = require "Welcome/WelcomeUI"

--onCreate��cocos��create()ԭ��һ�������쳡������
function Welcome:onCreate()
-- create UI,��node��������ֱ����create()����������Ϊnode
    local UI = WelcomeUI:create()
    UI:addTo(self)

end

cclog("==========================================================")
return Welcome

