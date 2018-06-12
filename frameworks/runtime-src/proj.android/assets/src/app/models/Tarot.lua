
local Base = import(".Base")

local Tarot = class("Tarot", Base)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
        --[[
        ȫ�ֱ�:
               TarotTable:["TarotNum"]�����Ƶ�����,["UprightOrDownright"]����������λ
               TarotSpriteTable:["TarotSprite"]������SpriteTag
        ]]--
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
        TarotTable = {}
        TarotSpriteTable = {}

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
        --[[
        ȫ�ֱ�:
               ���Ʊ�
               AnswerTarotTable:["TarotNum"]�����Ƶ�����,["UprightOrDownright"]����������λ["TarotSprite"]������SpriteTag
        ]]--
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
        AnswerTarotTable = {}

function Tarot:ctor()
    Tarot.super.ctor(self)
    self.type_ = Base.TYPE_TAROT
    self.TarotNum = 0
    self.UprightOrDownright = math.random(0, 1)
--    self.TarotSprite = nil
end

function Tarot:getTarotNum()
    return self.TarotNum
end

function Tarot:getUprightOrDownright()
    return self.UprightOrDownright
end


return Tarot
