cclog("Shuffle1==========================================================")

--������,�̳���ViewBaseʵ����һ��Sence
local Shuffle1 = class("Shuffle1", cc.load("mvc").ViewBase)

--����UI��,�̳̽�����import,��requireһ��
local Shuffle1UI = require "Shuffle/Shuffle1UI"

--����TarotSprite
local TarotSprite = require "TarotSprite"


--onCreate��cocos��create()ԭ��һ�������쳡������
function Shuffle1:onCreate()
-- create UI,��node��������ֱ����create()����������Ϊnode
    local UI = Shuffle1UI:create()
    UI:addTo(self)

--��ť״̬,���ã�������,�����ã���ѡ��,���˶��굽��λ��p1,Ӧ�õ����λ��p2,����֮��ĳ���pL
    local Ui_Shuffle_Button_State_beforecallback = UI_BUTTON_STATE_SELECT_BEFORECALLBACK
    local Ui_Shuffle_Button_State_aftercallback = UI_BUTTON_STATE_NORMAL_AFTERCALLBACK
    local p1 = cc.p(0.0,0.0)
    local p2 = cc.p(0.0,0.0)
    local pL = 0.0

-- create ShuffleTarotLayer
    local function ShuffleTarotLayer()
        local ShuffleTarotLayer = cc.Layer:create()
        ShuffleTarotLayer:addTo(self)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
        --[[
        ȫ�ֱ�:
               TarotTable:["TarotNum"]�����Ƶ�����,["UprightOrDownright"]����������λ
               TarotSpriteTable:["TarotSprite"]������SpriteTag
        ]]--
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
--        TarotTable = {}
--        TarotSpriteTable = {}
        for TableNum = 0,(TAROT_LAST - TAROT_FIRST) do
            local TarotSprite = TarotSprite:create("Photos/Tarot/TAROTBACK.png")
            TarotSprite:setPosition(ORIGIN.x + WIN_SIZE.width/2, ORIGIN.y + WIN_SIZE.height*4/9)
            ShuffleTarotLayer:addChild(TarotSprite,(TAROT_LAST - TAROT_FIRST + 1) - TableNum)

            TarotSpriteTable[TableNum] = TarotSprite
            p2 = cc.p(ORIGIN.x + WIN_SIZE.width/2 - TableNum*WIN_SIZE.width/64, ORIGIN.y + WIN_SIZE.height*4/9)
            local MoveLeft = cc.MoveTo:create(1.0,p2)
            local ShufflePart1Action = cc.Sequence:create(MoveLeft)
            TarotSpriteTable[TableNum]:runAction(ShufflePart1Action)
            
            --��ʼ������Ԫ��,ֱ�������������
            TarotTable[TableNum] = {["TarotNum"] = TableNum,["UprightOrDownright"] = TarotSpriteTable[TableNum].UprightOrDownright}
        end

        local n = 21
        local k = 100 --�Ĵ����
        for i = n,0,-1 do
            --���һ����¼����ʱ����,��Χ��С
            local temp = math.random(0, i)
            --����Ĵ�
            TarotTable[100] = TarotTable[temp]
            --���Ԫ�����������¼����λ��
            TarotTable[temp] = TarotTable[i]
            TarotTable[i] = TarotTable[100]
            TarotSpriteTable[i].TarotNum = TarotTable[100].TarotNum
            TarotSpriteTable[i].UprightOrDownright = TarotTable[100].UprightOrDownright
        end

    end

function Shuffle1:regDivineMenu()
    --��һ��ϴ��ѡ��
    local function Reflush_Shuffle(Sprite)
        for TableNum = 0,(TAROT_LAST - TAROT_FIRST) do
            TarotSpriteTable[TableNum]:setPosition(ORIGIN.x + WIN_SIZE.width/2, ORIGIN.y + WIN_SIZE.height*4/9)
            local MoveLeft = cc.MoveTo:create(1.0,cc.p(ORIGIN.x + WIN_SIZE.width/2 - TableNum*WIN_SIZE.width/64, ORIGIN.y + WIN_SIZE.height*4/9))
            local ShufflePart1Action = cc.Sequence:create(MoveLeft)
            TarotSpriteTable[TableNum]:runAction(ShufflePart1Action)
        end
        Ui_Shuffle_Button_State_aftercallback = UI_BUTTON_STATE_NORMAL_AFTERCALLBACK
    end

    --ˢ�����Ƿ�λ,��λ��ı䰴ť״̬
    local function Reflush_Shuffle_isDone()
        p1 = cc.p(TarotSpriteTable[TAROT_LAST - TAROT_FIRST]:getPosition())
        pL = cc.pGetLength(cc.pSub(p1,p2))
        if pL <= 0.5 then
            Ui_Shuffle_Button_State_beforecallback = UI_BUTTON_STATE_NORMAL_BEFORECALLBACK
        else Ui_Shuffle_Button_State_beforecallback = UI_BUTTON_STATE_SELECT_BEFORECALLBACK
        end
    end

    local function Shuffle_Top(ref,type)
        if type == ccui.TouchEventType.ended then
            Reflush_Shuffle_isDone()

            if Ui_Shuffle_Button_State_beforecallback == UI_BUTTON_STATE_NORMAL_BEFORECALLBACK and Ui_Shuffle_Button_State_aftercallback == UI_BUTTON_STATE_NORMAL_AFTERCALLBACK then
                Ui_Shuffle_Button_State_aftercallback = UI_BUTTON_STATE_SELECT_AFTERCALLBACK
                local i_First = 5
                local i_Last = 9
                for i = i_First, i_Last do
                    local MoveUp = cc.MoveBy:create(1.0,cc.p(0,ORIGIN.y + WIN_SIZE.height*2/9))
                    local MoveRight = cc.MoveBy:create(1.0,cc.p(ORIGIN.x + WIN_SIZE.width*3/8,0))
                    local MoveDown = cc.MoveBy:create(1.0,cc.p(0,ORIGIN.y - WIN_SIZE.height*2/9))
                    local Reflush_ShuffleCallFunc = cc.CallFunc:create(Reflush_Shuffle)
                    local ShufflePart1Action
                    if i ~= i_Last then
                    ShufflePart1Action = cc.Sequence:create(MoveUp,MoveRight,MoveDown)
                    else
                    ShufflePart1Action = cc.Sequence:create(MoveUp,MoveRight,MoveDown,Reflush_ShuffleCallFunc)
                    end
                    TarotSpriteTable[i]:runAction(ShufflePart1Action)
                    TarotTable[100] = TarotTable[i-5]
                    TarotTable[i-5] = TarotTable[i]
                    TarotTable[i] = TarotTable[100]
                end
            end
        end
    end

    local function Shuffle_Center(ref,type)
        if type == ccui.TouchEventType.ended then
            Reflush_Shuffle_isDone()

            if Ui_Shuffle_Button_State_beforecallback == UI_BUTTON_STATE_NORMAL_BEFORECALLBACK and Ui_Shuffle_Button_State_aftercallback == UI_BUTTON_STATE_NORMAL_AFTERCALLBACK then
                Ui_Shuffle_Button_State_aftercallback = UI_BUTTON_STATE_SELECT_AFTERCALLBACK
                local i_First = 11
                local i_Last = 15                
                for i = i_First, i_Last do
                    local MoveUp = cc.MoveBy:create(1.0,cc.p(0,ORIGIN.y + WIN_SIZE.height*2/9))
                    local MoveRight = cc.MoveBy:create(1.0,cc.p(ORIGIN.x + WIN_SIZE.width/2,0))
                    local MoveDown = cc.MoveBy:create(1.0,cc.p(0,ORIGIN.y - WIN_SIZE.height*2/9))
                    local Reflush_ShuffleCallFunc = cc.CallFunc:create(Reflush_Shuffle)
                    local ShufflePart1Action
                    if i ~= i_Last then
                    ShufflePart1Action = cc.Sequence:create(MoveUp,MoveRight,MoveDown)
                    else
                    ShufflePart1Action = cc.Sequence:create(MoveUp,MoveRight,MoveDown,Reflush_ShuffleCallFunc)
                    end
                    TarotSpriteTable[i]:runAction(ShufflePart1Action)
                    TarotTable[100 + i] = TarotTable[i]
                end

                for i = 10, 0, -1 do
                    TarotTable[i + 5] = TarotTable[i]
                end

                for i = 11, 15 do
                    TarotTable[i - 11] = TarotTable[100 + i]
                end
            end
        end
    end

    local function Shuffle_Bottom(ref,type)
        if type == ccui.TouchEventType.ended then
            Reflush_Shuffle_isDone()

            if Ui_Shuffle_Button_State_beforecallback == UI_BUTTON_STATE_NORMAL_BEFORECALLBACK and Ui_Shuffle_Button_State_aftercallback == UI_BUTTON_STATE_NORMAL_AFTERCALLBACK then
                Ui_Shuffle_Button_State_aftercallback = UI_BUTTON_STATE_SELECT_AFTERCALLBACK
                local i_First = 17
                local i_Last = 21
                for i = i_First, i_Last do
                    local MoveUp = cc.MoveBy:create(1.0,cc.p(0,ORIGIN.y + WIN_SIZE.height*2/9))
                    local MoveRight = cc.MoveBy:create(1.0,cc.p(ORIGIN.x + WIN_SIZE.width*5/9,0))
                    local MoveDown = cc.MoveBy:create(1.0,cc.p(0,ORIGIN.y - WIN_SIZE.height*2/9))
                    local Reflush_ShuffleCallFunc = cc.CallFunc:create(Reflush_Shuffle)
                    local ShufflePart1Action
                    if i ~= i_Last then
                    ShufflePart1Action = cc.Sequence:create(MoveUp,MoveRight,MoveDown)
                    else
                    ShufflePart1Action = cc.Sequence:create(MoveUp,MoveRight,MoveDown,Reflush_ShuffleCallFunc)
                    end
                    TarotSpriteTable[i]:runAction(ShufflePart1Action)
                    TarotTable[100 + i] = TarotTable[i]
                end

                for i = 16, 0, -1 do
                    TarotTable[i + 5] = TarotTable[i]
                end

                for i = 17, 21 do
                    TarotTable[i - 17] = TarotTable[100 + i]
                end
            end
        end
    end

    local function ReplaceToShuffle2Scene()
        package.loaded["Shuffle/Shuffle2"]  = nil
        self:getApp():enterScene("Shuffle/Shuffle2")
        for k,v in pairs(TarotTable) do
            print(k)
            if type(v) == "table" then
                for i,j in pairs(v) do
                    print(i,j)
                end
            end
        end
        print("DIVINE:"..DIVINE)
        print("Shuffle1----------------------------------------------------------line138")
    end
        
    local function ShufflePart1_Next(ref,type)
        if type == ccui.TouchEventType.ended then
            ReplaceToShuffle2Scene()
        end
    end

    UI:getMenuItem("shuffleTopItem"):addTouchEventListener(Shuffle_Top)
    UI:getMenuItem("shuffleCenterItem"):addTouchEventListener(Shuffle_Center)
    UI:getMenuItem("shuffleBottomItem"):addTouchEventListener(Shuffle_Bottom)
    UI:getMenuItem("shuffleNextItem"):addTouchEventListener(ShufflePart1_Next)
end


    ShuffleTarotLayer()
    self:regDivineMenu()

    for k,v in pairs(TarotTable) do
        print(k)
        if type(v) == "table" then
            for i,j in pairs(v) do
                print(i,j)
            end
        end
    end
    print("Shuffle1----------------------------------------------------------line209")
end

cclog("Shuffle1==========================================================")
return Shuffle1
