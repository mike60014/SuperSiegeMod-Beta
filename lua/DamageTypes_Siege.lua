--
-- Damage types
--
-- In NS2 - Keep simple and mostly in regard to armor and non-armor. Can't see armor, but players
-- and structures spawn with an intuitive amount of armor.
-- http://www.unknownworlds.com/ns2/news/2010/6/damage_types_in_ns2
--
-- Normal - Regular damage
-- Light - Reduced vs. armor
-- Heavy - Extra damage vs. armor
-- Puncture - Extra vs. players
-- Structural - Double against structures
-- GrenadeLauncher - Double against structures with 20% reduction in player damage
-- Flamethrower - 5% increase for player damage from structures
-- Gas - Breathing targets only (Spores, Nerve Gas GL). Ignores armor.
-- StructuresOnly - Doesn't damage players or AI units (ARC)
-- Falling - Ignores armor for humans, no damage for some creatures or exosuit
-- Door - Like Structural but also does damage to Doors. Nothing else damages Doors.
-- Flame - Like normal but catches target on fire and plays special flinch animation
-- Corrode - deals normal damage to structures but armor only to non structures
-- ArmorOnly - always affects only armor
-- Biological - only organic, biological targets (non mechanical)
-- StructuresOnlyLight - same as light damage but will not harm players or units which are not valid for structural damage
--
-- ========= For more information, visit us at http://www.unknownworlds.com =====================


--globals for balance-extension tweaking
kGorgeSpitDamageBonusAtMax = 0.5 -- spit does 1.5 damage instead of 2, but will fire faster to compensate
kStabDamageBonusAtMax = kAlienFocusDamageBonusAtMax -- anticipating this will need tweaking later

-- Use this function to change damage according to current upgrades
function NS2Gamerules_GetUpgradedDamage(attacker, doer, damage, damageType, hitPoint)

    local damageScalar = 1

    if attacker ~= nil then
    
        -- Damage upgrades only affect weapons, not ARCs, Sentries, MACs, Mines, etc.
        if doer.GetIsAffectedByWeaponUpgrades and doer:GetIsAffectedByWeaponUpgrades() then
        
            damageScalar = NS2Gamerules_GetUpgradedDamageScalar( attacker )
            
        end
        
    end
        
    return damage * damageScalar
    
end

--TODO Clean up / simplify
function NS2Gamerules_GetAlienVampiricLeechFactor( attacker, doer, damageType, veilLevel )
    
    local leechFactor = 0
    local attackerClass = attacker:GetClassName()
    local doerClassName = doer:GetClassName()
    local baseLeechAmount = kLifeformVampirismScalars[attackerClass]
    	
    if doerClassName == "XenocideLeap" or doerClassName == "AcidRocket" or doerClassName == "Onocide" or doerClassName == "SporeCloud" or doerClassName == "Shockwave" or doerClassName == "Parasite" or doerClassName == "DotMarker" or doerClassName == "Babbler" or doerClassName == "Hydra" then
		return 0
    end
	
    if attackerClass == "Lerk" then
        
        --Note: this will need to be adjusted should Lerk Spikes damage type ever change
        if doerClassName == "LerkBite" and damageType == kDamageType.Puncture then --Spikes
            doerClassName = "LerkSpikes"
        end
        
	end

    
    if baseLeechAmount ~= nil and type(baseLeechAmount) == "number" then
        leechFactor = baseLeechAmount * ( veilLevel * kAlienVampirismHealingScalarPerLevel )
    end
    
    return leechFactor
    
end

/*
-- only certain abilities should work with focus
-- global so mods can easily change this
function InitializeFocusAbilities()
    kFocusAbilities = {}
    kFocusAbilities[kTechId.Bite] = true
    kFocusAbilities[kTechId.Spit] = true
    kFocusAbilities[kTechId.LerkBite] = true
    kFocusAbilities[kTechId.Swipe] = true
    kFocusAbilities[kTechId.Stab] = true
    kFocusAbilities[kTechId.Gore] = true
end

kDamageType = enum( 
{
    'Normal', 'Light', 'Heavy', 'Puncture', 
    'Structural', 'StructuralHeavy', 'Splash', 
    'Gas', 'NerveGas', 'StructuresOnly', 
    'Falling', 'Door', 'Flame', 'Infestation', 
    'Corrode', 'ArmorOnly', 'Biological', 'StructuresOnlyLight', 
    'Spreading', 'GrenadeLauncher'
})

-- Describe damage types for tooltips
kDamageTypeDesc = {
    "",
    "Light damage: reduced vs. armor",
    "Heavy damage: extra vs. armor",
    "Puncture damage: extra vs. players",
    "Structural damage: Double vs. structures",
    "StructuralHeavy damage: Double vs. structures and double vs. armor",
    "Gas damage: affects breathing targets only",
    "NerveGas damage: affects biological units, player will take only armor damage",
    "Structures only: Doesn't damage players or AI units",
    "Falling damage: Ignores armor for humans, no damage for aliens",
    "Door: Can also affect Doors",
    "Corrode damage: Damage structures or armor only for non structures",
    "Armor damage: Will never reduce health",
    "StructuresOnlyLight: Damages structures only, light damage.",
    "Splash: same as structures only but always affects ARCs (friendly fire).",
    "Spreading: Does less damage against small targets.",
    "GrenadeLauncher: Double structure damage, 20% reduction in player damage"
}
*/
kSpreadingDamageScalar = 0.75

kBaseArmorUseFraction = 0.7
kExosuitArmorUseFraction = 1 -- exos have no health
kStructuralDamageScalar = 2
kPuncturePlayerDamageScalar = 2
kGLPlayerDamageReduction = 0.8
kFTStructureDamage = 1.125

kLightHealthPerArmor = 4
kHealthPointsPerArmor = 2
kHeavyHealthPerArmor = 1

kFlameableMultiplier = 2.5
kCorrodeDamagePlayerArmorScalar = 0.12
kCorrodeDamageExoArmorScalar = 0.4

kStructureLightHealthPerArmor = 9
kStructureLightArmorUseFraction = 0.9

-- deal only 33% of damage to friendlies
kFriendlyFireScalar = 0.33

--kDamageTypeGlobalRules = nil
--kDamageTypeRules = nil

--[[
 * Define any new damage type behavior in this function
 
 --]]
 
 /*
local function BuildDamageTypeRules()
   
     -- Splash rules
    --kDamageTypeRules[kDamageType.Splash] = {}
    --table.insert(kDamageTypeRules[kDamageType.Splash], DamageStructuresOnly)
    -- ------------------------------
 
end
*/
