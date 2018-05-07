cclog("End==========================================================")

--������,�̳���ViewBaseʵ����һ��Sence
local End = class("End", cc.load("mvc").ViewBase)

--����UI��,�̳̽�����import,��requireһ��
local EndUI = require "End/EndUI"



--onCreate��cocos��create()ԭ��һ�������쳡������
function End:onCreate()
-- create UI,��node��������ֱ����create()����������Ϊnode
    local UI = EndUI:create()
    UI:addTo(self)

    -- create Menu
    function End:regMenuItem()
        local function ReplaceToAnswer1Scene(ref,type)
            if type == ccui.TouchEventType.ended then
                self:getApp():enterScene("Answer/Answer1")
            end
        end

        local function ReplaceToBeginScene(ref,type)
            if type == ccui.TouchEventType.ended then
                self:getApp():enterScene("Begin/Begin")
            end
        end
 
        UI:getMenuItem("backToAnswer1Item"):addTouchEventListener(ReplaceToAnswer1Scene)    
        UI:getMenuItem("backToBeginItem"):addTouchEventListener(ReplaceToBeginScene)
    end

    self:regMenuItem()
end

cclog("End==========================================================")
return End

