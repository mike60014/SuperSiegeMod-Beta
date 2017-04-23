Script.Load("lua/Weapons/PredictedProjectile.lua")
Script.Load("lua/Weapons/Alien/AcidRocket.lua")
Script.Load("lua/PhaseGateUserMixin.lua")


Fade.XZExtents = kFadeXZExtents
Fade.YExtents = kFadeYExtents
Fade.Armor = kFadeArmor
Fade.Health = kFadeHealth

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
	return kFadeRebirthLength
end

function Fade:GetRedemptionCoolDown()
	return kFadeRedemptionCooldown
end

function Fade:GetMaxSpeed(possible)
     local speed = origspeed(self)  * kFadePrimaryAttackSpeedMultipler
  --return speed * 1.10
  return not self:GetIsOnFire() and speed * kFadePrimaryAttackSpeedOnFireMultipler or speed 
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