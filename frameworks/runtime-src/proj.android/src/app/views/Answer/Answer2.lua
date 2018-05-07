cclog("Answer2==========================================================")

--创建类,继承自ViewBase实质是一个Sence
local Answer2 = class("Answer2", cc.load("mvc").ViewBase)

--加载UI类,教程建议用import,用require一样
local Answer2UI = require "Answer/Answer2UI"

--加载TarotSprite
local TarotSprite = require "TarotSprite"

--onCreate和cocos中create()原理一样，构造场景对象
function Answer2:onCreate()
-- create UI,是node类型所以直接用create()方法创建成为node
    local UI = Answer2UI:create()
    UI:addTo(self)


    -- create Answer2TarotLayer
    local function Answer2TarotLayer()
        local Answer2TarotLayer = cc.Layer:create()
        Answer2TarotLayer:addTo(UI,UI_LAYERZORDER_TAROT)
        AnswerTarotTable[1]["TarotSprite"] = TarotSprite:create("Photos/Tarot/TAROTBACK.png")
        AnswerTarotTable[1]["TarotSprite"]:setAnchorPoint(0.5000, 0.5000)
        AnswerTarotTable[1]["TarotSprite"]:setPosition(ORIGIN.x + WIN_SIZE.width/2, ORIGIN.y + WIN_SIZE.height*0.53)
        Answer2TarotLayer:addChild(AnswerTarotTable[1]["TarotSprite"])
    end


    -- create Answer2TouchLayer
    local function Answer2TouchLayer()
        local Answer2TouchLayer = cc.Layer:create()
        Answer2TouchLayer:addTo(UI,UI_LAYERZORDER_MID)
        local EventDispatcher = Answer2TouchLayer:getEventDispatcher()
        local ListenerTable = {}

        local touchBeginPoint = nil

        local function AnswerTarot(Sprite)
            for i =0, 21 do
                if AnswerTarotTable[1]["TarotNum"] == TarotTable[i]["TarotNum"] then
                    local TarotNum = AnswerTarotTable[1]["TarotNum"]
                    local ChangeTexture = cc.Director:getInstance():getTextureCache():addImage(Tarot_Photo[TarotNum]["Tarot_Photo"])
                    local rectSprite = cc.Sprite:create(Tarot_Photo[0]["Tarot_Photo"])
--                   local rect = cc.rect(0, 0, AnswerTarotTable[1]["TarotSprite"]:getContentSize().width, AnswerTarotTable[1]["TarotSprite"]:getContentSize().height)
                    AnswerTarotTable[1]["TarotSprite"]:setTexture(ChangeTexture)
                    AnswerTarotTable[1]["TarotSprite"]:setTextureRect(rectSprite:getTextureRect())
                    AnswerTarotTable[1]["TarotSprite"]:setScale(0.8)
                    if AnswerTarotTable[1]["UprightOrDownright"] == 0 then
                        AnswerTarotTable[1]["TarotSprite"]:setRotation(180)
                    end
                end
            end
        end

        local function AnswerTarotNotePanel(Sprite)
              local TarotNum = AnswerTarotTable[1]["TarotNum"]
              local Label_Tarot_Answer = ""

              if DIVINE == LIFE then
                  if AnswerTarotTable[1]["UprightOrDownright"] == 1 then
--                    Label_Tarot_Answer = cc.Label:createWithTTF(Tarot_Content[TarotNum]["Tarot_Life_UpRight"], "fonts/simhei.ttf", TITLE_FONT_SIZE_LITTLESMALL, cc.size(0,0), cc.TEXT_ALIGNMENT_LEFT, cc.VERTICAL_TEXT_ALIGNMENT_CENTER)
                      Label_Tarot_Answer = Tarot_Content[TarotNum]["Tarot_Mean"].."\n\n"..Tarot_Content[TarotNum]["Tarot_Life_UpRight"]
                  elseif AnswerTarotTable[1]["UprightOrDownright"] == 0 then
--                    Label_Tarot_Answer = cc.Label:createWithTTF(Tarot_Content[TarotNum]["Tarot_Life_DownRight"], "fonts/simhei.ttf", TITLE_FONT_SIZE_LITTLESMALL, cc.size(0,0), cc.TEXT_ALIGNMENT_LEFT, cc.VERTICAL_TEXT_ALIGNMENT_CENTER)
                      Label_Tarot_Answer = Tarot_Content[TarotNum]["Tarot_Mean"].."\n\n"..Tarot_Content[TarotNum]["Tarot_Life_DownRight"]
                  end
              end

              if DIVINE == ENTERPRISE then
                  if AnswerTarotTable[1]["UprightOrDownright"] == 1 then
--                    Label_Tarot_Answer = cc.Label:createWithTTF(Tarot_Content[TarotNum]["Tarot_Enterprise_UpRight"], "fonts/simhei.ttf", TITLE_FONT_SIZE_LITTLESMALL, cc.size(0,0), cc.TEXT_ALIGNMENT_LEFT, cc.VERTICAL_TEXT_ALIGNMENT_CENTER)
                      Label_Tarot_Answer = Tarot_Content[TarotNum]["Tarot_Mean"].."\n\n"..Tarot_Content[TarotNum]["Tarot_Enterprise_UpRight"]
                  elseif AnswerTarotTable[1]["UprightOrDownright"] == 0 then
--                    Label_Tarot_Answer = cc.Label:createWithTTF(Tarot_Content[TarotNum]["Tarot_Enterprise_DownRight"], "fonts/simhei.ttf", TITLE_FONT_SIZE_LITTLESMALL, cc.size(0,0), cc.TEXT_ALIGNMENT_LEFT, cc.VERTICAL_TEXT_ALIGNMENT_CENTER)
                      Label_Tarot_Answer = Tarot_Content[TarotNum]["Tarot_Mean"].."\n\n"..Tarot_Content[TarotNum]["Tarot_Enterprise_DownRight"]
                  end
              end

              if DIVINE == LOVE then
                  if AnswerTarotTable[1]["UprightOrDownright"] == 1 then
--                    Label_Tarot_Answer = cc.Label:createWithTTF(Tarot_Content[TarotNum]["Tarot_Love_UpRight"], "fonts/simhei.ttf", TITLE_FONT_SIZE_LITTLESMALL, cc.size(0,0), cc.TEXT_ALIGNMENT_LEFT, cc.VERTICAL_TEXT_ALIGNMENT_CENTER)
                      Label_Tarot_Answer = Tarot_Content[TarotNum]["Tarot_Mean"].."\n\n"..Tarot_Content[TarotNum]["Tarot_Love_UpRight"]
                  elseif AnswerTarotTable[1]["UprightOrDownright"] == 0 then
--                    Label_Tarot_Answer = cc.Label:createWithTTF(Tarot_Content[TarotNum]["Tarot_Love_DownRight"], "fonts/simhei.ttf", TITLE_FONT_SIZE_LITTLESMALL, cc.size(0,0), cc.TEXT_ALIGNMENT_LEFT, cc.VERTICAL_TEXT_ALIGNMENT_CENTER)
                      Label_Tarot_Answer = Tarot_Content[TarotNum]["Tarot_Mean"].."\n\n"..Tarot_Content[TarotNum]["Tarot_Love_DownRight"]
                  end
              end

              local scrollView_Aside = UI:getUIItem("scrollView_Aside")
              local context_Aside = UI:getUIItem("context_Aside")
              context_Aside:setString(Label_Tarot_Answer)
              scrollView_Aside:setVisible(false)
              scrollView_Context:setVisible(true)
              local scrollView_Context = UI:getUIItem("scrollView_Context")
              local ScaleTime = 0.5
              local ScaleLarge = 1.0
              local ScaleLargeMove = cc.ScaleTo:create(ScaleTime, ScaleLarge)
              scrollView_Context:runAction(ScaleLargeMove)
              UI:getUIItem("closeContextAsideItem"):setVisible(true)
        end

        local function onTouchBegan(touch, event)
            --获取的当前触摸的目标
            local TouchSprite = event:getCurrentTarget()

            -- 获取当前点击坐标
            local location = touch:getLocation()
            -- 获取当前点击点所在相对按钮的位置坐标 
            local locationInNode = TouchSprite:convertToNodeSpace(location)
            local s = TouchSprite:getContentSize() 
            local rect = cc.rect(0, 0, s.width, s.height)
 
            -- 点击范围判断检测
            if cc.rectContainsPoint(rect,locationInNode) then
            touchBeginPoint = {x = location.x, y = location.y}
            cclog("onTouchBegan: %0.2f, %0.2f", location.x, location.y)
----
            EventDispatcher:removeEventListener(ListenerTable[0])

            --Tarot翻面
--            local AnswerTarotMove = cc.MoveTo:create(1.0,cc.p(ORIGIN.x + WIN_SIZE.width*7/10, ORIGIN.y + WIN_SIZE.height*7/10))

            local ScaleTime = 0.1
            local ScaleLarge = 1.2
            local ScaleSmall = 1.0
            local ScaleLargeMove = cc.ScaleTo:create(ScaleTime, ScaleLarge)
            local ScaleSmallMove = cc.ScaleTo:create(ScaleTime, ScaleSmall)

            local OrbitCameraMoveTime = 2.0
            local BeginR = AnswerTarotTable[1]["TarotSprite"]:getContentSize().width/2
            local SubR = 0
            local BeginXAngle_Up = 0
            local BeginXAngle_Down = 75
            local SubXAngle_Up = -70
            local SubXAngle_Down = -75
            local BeginYAngle = 0
            local SubYAngle = 0                    
            local OrbitCameraMoveUp = cc.OrbitCamera:create(OrbitCameraMoveTime, BeginR, SubR, BeginXAngle_Up, SubXAngle_Up, BeginYAngle, SubYAngle)
            local OrbitCameraMoveDown = cc.OrbitCamera:create(OrbitCameraMoveTime, BeginR, SubR, BeginXAngle_Down, SubXAngle_Down, BeginYAngle, SubYAngle)

            local AnswerTarotCallFunc = cc.CallFunc:create(AnswerTarot)
            local AnswerTarotNotePanelCallFunc = cc.CallFunc:create(AnswerTarotNotePanel)
            local Action = cc.Sequence:create(ScaleLargeMove, ScaleSmallMove, OrbitCameraMoveUp, AnswerTarotCallFunc, OrbitCameraMoveDown, AnswerTarotNotePanelCallFunc)
            AnswerTarotTable[1]["TarotSprite"]:runAction(Action)
            end
        end

        local function onTouchMoved(touch, event)
            local location = touch:getLocation()
            cclog("onTouchMoved: %0.2f, %0.2f", location.x, location.y)
        end

        local function onTouchEnded(touch, event)
              local location = touch:getLocation()
              cclog("onTouchMoved: %0.2f, %0.2f", location.x, location.y)
        end

        local Listener = cc.EventListenerTouchOneByOne:create()
----
        ListenerTable[0] = Listener
        Listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
        Listener:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCH_MOVED )
        Listener:registerScriptHandler(onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED )
        Listener:setSwallowTouches(true)
        EventDispatcher:addEventListenerWithSceneGraphPriority(Listener, AnswerTarotTable[1]["TarotSprite"])
    end

-- create menu
function Answer2:regDivineMenu()
    local function ReplaceToAnswer3Scene()
        package.loaded["Answer/Answer3"]  = nil
        self:getApp():enterScene("Answer/Answer3")
    end

    local function Answer2_Next(ref,type)
        if type == ccui.TouchEventType.ended then
            ReplaceToAnswer3Scene()
            print(DIVINE)
            print("Answer2----------------------------------------------------------line204")
        end
    end
    UI:getUIItem("choiceEndItem"):addTouchEventListener(Answer2_Next)

    --打开关闭字幕
    local function contextAsideOnOff(ref,type)
        if type == ccui.TouchEventType.ended then
            local context_Aside = UI:getUIItem("context_Aside")
            if context_Aside:isVisible() then
                context_Aside:setVisible(false)
            else context_Aside:setVisible(true)
            end
        end
    end
    UI:getUIItem("closeContextAsideItem"):addTouchEventListener(contextAsideOnOff)
end


    Answer2TarotLayer()
    Answer2TouchLayer()
    self:regDivineMenu()
end

cclog("Answer2==========================================================")
return Answer2

