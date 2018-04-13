cclog("Shuffle2==========================================================")

--创建类,继承自ViewBase实质是一个Sence
local Shuffle2 = class("Shuffle2", cc.load("mvc").ViewBase)

--加载UI类,教程建议用import,用require一样
local Shuffle2UI = require "Shuffle/Shuffle2UI"

--加载TarotSprite
local TarotSprite = require "TarotSprite"


--onCreate和cocos中create()原理一样，构造场景对象
function Shuffle2:onCreate()
-- create UI,是node类型所以直接用create()方法创建成为node
    local UI = Shuffle2UI:create()
    UI:addTo(self)

--按钮状态,可用（正常）,不可用（已选）,牌运动完到的位置p1,应该到达的位置p2,两点之间的长度pL
    local Ui_Shuffle_Button_State_beforecallback = UI_BUTTON_STATE_SELECT_BEFORECALLBACK
    local Ui_Shuffle_Button_State_aftercallback = UI_BUTTON_STATE_NORMAL_AFTERCALLBACK
    local p1 = cc.p(0.0,0.0)
    local p2 = cc.p(0.0,0.0)
    local pL = 0.0

    local function ShuffleTarotLayer()
        local ShuffleTarotLayer = cc.Layer:create()
        ShuffleTarotLayer:addTo(UI,UI_LAYERZORDER_MID)

        local cocosAngleTable = {}

        local function ShuffleRotation(Sprite,AngleTable)
        Sprite:setRotation(AngleTable["cocosAngle"])
        end

        for TableNum = 0,(TAROT_LAST - TAROT_FIRST) do
            TarotSpriteTable[TableNum] = TarotSprite:create("Photos/Tarot/TAROTBACK.png")
            TarotSpriteTable[TableNum]:setPosition(ORIGIN.x + WIN_SIZE.width*2/3, ORIGIN.y + WIN_SIZE.height*4/9)
            ShuffleTarotLayer:addChild(TarotSpriteTable[TableNum],(TAROT_LAST - TAROT_FIRST + 1) - TableNum)

            local cocosAngle = 60
            cocosAngle = cocosAngle - TableNum*5
            cocosAngleTable[TableNum] = {["cocosAngle"] = cocosAngle}
            p2 = cc.p(ORIGIN.x + WIN_SIZE.width*2/3 - TableNum*WIN_SIZE.width/64, ORIGIN.y + WIN_SIZE.height*4/9)
            local MoveLeft = cc.MoveTo:create(1.0,p2)
            local ShuffleRotationCallFunc = cc.CallFunc:create(ShuffleRotation,cocosAngleTable[TableNum])
            local ShufflePart2Action = cc.Sequence:create(MoveLeft,ShuffleRotationCallFunc)
            TarotSpriteTable[TableNum]:runAction(ShufflePart2Action)
        end

    end

function Shuffle2:regDivineMenu()
    --第二步洗牌选择
    local cocosAngleTable = {}
    local insertMenuPanel = Shuffle2UI:getMenuItem("insertMenuPanel")

    local function Button_StateReturn(Sprite)
    Ui_Shuffle_Button_State_aftercallback = UI_BUTTON_STATE_NORMAL_AFTERCALLBACK*2
    end

    local function ShuffleRotation(Sprite,AngleTable)
    Sprite:setRotation(AngleTable["cocosAngle"])
    end

    local function Reflush_Shuffle(Sprite)
        for TableNum = 0,(TAROT_LAST - TAROT_FIRST) do
            local cocosAngle = 0

            cocosAngleTable[TableNum] = {["cocosAngle"] = cocosAngle}

            ShuffleRotation(TarotSpriteTable[TableNum],cocosAngleTable[TableNum])
            TarotSpriteTable[TableNum]:setPosition(ORIGIN.x + WIN_SIZE.width*2/3, ORIGIN.y + WIN_SIZE.height*4/9)

            local cocosAngle = 60
            cocosAngle = cocosAngle - TableNum*5
            cocosAngleTable[TableNum] = {["cocosAngle"] = cocosAngle}
            local MoveLeft = cc.MoveTo:create(1.0,cc.p(ORIGIN.x + WIN_SIZE.width*2/3 - TableNum*WIN_SIZE.width/64, ORIGIN.y + WIN_SIZE.height*4/9))
            local ShuffleRotationCallFunc = cc.CallFunc:create(ShuffleRotation,cocosAngleTable[TableNum])
            local ShufflePart2Action = cc.Sequence:create(MoveLeft,ShuffleRotationCallFunc)
            TarotSpriteTable[TableNum]:runAction(ShufflePart2Action)

        end
        Ui_Shuffle_Button_State_aftercallback = UI_BUTTON_STATE_NORMAL_AFTERCALLBACK
    end

    --刷新牌是否到位,到位后改变按钮状态
    local function Reflush_Shuffle_isDone()
        p1 = cc.p(TarotSpriteTable[TAROT_LAST - TAROT_FIRST]:getPosition())
        pL = cc.pGetLength(cc.pSub(p1,p2))
        if pL <= 0.5 then
            Ui_Shuffle_Button_State_beforecallback = UI_BUTTON_STATE_NORMAL_BEFORECALLBACK
        else Ui_Shuffle_Button_State_beforecallback = UI_BUTTON_STATE_SELECT_BEFORECALLBACK
        end
    end

    local function ShuffleChoose_Top(ref,type)
        if type == ccui.TouchEventType.ended then
            Reflush_Shuffle_isDone()

            if Ui_Shuffle_Button_State_beforecallback == UI_BUTTON_STATE_NORMAL_BEFORECALLBACK and Ui_Shuffle_Button_State_aftercallback == UI_BUTTON_STATE_NORMAL_AFTERCALLBACK then
                Ui_Shuffle_Button_State_aftercallback = UI_BUTTON_STATE_SELECT_AFTERCALLBACK
                local Temp = 0
                local i_First = 5
                local i_Last = 9
                for i = i_First, i_Last do
                    local MoveUp = cc.MoveBy:create(1.0,cc.p(0,ORIGIN.y + WIN_SIZE.height*2/9))
                    cocosAngleTable[i] = {["cocosAngle"] = 0}
                    local ShuffleChooseRotation_NormalCallFunc = cc.CallFunc:create(ShuffleRotation,cocosAngleTable[i])

                    local Button_StateReturnCallFunc = cc.CallFunc:create(Button_StateReturn)
                    local ShufflePart2Action
                    if i ~= i_Last then
                    ShufflePart2Action = cc.Sequence:create(ShuffleChooseRotation_NormalCallFunc,MoveUp)
                    else
                    ShufflePart2Action = cc.Sequence:create(ShuffleChooseRotation_NormalCallFunc,MoveUp,Button_StateReturnCallFunc)
                    end

                    TarotSpriteTable[i]:runAction(ShufflePart2Action)
                    TarotSpriteTable[200 + Temp] = TarotSpriteTable[i]
                    TarotTable[100 + Temp] = TarotTable[i]
                    Temp = Temp + 1
                end

                for i = 10, 21 do
                    TarotTable[i - 5] = TarotTable[i]
                end

            insertMenuPanel:setPosition(insertMenuPanel:getParent():getContentSize().width * 0.85, insertMenuPanel:getParent():getContentSize().height * 0.65)
            insertMenuPanel:setVisible(true)

            end
        end  
    end

    local function ShuffleChoose_Center(ref,type)
        if type == ccui.TouchEventType.ended then
            Reflush_Shuffle_isDone()

            if Ui_Shuffle_Button_State_beforecallback == UI_BUTTON_STATE_NORMAL_BEFORECALLBACK and Ui_Shuffle_Button_State_aftercallback == UI_BUTTON_STATE_NORMAL_AFTERCALLBACK then
                Ui_Shuffle_Button_State_aftercallback = UI_BUTTON_STATE_SELECT_AFTERCALLBACK
                local Temp = 0
                local i_First = 11
                local i_Last = 15
                for i = i_First, i_Last do
                    local MoveUp = cc.MoveBy:create(1.0,cc.p(0,ORIGIN.y + WIN_SIZE.height*2/9))
                    cocosAngleTable[i] = {["cocosAngle"] = 0}
                    local ShuffleChooseRotation_NormalCallFunc = cc.CallFunc:create(ShuffleRotation,cocosAngleTable[i])

                    local Button_StateReturnCallFunc = cc.CallFunc:create(Button_StateReturn)
                    local ShufflePart2Action
                    if i ~= i_Last then
                    ShufflePart2Action = cc.Sequence:create(ShuffleChooseRotation_NormalCallFunc,MoveUp)
                    else
                    ShufflePart2Action = cc.Sequence:create(ShuffleChooseRotation_NormalCallFunc,MoveUp,Button_StateReturnCallFunc)
                    end

                    TarotSpriteTable[i]:runAction(ShufflePart2Action)
                    TarotSpriteTable[200 + Temp] = TarotSpriteTable[i]
                    TarotTable[100 + Temp] = TarotTable[i]
                    Temp = Temp + 1
                end

                for i = 16, 21 do
                    TarotTable[i - 5] = TarotTable[i]
                end

            insertMenuPanel:setPosition(insertMenuPanel:getParent():getContentSize().width * 0.85, insertMenuPanel:getParent():getContentSize().height * 0.35)
            insertMenuPanel:setVisible(true)

            end
        end
    end

    local function ShuffleChoose_Bottom(ref,type)
        if type == ccui.TouchEventType.ended then
            Reflush_Shuffle_isDone()

            if Ui_Shuffle_Button_State_beforecallback == UI_BUTTON_STATE_NORMAL_BEFORECALLBACK and Ui_Shuffle_Button_State_aftercallback == UI_BUTTON_STATE_NORMAL_AFTERCALLBACK then
                Ui_Shuffle_Button_State_aftercallback = UI_BUTTON_STATE_SELECT_AFTERCALLBACK
                local Temp = 0
                local i_First = 17
                local i_Last = 21
                for i = i_First, i_Last do
                    local MoveUp = cc.MoveBy:create(1.0,cc.p(0,ORIGIN.y + WIN_SIZE.height*2/9))
                    cocosAngleTable[i] = {["cocosAngle"] = 0}
                    local ShuffleChooseRotation_NormalCallFunc = cc.CallFunc:create(ShuffleRotation,cocosAngleTable[i])

                    local Button_StateReturnCallFunc = cc.CallFunc:create(Button_StateReturn)
                    local ShufflePart2Action
                    if i ~= i_Last then
                    ShufflePart2Action = cc.Sequence:create(ShuffleChooseRotation_NormalCallFunc,MoveUp)
                    else
                    ShufflePart2Action = cc.Sequence:create(ShuffleChooseRotation_NormalCallFunc,MoveUp,Button_StateReturnCallFunc)
                    end
                   
                    TarotSpriteTable[i]:runAction(ShufflePart2Action)
                    TarotSpriteTable[200 + Temp] = TarotSpriteTable[i]
                    TarotTable[100 + Temp] = TarotTable[i]
                    Temp = Temp + 1
                end

            insertMenuPanel:setPosition(insertMenuPanel:getParent():getContentSize().width * 0.85, insertMenuPanel:getParent():getContentSize().height * 0.05)
            insertMenuPanel:setVisible(true)

            end
        end
    end

    local function ShuffleInsert_Top(ref,type)
        if type == ccui.TouchEventType.ended then
            local i_First = 0
            local i_Last = 4
            if Ui_Shuffle_Button_State_aftercallback == UI_BUTTON_STATE_NORMAL_AFTERCALLBACK*2 then
                for i = i_First, i_Last do
                    local MoveTop = cc.MoveTo:create(1.0,cc.p(ORIGIN.x + WIN_SIZE.width*8/9 - i*WIN_SIZE.width/64, ORIGIN.y + WIN_SIZE.height*6/9))
                    local MoveDown = cc.MoveBy:create(1.0,cc.p(0,ORIGIN.y - WIN_SIZE.height*2/9))
                    local Reflush_ShuffleCallFunc = cc.CallFunc:create(Reflush_Shuffle)
                    local ShufflePart2Action
                    if i ~= i_Last then
                    ShufflePart2Action = cc.Sequence:create(MoveTop,MoveDown)
                    else
                    ShufflePart2Action = cc.Sequence:create(MoveTop,MoveDown,Reflush_ShuffleCallFunc)
                    end

                    TarotSpriteTable[200 + i]:runAction(ShufflePart2Action)
                end

                for i = 16, 0, -1 do
                    TarotTable[i + 5] = TarotTable[i]
                end

                for i = 0, 4 do
                    TarotTable[i] = TarotTable[100 + i]
                end

            insertMenuPanel:setVisible(false)

            end
        end
    end

    local function ShuffleInsert_Center(ref,type)
        if type == ccui.TouchEventType.ended then
            local i_First = 0
            local i_Last = 4
            if Ui_Shuffle_Button_State_aftercallback == UI_BUTTON_STATE_NORMAL_AFTERCALLBACK*2 then
                for i = i_First, i_Last do
                    local MoveCenter = cc.MoveTo:create(1.0,cc.p(ORIGIN.x + WIN_SIZE.width*5/9 - i*WIN_SIZE.width/64, ORIGIN.y + WIN_SIZE.height*6/9))
                    local MoveDown = cc.MoveBy:create(1.0,cc.p(0,ORIGIN.y - WIN_SIZE.height*2/9))
                    local Reflush_ShuffleCallFunc = cc.CallFunc:create(Reflush_Shuffle)
                    local ShufflePart2Action
                    if i ~= i_Last then
                    ShufflePart2Action = cc.Sequence:create(MoveCenter,MoveDown)
                    else
                    ShufflePart2Action = cc.Sequence:create(MoveCenter,MoveDown,Reflush_ShuffleCallFunc)
                    end

                    TarotSpriteTable[200 + i]:runAction(ShufflePart2Action)
                end

                for i = 16, 9, -1 do
                    TarotTable[i + 5] = TarotTable[i]
                end

                local Temp = 0
                for i = 9, 13 do
                    TarotTable[i] = TarotTable[100 + Temp]
                    Temp = Temp + 1
                end

            insertMenuPanel:setVisible(false)

            end
        end
    end

    local function ShuffleInsert_Bottom(ref,type)
        if type == ccui.TouchEventType.ended then
            local i_First = 0
            local i_Last = 4
            if Ui_Shuffle_Button_State_aftercallback == UI_BUTTON_STATE_NORMAL_AFTERCALLBACK*2 then
                for i = i_First, i_Last do
                    local MoveBottom = cc.MoveTo:create(1.0,cc.p(ORIGIN.x + WIN_SIZE.width*2/9 - i*WIN_SIZE.width/64, ORIGIN.y + WIN_SIZE.height*6/9))
                    local MoveDown = cc.MoveBy:create(1.0,cc.p(0,ORIGIN.y - WIN_SIZE.height*2/9))

                    local Reflush_ShuffleCallFunc = cc.CallFunc:create(Reflush_Shuffle)
                    local ShufflePart2Action
                    if i ~= i_Last then
                    ShufflePart2Action = cc.Sequence:create(MoveBottom,MoveDown)
                    else
                    ShufflePart2Action = cc.Sequence:create(MoveBottom,MoveDown,Reflush_ShuffleCallFunc)
                    end

                    TarotSpriteTable[200 + i]:runAction(ShufflePart2Action)
                end

                local Temp = 0
                for i = 17, 21 do
                    TarotTable[i] = TarotTable[100 + Temp]
                    Temp = Temp + 1
                end

            insertMenuPanel:setVisible(false)

            end
        end
    end

    local function ReplaceToChoiceScene()
        package.loaded["Choice/Choice"]  = nil
        self:getApp():enterScene("Choice/Choice")

        for k,v in pairs(TarotTable) do
            print(k)
            if type(v) == "table" then
                for i,j in pairs(v) do
                    print(i,j)
                end
            end
        end
        print("DIVINE:"..DIVINE)
        print("Shuffle2----------------------------------------------------------line270")
    end

    local function ShufflePart2_Next(ref,type)
        if type == ccui.TouchEventType.ended then
            ReplaceToChoiceScene()
        end
    end

    UI:getMenuItem("shuffleTopChooseItem"):addTouchEventListener(ShuffleChoose_Top)
    UI:getMenuItem("shuffleCenterChooseItem"):addTouchEventListener(ShuffleChoose_Center)
    UI:getMenuItem("shuffleBottomChooseItem"):addTouchEventListener(ShuffleChoose_Bottom)
    UI:getMenuItem("shuffleTopInsertItem"):addTouchEventListener(ShuffleInsert_Top)
    UI:getMenuItem("shuffleCenterInsertItem"):addTouchEventListener(ShuffleInsert_Center)
    UI:getMenuItem("shuffleBottomInsertItem"):addTouchEventListener(ShuffleInsert_Bottom)
    UI:getMenuItem("shuffleEndItem"):addTouchEventListener(ShufflePart2_Next)
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
    print("Shuffle2----------------------------------------------------------line340")
end

cclog("Shuffle2==========================================================")
return Shuffle2
