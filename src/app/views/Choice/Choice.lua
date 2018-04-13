cclog("Choice==========================================================")

--������,�̳���ViewBaseʵ����һ��Sence
local Choice = class("Choice", cc.load("mvc").ViewBase)

--����UI��,�̳̽�����import,��requireһ��
local ChoiceUI = require "Choice/ChoiceUI"

--����TarotSprite
local TarotSprite = require "TarotSprite"

--onCreate��cocos��create()ԭ��һ�������쳡������
function Choice:onCreate()
-- create UI,��node��������ֱ����create()����������Ϊnode
    local UI = ChoiceUI:create()
    UI:addTo(self)

--����״̬,���ã�������,�����ã���ѡ��,���˶��굽��λ��p1,Ӧ�õ����λ��p2,����֮��ĳ���pL
    local Ui_Shuffle_Button_State_beforecallback = UI_BUTTON_STATE_SELECT_BEFORECALLBACK
    local p1 = cc.p(0.0,0.0)
    local p2 = cc.p(0.0,0.0)
    local pL = 0.0

-- create menu
function Choice:regDivineMenu()
    local function ReplaceToAnswer1Scene()
        package.loaded["Answer/Answer1"]  = nil
        self:getApp():enterScene("Answer/Answer1")
    end

    --ѡ��
    local function Choice_Next(ref,type)
        if type == ccui.TouchEventType.ended then
            if AnswerTarotTable[3]["UprightOrDownright"] ~= 2 then
                for i = 0,4 do
                    print(AnswerTarotTable[i]["TarotNum"],AnswerTarotTable[i]["UprightOrDownright"])
                end
 
                print(DIVINE)
                print("Choice----------------------------------------------------------line34")

                for i = 0,3 do
                    AnswerTarotTable[4]["TarotNum"] = AnswerTarotTable[i]["TarotNum"] + AnswerTarotTable[4]["TarotNum"]
                end
                local b = AnswerTarotTable[4]["TarotNum"]%10
                print(b)
                local a = (AnswerTarotTable[4]["TarotNum"] - b)/10
                print(a)
                AnswerTarotTable[4]["TarotNum"] = (a + b)%22
                print(AnswerTarotTable[4]["TarotNum"])
                AnswerTarotTable[4]["UprightOrDownright"] = 1

                AnswerTarotTable[4]["TarotSprite"] = TarotSpriteTable[ AnswerTarotTable[4]["TarotNum"] ]

                ReplaceToAnswer1Scene()
            end
        end
    end
    UI:getMenuItem("choiceEndItem"):addTouchEventListener(Choice_Next)
end


-- create ChoiceTarotLayer
    local function ChoiceTarotLayer()
        local ChoiceTarotLayer = cc.Layer:create()
        ChoiceTarotLayer:addTo(UI,UI_LAYERZORDER_TAROT)

        local circle_x = 0.0
        local circle_y = 0.0

        local cocosAngleTable = {}

        local function ChoiceRotation(Sprite,AngleTable)
        Sprite:setRotation(AngleTable["cocosAngle"])
        end

        for TableNum = 0,(TAROT_LAST - TAROT_FIRST) do

            TarotSpriteTable[TableNum] = TarotSprite:create("Photos/Tarot/TAROTBACK.png")

--Բ�ķ��� (x-a)^2 + (y-b)^2 = r^2 ;(a,b)ΪԲ��
            circle_x = WIN_SIZE.width*7/9
            circle_y =( (WIN_SIZE.width*1/3)^2 - (circle_x - WIN_SIZE.width/2)^2 )^0.5

            TarotSpriteTable[TableNum]:setPosition(ORIGIN.x + circle_x, ORIGIN.y + circle_y)
            ChoiceTarotLayer:addChild(TarotSpriteTable[TableNum],(TAROT_LAST - TAROT_FIRST + 1) - TableNum)

            local cocosAngle = 44
            cocosAngle = cocosAngle - TableNum*4
            cocosAngleTable[TableNum] = {["cocosAngle"] = cocosAngle}
            circle_x = WIN_SIZE.width*7/9 - TableNum*WIN_SIZE.width/38
            circle_y =( (WIN_SIZE.width*1/3)^2 - (circle_x - WIN_SIZE.width/2)^2 )^0.5
            p2 = cc.p(ORIGIN.x + circle_x, ORIGIN.y + circle_y)
            local MoveLeft = cc.MoveTo:create(1.0,p2)
            local ChoiceRotationCallFunc = cc.CallFunc:create(ChoiceRotation,cocosAngleTable[TableNum])
            local ChoiceAction = cc.Sequence:create(MoveLeft,ChoiceRotationCallFunc)

            TarotSpriteTable[TableNum]:runAction(ChoiceAction)
        end
    end
     

-- create ChoiceTouchLayer
    local function ChoiceTouchLayer()
        local ChoiceTouchLayer = cc.Layer:create()
        ChoiceTouchLayer:addTo(self)
        local EventDispatcher = ChoiceTouchLayer:getEventDispatcher()
        local ListenerTable = {}

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
        --[[
        ȫ�ֱ�:
               ���Ʊ�
               AnswerTarotTable:["TarotNum"]�����Ƶ�����,["UprightOrDownright"]����������λ["TarotSprite"]������SpriteTag
        ]]--
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
--        AnswerTarotTable = {}
        local AnswerTarotTableNum = 0
        for i = 0,4 do
            AnswerTarotTable[i]= {["TarotNum"] = 0,["UprightOrDownright"] = 2,["TarotSprite"] = cc.Sprite:create()}
        end

        local touchBeginPoint = nil

        --ˢ�����Ƿ�λ,��λ��ı䰴ť״̬
        local function Reflush_Shuffle_isDone()
            p1 = cc.p(TarotSpriteTable[TAROT_LAST - TAROT_FIRST]:getPosition())
            pL = cc.pGetLength(cc.pSub(p1,p2))
            if pL <= 0.5 then
                Ui_Shuffle_Button_State_beforecallback = UI_BUTTON_STATE_NORMAL_BEFORECALLBACK
            else Ui_Shuffle_Button_State_beforecallback = UI_BUTTON_STATE_SELECT_BEFORECALLBACK
            end
        end

        local function onTouchBegan(touch, event)
            Reflush_Shuffle_isDone()

            if AnswerTarotTable[3]["UprightOrDownright"] == 2 and Ui_Shuffle_Button_State_beforecallback == UI_BUTTON_STATE_NORMAL_BEFORECALLBACK then
                --��ȡ�ĵ�ǰ������Ŀ��
                local TouchSprite = event:getCurrentTarget()

                -- ��ȡ��ǰ�������
                local location = touch:getLocation()
                -- ��ȡ��ǰ�����������԰�ť��λ������ 
                local locationInNode = TouchSprite:convertToNodeSpace(location)
                local s = TouchSprite:getContentSize() 
                local rect = cc.rect(0, 0, s.width, s.height)
 
                -- �����Χ�жϼ��
                if cc.rectContainsPoint(rect,locationInNode) then
                local MoveUp = cc.MoveTo:create(1.0,cc.p(TouchSprite:getPositionX(), WIN_SIZE.height*24/25))
                TouchSprite:setRotation(0)
                TouchSprite:runAction(MoveUp)

                cclog("onTouchBegan: %0.2f, %0.2f", location.x, location.y)
                cclog("Choice===============================================line97")
                touchBeginPoint = {x = location.x, y = location.y}

                return true
                else
                return false
                end
            end
        end

        local function onTouchMoved(touch, event)
            local location = touch:getLocation()
            cclog("onTouchMoved: %0.2f, %0.2f", location.x, location.y)
            cclog("Choice===============================================line110")
        end

        local function onTouchEnded(touch, event)
            if AnswerTarotTable[3]["UprightOrDownright"] == 2 then
                local TouchSprite = event:getCurrentTarget()
                for i = 0,21 do

                    if TarotSpriteTable[i] == TouchSprite then
                    EventDispatcher:removeEventListener(ListenerTable[i])
                    AnswerTarotTable[AnswerTarotTableNum]["TarotNum"] = TarotTable[i]["TarotNum"]
                    AnswerTarotTable[AnswerTarotTableNum]["UprightOrDownright"] = TarotTable[i]["UprightOrDownright"]
                    AnswerTarotTable[AnswerTarotTableNum]["TarotSprite"] = TarotSpriteTable[i]
                    AnswerTarotTableNum = AnswerTarotTableNum + 1
                    end
                end
                local location = touch:getLocation()
                cclog("onTouchEnded: %0.2f, %0.2f", location.x, location.y)
                cclog("Choice===============================================line127")
            end

            if AnswerTarotTable[3]["UprightOrDownright"] ~= 2 then
                for i = 0,21 do

                local MoveBack = cc.MoveTo:create(1.0,cc.p(ORIGIN.x + WIN_SIZE.width*8/9, ORIGIN.y + WIN_SIZE.height*2/9))
                TarotSpriteTable[i]:runAction(MoveBack)
                TarotSpriteTable[i]:setRotation(0)
                print("Listener",i)
                end
                
                cclog("Choice===============================================line139")

                AnswerTarotTable[0]["TarotSprite"]:stopAllActions()
                local Move0 = cc.MoveTo:create(1.0,cc.p(ORIGIN.x + WIN_SIZE.width*1/9, ORIGIN.y + WIN_SIZE.height/2))
                AnswerTarotTable[0]["TarotSprite"]:runAction(Move0)

                AnswerTarotTable[1]["TarotSprite"]:stopAllActions()
                local Move1 = cc.MoveTo:create(1.0,cc.p(ORIGIN.x + WIN_SIZE.width*6/9, ORIGIN.y + WIN_SIZE.height/2))
                AnswerTarotTable[1]["TarotSprite"]:runAction(Move1)

                AnswerTarotTable[2]["TarotSprite"]:stopAllActions()
                local Move2 = cc.MoveTo:create(1.0,cc.p(ORIGIN.x + WIN_SIZE.width*7/18, ORIGIN.y + WIN_SIZE.height))
                AnswerTarotTable[2]["TarotSprite"]:runAction(Move2)

                AnswerTarotTable[3]["TarotSprite"]:stopAllActions()
                local Move3 = cc.MoveTo:create(1.0,cc.p(ORIGIN.x + WIN_SIZE.width*7/18, ORIGIN.y))
                AnswerTarotTable[3]["TarotSprite"]:runAction(Move3)

                AnswerTarotTable[4]["TarotSprite"] = TarotSprite:create("Photos/Tarot/TAROTBACK.png")
                AnswerTarotTable[4]["TarotSprite"]:setPosition(cc.p(ORIGIN.x + WIN_SIZE.width*7/18, ORIGIN.y + WIN_SIZE.height/2))
                ChoiceTouchLayer:addChild(AnswerTarotTable[4]["TarotSprite"])

                for k,v in pairs(AnswerTarotTable) do
                    print(k)
                    if type(v) == "table" then
                        for i,j in pairs(v) do
                            print(i,j)
                        end
                    end
                end
            end
        end

        local Listener = cc.EventListenerTouchOneByOne:create()

        ListenerTable[0] = Listener
        Listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
        Listener:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCH_MOVED )
        Listener:registerScriptHandler(onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED )
        Listener:setSwallowTouches(true)
        EventDispatcher:addEventListenerWithSceneGraphPriority(ListenerTable[0], TarotSpriteTable[0])

        for i = 1,21 do

            ListenerTable[i] = Listener:clone()
            ListenerTable[i]:setSwallowTouches(true)
            EventDispatcher:addEventListenerWithSceneGraphPriority(ListenerTable[i], TarotSpriteTable[i])
        end
    end


    ChoiceTarotLayer()
    ChoiceTouchLayer()
    self:regDivineMenu()
end

cclog("Choice==========================================================")
return Choice

