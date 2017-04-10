Script.Load("lua/Weapons/PredictedProjectile.lua")
Script.Load("lua/Weapons/Alien/AcidRocket.lua")
Script.Load("lua/PhaseGateUserMixin.lua")


Fade.XZExtents = gFadeXZExtents
Fade.YExtents = gFadeYExtents

local networkVars = {}

local kBallFlagAttachPoint = "babbler_attach4"


AddMixinNetworkVars(PhaseGateUserMixin, networkVars)

local origspeed = Fade.GetMaxSpeed
local origcreate = Fade.OnCreate
function Fade:OnCreate()
origcreate(self)

InitMixin(self, PredictedProjectileShooterMixin)
InitMixin(self, PhaseGateUserMixin)

end

function Fade:GetRebirthLength()
return gFadeRebirthLength
end

function Fade:GetRedemptionCoolDown()
return gFadeRedemptionCooldown
end

//function Fade:GetBallFlagAttatchPoint(player)
      // return kBallFlagAttachPoint
//end

function Fade:GetMaxSpeed(possible)
     local speed = origspeed(self)  * gFadePrimaryAttackSpeedMultipler
  --return speed * 1.10
  return not self:GetIsOnFire() and speed * gFadePrimaryAttackSpeedOnFireMultipler or speed 
end
function Fade:GetCanMetabolizeHealth()
    return GetHasTech(self, kTechId.MetabolizeHealth)
end

if Server then

function Fade:GetTierFourTechId()
    return kTechId.AcidRocket
end

function Fade:GetTierFiveTechId()
    return kTechId.None
end

end

Shared.LinkClassToMap("Fade", Fade.kMapName, networkVars) 