local Tarot = require "Tarot"

local TarotSprite = class("TarotSprite", Tarot, function(imageFilename)
    local sprite = cc.Sprite:create(imageFilename)
    return sprite
end)

return TarotSprite
