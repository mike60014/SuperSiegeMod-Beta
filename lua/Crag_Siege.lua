
Script.Load("lua/Mixins/ClientModelMixin.lua")
Script.Load("lua/LiveMixin.lua")
Script.Load("lua/UpgradableMixin.lua")
Script.Load("lua/PointGiverMixin.lua")
Script.Load("lua/AchievementGiverMixin.lua")
Script.Load("lua/GameEffectsMixin.lua")
Script.Load("lua/SelectableMixin.lua")
Script.Load("lua/FlinchMixin.lua")
Script.Load("lua/CloakableMixin.lua")
Script.Load("lua/LOSMixin.lua")
Script.Load("lua/DetectableMixin.lua")
Script.Load("lua/InfestationTrackerMixin.lua")
Script.Load("lua/TeamMixin.lua")
Script.Load("lua/EntityChangeMixin.lua")
Script.Load("lua/ConstructMixin.lua")
Script.Load("lua/ResearchMixin.lua")
Script.Load("lua/CommanderGlowMixin.lua")

Script.Load("lua/ScriptActor.lua")
Script.Load("lua/RagdollMixin.lua")
Script.Load("lua/FireMixin.lua")
Script.Load("lua/SleeperMixin.lua")
Script.Load("lua/ObstacleMixin.lua")
Script.Load("lua/CatalystMixin.lua")
Script.Load("lua/TeleportMixin.lua")
Script.Load("lua/TargetCacheMixin.lua")
Script.Load("lua/UnitStatusMixin.lua")
Script.Load("lua/UmbraMixin.lua")
Script.Load("lua/DissolveMixin.lua")
Script.Load("lua/MaturityMixin.lua")
Script.Load("lua/MapBlipMixin.lua")
Script.Load("lua/HiveVisionMixin.lua")
Script.Load("lua/CombatMixin.lua")

Script.Load("lua/PathingMixin.lua")
Script.Load("lua/RepositioningMixin.lua")
Script.Load("lua/SupplyUserMixin.lua")
Script.Load("lua/BiomassMixin.lua")
Script.Load("lua/OrdersMixin.lua")
Script.Load("lua/IdleMixin.lua")

class 'Crag' (ScriptActor)

Crag.kMapName = "crag"

Crag.kModelName = PrecacheAsset("models/alien/crag/crag.model")

Crag.kAnimationGraph = PrecacheAsset("models/alien/crag/crag.animation_graph")


--kAlienStructureMoveSpeed = gCraigStructureMoveSpeed

--kCragHealStackLimit = gCragHealMaxTargets
--kCragHealBonusModifier = gCragHealBonusModifier
--kCragHealRadius = gCragHealRadius

Crag.kThinkInterval = 0.25
Crag.kHealRadius = gCragHealRadius
Crag.kHealAmount = gCragHealAmount
Crag.kHealWaveAmount = gCragHealWaveAmount
Crag.kMaxTargets = gCragHealMaxTargets
Crag.kHealInterval = gCragHealInterval
Crag.kHealEffectInterval = gCragHealEffectInterval
Crag.kHealWaveDuration = gCragHealWaveDuration
Crag.kHealPercentage = gCragHealPercent
Crag.kMinHeal = gCragHealMinHealAmount
Crag.kMaxHeal = gCragHealMaxHealAmount
Crag.kHealWaveMultiplier = gCragHealHealAmountMutliplier

local networkVars =
{
    -- For client animations
    healingActive = "boolean",
    healWaveActive = "boolean",
    moving = "boolean"
}


function Crag:OnCreate()

    ScriptActor.OnCreate(self)
    
    InitMixin(self, BaseModelMixin)
    InitMixin(self, ClientModelMixin)
    InitMixin(self, LiveMixin)
    InitMixin(self, UpgradableMixin)
    InitMixin(self, GameEffectsMixin)
    InitMixin(self, FlinchMixin)
    InitMixin(self, TeamMixin)
    InitMixin(self, PointGiverMixin)
    InitMixin(self, AchievementGiverMixin)
    InitMixin(self, SelectableMixin)
    InitMixin(self, EntityChangeMixin)
    InitMixin(self, CloakableMixin)
    InitMixin(self, LOSMixin)
    InitMixin(self, DetectableMixin)
    InitMixin(self, ConstructMixin)
    InitMixin(self, ResearchMixin)
    InitMixin(self, RagdollMixin)
    InitMixin(self, ObstacleMixin)
    InitMixin(self, CatalystMixin)
    InitMixin(self, TeleportMixin)    
    InitMixin(self, UmbraMixin)
    InitMixin(self, DissolveMixin)
    InitMixin(self, MaturityMixin)
    InitMixin(self, CombatMixin)
    InitMixin(self, PathingMixin)
    InitMixin(self, BiomassMixin)
    InitMixin(self, OrdersMixin, { kMoveOrderCompleteDistance = kAIMoveOrderCompleteDistance })
    
    self.healingActive = false
    self.healWaveActive = false
    
    self:SetUpdates(true)
    
    InitMixin(self, FireMixin)
    
    if Server then
        InitMixin(self, InfestationTrackerMixin)
    elseif Client then    
        InitMixin(self, CommanderGlowMixin)    
    end
    
    self:SetLagCompensated(false)
    self:SetPhysicsType(PhysicsType.Kinematic)
    self:SetPhysicsGroup(PhysicsGroup.MediumStructuresGroup)
    
end

function Crag:OnInitialized()

    ScriptActor.OnInitialized(self)
    
    self:SetModel(Crag.kModelName, Crag.kAnimationGraph)
    
    if Server then
    
        InitMixin(self, StaticTargetMixin)
        InitMixin(self, SleeperMixin)
        InitMixin(self, RepositioningMixin)
        InitMixin(self, SupplyUserMixin)
        
        -- TODO: USE TRIGGERS, see shade

        -- This Mixin must be inited inside this OnInitialized() function.
        if not HasMixin(self, "MapBlip") then
            InitMixin(self, MapBlipMixin)
        end
        
    elseif Client then
    
        InitMixin(self, UnitStatusMixin)
        InitMixin(self, HiveVisionMixin)
        
    end
    
    InitMixin(self, IdleMixin)
    
end

function Crag:PreventTurning()
    return true
end

function Crag:GetBioMassLevel()
    return kCragBiomass
end

function Crag:GetCanReposition()
    return true
end

function Crag:OverrideRepositioningSpeed()
    return kAlienStructureMoveSpeed * 2.5
end

function Crag:GetMaturityRate()
    return kCragMaturationTime
end

function Crag:GetMatureMaxHealth()
    return kMatureCragHealth
end

function Crag:GetMatureMaxArmor()
    return kMatureCragArmor
end    

function Crag:GetDamagedAlertId()
    return kTechId.AlienAlertStructureUnderAttack
end

function Crag:GetCanSleep()
    return not self.healingActive
end

local function GetHealTargets(self)

    local targets = {}
    
    -- priority on players
    for _, player in ipairs(GetEntitiesForTeamWithinRange("Player", self:GetTeamNumber(), self:GetOrigin(), Crag.kHealRadius)) do
    
        if player:GetIsAlive() then
            table.insert(targets, player)
        end
        
    end

    for _, healable in ipairs(GetEntitiesWithMixinForTeamWithinRange("Live", self:GetTeamNumber(), self:GetOrigin(), Crag.kHealRadius)) do
        
        if healable:GetIsAlive() then
            table.insertunique(targets, healable)
        end
        
    end

    return targets

end

function Crag:PerformHealing()

    PROFILE("Crag:PerformHealing")

    local targets = GetHealTargets(self)
    local entsHealed = 0
    
    for _, target in ipairs(targets) do
    
        local healAmount = self:TryHeal(target)
        entsHealed = entsHealed + ((healAmount > 0 and 1) or 0)
        
        if entsHealed >= Crag.kMaxTargets then
            break
        end
    
    end

    if entsHealed > 0 then   
        self.timeOfLastHeal = Shared.GetTime()        
    end
    
end

function Crag:TryHeal(target)

    local unclampedHeal = target:GetMaxHealth() * Crag.kHealPercentage
    local heal = Clamp(unclampedHeal, Crag.kMinHeal, Crag.kMaxHeal)
    
    if self.healWaveActive then
        heal = heal * Crag.kHealWaveMultiplier
    end
    
    if target:GetHealthScalar() ~= 1 and (not target.timeLastCragHeal or target.timeLastCragHeal + Crag.kHealInterval <= Shared.GetTime()) then
    
        local amountHealed = target:AddHealth(heal)
        target.timeLastCragHeal = Shared.GetTime()
        return amountHealed
        
    else
        return 0
    end
    
end

function Crag:UpdateHealing()

    local time = Shared.GetTime()
    
    if not self:GetIsOnFire() and ( self.timeOfLastHeal == nil or (time > self.timeOfLastHeal + Crag.kHealInterval) ) then    
        self:PerformHealing()        
    end
    
end


function Crag:GetCragsInRange()
      local crag = GetEntitiesWithinRange("Crag", self:GetOrigin(), Crag.kHealRadius)
           return Clamp(#crag, 0, gCragHealMaxTargets)
end

function Crag:GetBonusAmt()
return (self:GetCragsInRange()/gCragHealBonusDivider)
end

function Crag:GetUnitNameOverride(viewer)
    local unitName = GetDisplayName(self)   
    unitName = string.format(Locale.ResolveString("Crag (%sS %sB)"), self:GetCragsInRange(), self:GetBonusAmt() )
return unitName
end

local origbuttons = Crag.GetTechButtons
function Crag:GetTechButtons(techId)
local table = {}

	table = origbuttons(self, techId)

	table[3] = kTechId.CragUmbra

	return table

end

local origact = Crag.PerformActivation
function Crag:PerformActivation(techId, position, normal, commander)
	origact(self, techId, position, normal, commander)

	local success  = false
	if  techId == kTechId.CragUmbra then
		success = self:TriggerUmbra()
	end

	return success, true

end



function Crag:GetMaxSpeed()
    return gCraigStructureMoveSpeed
end

function Crag:TriggerUmbra()

    local umbra = CreateEntity(CragUmbra.kMapName,  self:GetOrigin() + Vector(0, 0.2, 0), self:GetTeamNumber())
    umbra:SetTravelDestination(self:GetOrigin() + Vector(0, 2, 0) )
    self:TriggerEffects("crag_trigger_umbra")
    return true
end

function Crag:TryHeal(target)

    local unclampedHeal = target:GetMaxHealth() * Crag.kHealPercentage
    local heal = Clamp(unclampedHeal, Crag.kMinHeal, Crag.kMaxHeal) 
       
    if self.healWaveActive then
        heal = heal * Crag.kHealWaveMultiplier
    end
    
    --heal = heal * self:GetCragsInRange()/3 + heal
    if self:GetCragsInRange() >= 1 then
    heal = heal * self:GetBonusAmt() + heal
    end
    
   -- if self:GetIsSiege() and self:IsInRangeOfHive() and target:isa("Hive") or target:isa("Crag") then
   --    heal = heal * kCragSiegeBonus
   -- end
    
    if target:GetHealthScalar() ~= 1 and (not target.timeLastCragHeal or target.timeLastCragHeal + Crag.kHealInterval <= Shared.GetTime()) then
       local amountHealed = target:AddHealth(heal)
       target.timeLastCragHeal = Shared.GetTime()
       
       return amountHealed
    else
        return 0
    end
   
end


-- Look for nearby friendlies to heal
function Crag:OnUpdate(deltaTime)

    PROFILE("Crag:OnUpdate")

    ScriptActor.OnUpdate(self, deltaTime)
    
    UpdateAlienStructureMove(self, deltaTime)
    
    if Server then

        if not self.timeLastCragUpdate then
            self.timeLastCragUpdate = Shared.GetTime()
        end
        
        if self.timeLastCragUpdate + Crag.kThinkInterval < Shared.GetTime() then
        
            if GetIsUnitActive(self) then            
                self:UpdateHealing()                
            end

            self.healingActive = self:GetIsHealingActive()
            self.healWaveActive = self:GetIsHealWaveActive()
            
            self.timeLastCragUpdate = Shared.GetTime()
            
        end
    
    elseif Client then
    
        if self.healWaveActive or self.healingActive then
        
            if not self.lastHealEffect or self.lastHealEffect + Crag.kHealEffectInterval < Shared.GetTime() then
            
                local localPlayer = Client.GetLocalPlayer()
                local showHeal = not HasMixin(self, "Cloakable") or not self:GetIsCloaked() or not GetAreEnemies(self, localPlayer)
        
                if showHeal then
                
                    if self.healWaveActive then
                        self:TriggerEffects("crag_heal_wave")
                    elseif self.healingActive then
                        self:TriggerEffects("crag_heal")
                    end
                    
                end
                
                self.lastHealEffect = Shared.GetTime()
            
            end
            
        end
    
    end
    
end

function Crag:GetTechButtons(techId)

    local techButtons = { kTechId.HealWave, kTechId.Move, kTechId.CragHeal, kTechId.None,
                          kTechId.None, kTechId.None, kTechId.None, kTechId.None }
    
    if self.moving then
        techButtons[2] = kTechId.Stop
    end
    
    return techButtons
    
end

function Crag:PerformAction(techNode)

    if techNode:GetTechId() == kTechId.Stop then
        self:ClearOrders()
    end

end

function Crag:OnTeleportEnd()
    self:ResetPathing()
end

function Crag:GetIsHealWaveActive()
    return self:GetIsAlive() and self:GetIsBuilt() and (self.timeOfLastHealWave ~= nil) and (Shared.GetTime() < (self.timeOfLastHealWave + Crag.kHealWaveDuration))
end

function Crag:GetIsHealingActive()
    return self:GetIsAlive() and self:GetIsBuilt() and (self.timeOfLastHeal ~= nil) and (Shared.GetTime() < (self.timeOfLastHeal + Crag.kHealInterval))
end

function Crag:TriggerHealWave(commander)

    self.timeOfLastHealWave = Shared.GetTime()
    return true
    
end

function Crag:GetReceivesStructuralDamage()
    return true
end


function Crag:GetTechAllowed(techId, techNode, player)

    local allowed, canAfford = ScriptActor.GetTechAllowed(self, techId, techNode, player)
    allowed = allowed and not self:GetIsOnFire()
    
    return allowed, canAfford
end

function Crag:PerformActivation(techId, position, normal, commander)

    local success = false
    
    if techId == kTechId.HealWave then
        success = self:TriggerHealWave(commander)
    end
    
    return success, true
end

function Crag:OnUpdateAnimationInput(modelMixin)

    PROFILE("Crag:OnUpdateAnimationInput")
    modelMixin:SetAnimationInput("heal", self.healingActive or self.healWaveActive)
    modelMixin:SetAnimationInput("moving", self.moving)
    
end

function Crag:GetCanBeUsed(player, useSuccessTable)
    useSuccessTable.useSuccess = false    
end

/*
-------- Hmmm?? does this even do anything? a 10% dmg discount from minigun? I have no idea.
function Crag:ModifyDamageTaken(damageTable, attacker, doer, damageType, hitPoint)

    if hitPoint ~= nil and doer ~= nil and doer:isa("Minigun") then
    
        --damageTable.damage = damageTable.damage * 0.9
        --self:TriggerEffects("boneshield_blocked", {effecthostcoords = Coords.GetTranslation(hitPoint)} )
        
    end

end
*/

Shared.LinkClassToMap("Crag", Crag.kMapName, networkVars)