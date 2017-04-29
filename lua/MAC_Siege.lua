Script.Load("lua/MAC.lua")
Script.Load("lua/Additions/LevelsMixin.lua")
Script.Load("lua/ResearchMixin.lua")
Script.Load("lua/RecycleMixin.lua")

--Kyle 'Avoca' Abent
class 'MACSiege' (MAC)
MACSiege.kMapName = "macsiege"

MAC.kConstructRate = gMACConstructRate
MAC.kWeldRate = gMACWeldRate
MAC.kOrderScanRadius = gMACOrderScanRadius
MAC.kRepairHealthPerSecond = gMACRepairHealthPerSecond
MAC.kHealth = kMACHealth
MAC.kArmor = kMACArmor
MAC.kMoveSpeed = gMACMoveSpeed
MAC.kHoverHeight = gMACHoverHeight
MAC.kStartDistance = gMACStartDistance
MAC.kWeldDistance = gMACWeldDistance
MAC.kBuildDistance = gMACBuildDistance     -- Distance at which bot can start building a structure.
MAC.kSpeedUpgradePercent = (1 + kMACSpeedAmount)
MAC.kRolloutSpeed = gMACRolloutSpeed
MAC.kCapsuleHeight = gMACCapsuleHeight
MAC.kCapsuleRadius = gMACCapsuleRadius
MAC.kGreetingUpdateInterval = gMACGreetingUpdateInterval
MAC.kGreetingInterval = gMACGreetingInterval
MAC.kGreetingDistance = gMACGreetingDistance
MAC.kUseTime = gMACUseTime


kMacMaxAmount = gMacMaxAmount
kMacMaxLevel = kMacMaxLevel
MACSiege.kConstructRate = gMACConstructRate
MACSiege.kWeldRate = gMACWeldRate
MACSiege.kOrderScanRadius = gMACOrderScanRadius
MACSiege.kRepairHealthPerSecond = gMACRepairHealthPerSecond
MACSiege.kHealth = kMACHealth
MACSiege.kArmor = kMACArmor
MACSiege.kMoveSpeed = gMACMoveSpeed
MACSiege.kHoverHeight = gMACHoverHeight
MACSiege.kStartDistance = gMACStartDistance
MACSiege.kWeldDistance = gMACWeldDistance
MACSiege.kBuildDistance = gMACBuildDistance     -- Distance at which bot can start building a structure.
MACSiege.kSpeedUpgradePercent = (1 + kMACSpeedAmount)
MACSiege.kRolloutSpeed = gMACRolloutSpeed
MACSiege.kCapsuleHeight = gMACCapsuleHeight
MACSiege.kCapsuleRadius = gMACCapsuleRadius
MACSiege.kGreetingUpdateInterval = gMACGreetingUpdateInterval
MACSiege.kGreetingInterval = gMACGreetingInterval
MACSiege.kGreetingDistance = gMACGreetingDistance
MACSiege.kUseTime = gMACUseTime

local networkVars = 

{


}

MAC.kWeldRate = gMACWeldRate

AddMixinNetworkVars(ResearchMixin, networkVars)
AddMixinNetworkVars(RecycleMixin, networkVars)

function MACSiege:OnCreate()
	MAC.OnCreate(self)
    InitMixin(self, ResearchMixin)
    InitMixin(self, RecycleMixin)
end

function MAC:GetIsBuilt()
	return self:GetIsAlive()
end

function MACSiege:OnInitialized()
	self:SetTechId(kTechId.MAC)
	InitMixin(self, LevelsMixin)
	if Server then ExploitCheck(self) end
	MAC.OnInitialized(self)
end

function MACSiege:GetTechId()
return kTechId.MAC
end

function MACSiege:GetMaxLevel()
return kMacMaxLevel
end

function MACSiege:GetAddXPAmount()
return 0.05 * 0.05
end

function MACSiege:OnGetMapBlipInfo()
    local success = false
    local blipType = kMinimapBlipType.Undefined
    local blipTeam = -1
    local isAttacked = HasMixin(self, "Combat") and self:GetIsInCombat()
    blipType = kMinimapBlipType.MAC
     blipTeam = self:GetTeamNumber()
    if blipType ~= 0 then
        success = true
    end
    
    return success, blipType, blipTeam, isAttacked, false --isParasited
end




 
Shared.LinkClassToMap("MACSiege", MACSiege.kMapName, networkVars)
class 'DropMAC' (MAC)
DropMAC.kMapName = "dropmac"

local networkVars = 

{


}
AddMixinNetworkVars(ResearchMixin, networkVars)
AddMixinNetworkVars(RecycleMixin, networkVars)
function DropMAC:OnCreate()
MAC.OnCreate(self)
    InitMixin(self, ResearchMixin)
    InitMixin(self, RecycleMixin)
end

function DropMAC:OnInitialized()
	MAC.OnInitialized(self)
	self:SetTechId(kTechId.MAC)
	InitMixin(self, LevelsMixin)
	if Server then ExploitCheck(self) end
end

function DropMAC:GetTechId()
	return kTechId.MAC
end

function DropMAC:GetMaxLevel()
	return kMacMaxLevel
end

function DropMAC:GetAddXPAmount()
	return 1 --0.05 * 0.05
end

function DropMAC:OnGetMapBlipInfo()
    local success = false
    local blipType = kMinimapBlipType.Undefined
    local blipTeam = -1
    local isAttacked = HasMixin(self, "Combat") and self:GetIsInCombat()
    blipType = kMinimapBlipType.MAC
     blipTeam = self:GetTeamNumber()
    if blipType ~= 0 then
        success = true
    end
    
    return success, blipType, blipTeam, isAttacked, false --isParasited
end


function DropMAC:GetCurrentOrder()
 if not self:GetIsBuilt() then return end --Print ("Not Built") return end
return OrdersMixin.GetCurrentOrder(self)
end



function DropMAC:OnUpdate(deltaTime)
MAC.OnUpdate(self, deltaTime)

if self.welding or self.constructing then self:AddXP(self:GetAddXPAmount()) end

end

    function DropMAC:GetTotalConstructionTime()
    local value =  ConditionalValue(GetIsInSiege(self), 1, 2)
    return value
    end
    --Because I want to get rid of it not welding while under attack. I know there's better ways to do this :P
    function DropMAC:GetTimeLastDamageTaken()
    return 0
end

function DropMAC:OnUpdateAnimationInput(modelMixin)
 if not self:GetIsBuilt() then return end
 MAC.OnUpdateAnimationInput(self, modelMixin)

end

---techbuttons im not sure if i have to add recycle manually. Because the mixin does that?
    
    
    
 
Shared.LinkClassToMap("DropMAC", DropMAC.kMapName, networkVars)