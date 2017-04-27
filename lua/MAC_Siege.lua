Script.Load("lua/MAC.lua")
Script.Load("lua/Additions/LevelsMixin.lua")
Script.Load("lua/ResearchMixin.lua")
Script.Load("lua/RecycleMixin.lua")

--Kyle 'Avoca' Abent
class 'MACSiege' (MAC)
MACSiege.kMapName = "macsiege"

MAC.kConstructRate = 0.4
MAC.kWeldRate = 0.5
MAC.kOrderScanRadius = 10
MAC.kRepairHealthPerSecond = 50
MAC.kHealth = kMACHealth
MAC.kArmor = kMACArmor
MAC.kMoveSpeed = 6
MAC.kHoverHeight = .5
MAC.kStartDistance = 3
MAC.kWeldDistance = 2
MAC.kBuildDistance = 2     -- Distance at which bot can start building a structure.
MAC.kSpeedUpgradePercent = (1 + kMACSpeedAmount)
MAC.kRolloutSpeed = 2
MAC.kCapsuleHeight = .2
MAC.kCapsuleRadius = .5
MAC.kGreetingUpdateInterval = 1
MAC.kGreetingInterval = 10
MAC.kGreetingDistance = 5
MAC.kUseTime = 2.0


kMacMaxAmount = gMacMaxAmount
kMacMaxLevel = kMacMaxLevel
MACSiege.kConstructRate = 0.4
MACSiege.kWeldRate = 0.5
MACSiege.kOrderScanRadius = 10
MACSiege.kRepairHealthPerSecond = 50
MACSiege.kHealth = kMACHealth
MACSiege.kArmor = kMACArmor
MACSiege.kMoveSpeed = 6
MACSiege.kHoverHeight = .5
MACSiege.kStartDistance = 3
MACSiege.kWeldDistance = 2
MACSiege.kBuildDistance = 2     -- Distance at which bot can start building a structure.
MACSiege.kSpeedUpgradePercent = (1 + kMACSpeedAmount)
MACSiege.kRolloutSpeed = 2
MACSiege.kCapsuleHeight = .2
MACSiege.kCapsuleRadius = .5
MACSiege.kGreetingUpdateInterval = 1
MACSiege.kGreetingInterval = 10
MACSiege.kGreetingDistance = 5
MACSiege.kUseTime = 2.0

local networkVars = 

{


}

MAC.kWeldRate = 1

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