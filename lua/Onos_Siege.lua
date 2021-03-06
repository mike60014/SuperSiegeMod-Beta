
Onos.kJumpForce = kOnosJumpForce
Onos.kJumpVerticalVelocity = kOnosJumpVerticalVelocity

Onos.kJumpRepeatTime = kOnosJumpRepeatTime
Onos.kViewOffsetHeight = kOnosViewOffsetHeight
Onos.XExtents = kOnosXExtents
Onos.YExtents = kOnosYExtents
Onos.ZExtents = kOnosZExtents
Onos.kMass = kOnosMass
Onos.kJumpHeight = kOnosJumpHeight

-- triggered when the momentum value has changed by this amount (negative because we trigger the effect when the onos stops, not accelerates)
Onos.kMomentumEffectTriggerDiff = kOnosMomentumEffectTriggerDiff

Onos.kGroundFrictionForce = kOnosGroundFrictionForce

-- used for animations and sound effects
Onos.kMaxSpeed = kOnosMaxSpeed --7.5
Onos.kChargeSpeed = kOnosChargeSpeed --11.5

Onos.kHealth = kOnosHealth
Onos.kArmor = kOnosArmor
Onos.kChargeEnergyCost = kChargeEnergyCost

Onos.kChargeUpDuration = kOnosChargeUpDuration
Onos.kChargeDelay = kOnosChargeDelay

-- mouse sensitivity scalar during charging
Onos.kChargingSensScalar = kOnosChargingSensScalar

Onos.kStoopingCheckInterval = kOnosStoopingCheckInterval
Onos.kStoopingAnimationSpeed = kOnosStoopingAnimationSpeed
Onos.kYHeadExtents = kOnosYHeadExtents
Onos.kYHeadExtentsLowered = kOnosYHeadExtentsLowered

function Onos:GetRebirthLength()
return kOnosRebirthLength
end

function Onos:GetRedemptionCoolDown()
return kOnosRedemptionCooldown
end


function Onos:PreUpdateMove(input, runningPrediction)

    if self.charging then
        
        self:DeductAbilityEnergy(Onos.kChargeEnergyCost * input.time)
        if self:GetEnergy() == 0 or
           self:GetIsJumping() or
          (self.timeLastCharge + 1 < Shared.GetTime() and self:GetVelocity():GetLengthXZ() < 4.5) then
        
            self:EndCharge()
            
        end
        
    end
end

/*
function Onos:PreUpdateMove(input, runningPrediction)
end
*/

--local origspeed = Onos.GetMaxSpeed
--Onos.kMaxSpeed = 8
--Onos.kChargeSpeed = 13.7

function Onos:GetMaxSpeed(possible)
     local speed = kOnosMaxSpeed
  
    if possible then
        return speed
    end
   if not self:GetIsOnFire() then speed = kOnosCelerityMoveSpeed end
    if self:GetIsPoopGrowing() then speed = 0 end
    local boneShieldSlowdown = self:GetIsBoneShieldActive() and kBoneShieldMoveFraction or 1
    local chargeExtra = self:GetChargeFraction() * (12 - speed)
    
    return ( speed + chargeExtra ) * boneShieldSlowdown
    
    
end
--ugh
local kBlockDoers =
{
    "Minigun",
    "Pistol",
    "Rifle",
    "HeavyRifle",
    "HeavyMachineGun",
    "Shotgun",
    "Axe",
    "Welder",
    "Sentry",
    "Claw",
    "Fist",
}
local function GetHitsBoneShield(self, doer, hitPoint)

    if table.contains(kBlockDoers, doer:GetClassName()) then
    
        local viewDirection = GetNormalizedVectorXZ(self:GetViewCoords().zAxis)
        local zPosition = viewDirection:DotProduct(GetNormalizedVector(hitPoint - self:GetOrigin()))

        return zPosition > -0.1
    
    end
    
    return false

end
function Onos:ModifyDamageTaken(damageTable, attacker, doer, damageType, hitPoint)

    if hitPoint ~= nil  then
    
       local damageReduct = 1
       
        if self:GetIsBoneShieldActive() then
          if GetHitsBoneShield(self, doer, hitPoint) then
           damageReduct = kBoneShieldDamageReduction
           end
        elseif self:GetIsCharging()  then  
			damageReduct =  0.7
        end
        
        if damageReduct ~= 1 then
        damageTable.damage = damageTable.damage * damageReduct
        self:TriggerEffects("boneshield_blocked", {effecthostcoords = Coords.GetTranslation(hitPoint)} )
        end
        
    end

end

function Onos:GetHasMovementSpecial()
    return GetHasTech(self, kTechId.Charge)
end

function Onos:GetIsPoopGrowing()

    local activeWeapon = self:GetActiveWeapon()
    if activeWeapon and activeWeapon:isa("OnoGrow") and activeWeapon.primaryAttacking then
        return true
    end    
    return false
    
end

--local orig_Onos_OnAdjustModelCoords = Onos.OnAdjustModelCoords
function Onos:OnAdjustModelCoords(modelCoords) 
--orig_Onos_OnAdjustModelCoords(self)
        local onoGrow = self:GetWeapon(OnoGrow.kMapName)
        local scale = 1
        if onoGrow then
          scale = onoGrow.modelsize
        end
    local coords = modelCoords
        coords.xAxis = coords.xAxis * scale
        coords.yAxis = coords.yAxis * scale
        coords.zAxis = coords.zAxis * scale
    return coords
end

if Server then

	function Onos:GetTierFourTechId()
		return kTechId.OnoGrow
	end

	function Onos:GetTierFiveTechId()
		return kTechId.Onocide
	end

end
