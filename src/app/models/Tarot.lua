
local Base = import(".Base")

local Tarot = class("Tarot", Base)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
        --[[
        全局表:
               TarotTable:["TarotNum"]代表牌的内容,["UprightOrDownright"]代表牌正逆位
               TarotSpriteTable:["TarotSprite"]代表牌SpriteTag
        ]]--
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
        TarotTable = {}
        TarotSpriteTable = {}

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
        --[[
        全局表:
               解牌表
               AnswerTarotTable:["TarotNum"]代表牌的内容,["UprightOrDownright"]代表牌正逆位["TarotSprite"]代表牌SpriteTag
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
