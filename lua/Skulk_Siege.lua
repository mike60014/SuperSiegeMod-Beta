--[[

local origspeed = Skulk.GetMaxSpeed

local kBallFlagAttachPoint = "babbler_attach2"

function Skulk:GetBallFlagAttatchPoint(player)
       return kBallFlagAttachPoint
end
if Server then

function Skulk:GetTierFourTechId()
    return kTechId.None
end

function Skulk:GetTierFiveTechId()
    return kTechId.None
end

end

]]--