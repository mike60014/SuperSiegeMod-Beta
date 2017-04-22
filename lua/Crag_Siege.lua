/*
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
*/
-- Same as NS1
Crag.kHealRadius = 14
Crag.kHealAmount = 10
Crag.kHealWaveAmount = 50
Crag.kMaxTargets = 3
Crag.kThinkInterval = .25
Crag.kHealInterval = 2
Crag.kHealEffectInterval = 1

Crag.kHealWaveDuration = 8

Crag.kHealPercentage = 0.06
Crag.kMinHeal = 10
Crag.kMaxHeal = 60
Crag.kHealWaveMultiplier = 1.3
/*
AddMixinNetworkVars(BaseModelMixin, networkVars)
AddMixinNetworkVars(ClientModelMixin, networkVars)
AddMixinNetworkVars(LiveMixin, networkVars)
AddMixinNetworkVars(UpgradableMixin, networkVars)
AddMixinNetworkVars(GameEffectsMixin, networkVars)
AddMixinNetworkVars(FlinchMixin, networkVars)
AddMixinNetworkVars(TeamMixin, networkVars)
AddMixinNetworkVars(CloakableMixin, networkVars)
AddMixinNetworkVars(LOSMixin, networkVars)
AddMixinNetworkVars(DetectableMixin, networkVars)
AddMixinNetworkVars(ConstructMixin, networkVars)
AddMixinNetworkVars(ResearchMixin, networkVars)

AddMixinNetworkVars(ObstacleMixin, networkVars)
AddMixinNetworkVars(CatalystMixin, networkVars)
AddMixinNetworkVars(TeleportMixin, networkVars)
AddMixinNetworkVars(UmbraMixin, networkVars)
AddMixinNetworkVars(DissolveMixin, networkVars)
AddMixinNetworkVars(FireMixin, networkVars)
AddMixinNetworkVars(MaturityMixin, networkVars)
AddMixinNetworkVars(CombatMixin, networkVars)
AddMixinNetworkVars(SelectableMixin, networkVars)
AddMixinNetworkVars(OrdersMixin, networkVars)
AddMixinNetworkVars(IdleMixin, networkVars)
*/

function Crag:GetCragsInRange()

		local nearbycrags = GetEntitiesWithinRange("Crag", self:GetOrigin(), Crag.kHealRadius)
		local cragcount = nearbycrags
		/*
	if not gCragHealIgnoreLOS then

		for addcrag = 1, #nearbycrags do
			if not GetCanHealTarget(nearbycrags[addcrag]) then cragcount = cragcount - 1 end
		end
	end
	*/
		return Clamp(cragcount, 0, gCragMaxInHealRange)
end

local function GetHealTargets(self)

    local targets = {}
    
    -- priority on players
    for _, player in ipairs(GetEntitiesForTeamWithinRange("Player", self:GetTeamNumber(), self:GetOrigin(), Crag.kHealRadius)) do
    
        if player:GetIsAlive() then
			if not gCragHealIgnoreLOS then
			--if GetCanHealTarget(self, player) then
				table.insert(targets, player)
			--end
			end
        end
        
    end

    for _, healable in ipairs(GetEntitiesWithMixinForTeamWithinRange("Live", self:GetTeamNumber(), self:GetOrigin(), Crag.kHealRadius)) do
        
        if healable:GetIsAlive() then
			if not gCragHealIgnoreLOS then
			--if GetCanHealTarget(self, player) then
				table.insertunique(targets, healable)
			--end
			end
        end
        
    end

    return targets

end

function Crag:CragHealBonusMutlipler()
	return (self:GetCragsInRange() * gCragHealBonusRatio)  -- Crags in range converted to % of 10
end

function Crag:GetUnitNameOverride(viewer)
    local unitName = GetDisplayName(self)
    unitName = string.format(Locale.ResolveString("Crag (+ %s 0% heal)"), self:GetCragsInRange())  --, self:CragHealBonusMutlipler() )
	--unitName = unitName + "0% heal)"
	return unitName
end
/*
local function GetCanHealTarget(target)
	--Line of Sight implement
		local canhealtarget = true
	if not gCragHealIgnoreLOS then
		local canhealtarget = false
        local targetOrigin = GetTargetOrigin(target)
        local centerOrigin = self:GetOrigin()
		canhealtarget = GetWallBetween(centerOrigin, targetOrigin, target)
	end
	return canhealtarget
end
*/
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

function Crag:TriggerUmbra()
    local umbra = CreateEntity(CragUmbra.kMapName,  self:GetOrigin() + Vector(0, 0.2, 0), self:GetTeamNumber())
    umbra:SetTravelDestination(self:GetOrigin() + Vector(0, 2, 0) )
    self:TriggerEffects("crag_trigger_umbra")
    return true
end

function Crag:TryHeal(target)
--if GetCanHealTarget(target) then
	
    local unclampedHeal = target:GetMaxHealth() * Crag.kHealPercentage
    local heal = Clamp(unclampedHeal, Crag.kMinHeal, Crag.kMaxHeal) 
       
    if self.healWaveActive then
        heal = heal * Crag.kHealWaveMultiplier
    end
    
    if self:GetCragsInRange() > 0 then
    heal = heal * self:CragHealBonusMutlipler() + heal
    end
	
    if target:GetHealthScalar() ~= 1 and (not target.timeLastCragHeal or target.timeLastCragHeal + Crag.kHealInterval <= Shared.GetTime()) then
       local amountHealed = target:AddHealth(heal)
       target.timeLastCragHeal = Shared.GetTime()
       
       return amountHealed
    else
        return 0
    end
--end
end

-------- Hmmm?? does this even do anything? a 10% dmg discount from minigun? I have no idea.
function Crag:ModifyDamageTaken(damageTable, attacker, doer, damageType, hitPoint)
    if hitPoint ~= nil and doer ~= nil and doer:isa("Minigun") then
        damageTable.damage = damageTable.damage * 0.9
        --self:TriggerEffects("boneshield_blocked", {effecthostcoords = Coords.GetTranslation(hitPoint)} )
    end
end




Shared.LinkClassToMap("Crag", Crag.kMapName, networkVars)
