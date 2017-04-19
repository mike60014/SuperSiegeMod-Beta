function Onos:GetRebirthLength()
return 5
end
function Onos:GetRedemptionCoolDown()
return 25
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
	local speed = gOnosMaxMoveSpeed
    if possible then return speed end
	if self:GetIsOnFire() then speed = gOnosOnFireMoveSpeed end
	--if not self:GetIsOnFire() then speed = 9.375 end
	if self:GetIsPoopGrowing() then speed = 0 end
	if self:GetIsXenociding() then speed = speed * gOnocideMoveSpeedFraction end
	if self:GetIsBoneShieldActive() then speed = speed * gBoneShieldMoveSpeedFraction end
	local chargeExtra = self:GetChargeFraction() * (gOnosMaxChargeSpeed - speed)
    
    return ( speed + chargeExtra )
    
    
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
    --"Welder",
    "Sentry",
    "Claw"
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
           damageReduct = gBoneShieldDamageReduction
           end
        elseif self:GetIsCharging() then  
        damageReduct = gOnosChargeDamageReduction
        elseif self:GetIsXenociding() then  
        damageReduct = gOnosXenocideDamageReduction
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

function Onos:GetIsXenociding()

    local activeWeapon = self:GetActiveWeapon()
    if activeWeapon and activeWeapon:isa("Onocide") and activeWeapon.primaryAttacking then
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
