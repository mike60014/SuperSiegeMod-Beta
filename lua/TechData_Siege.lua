Script.Load("lua/Additions/Convars.lua")
Script.Load("lua/Additions/EggBeacon.lua")
Script.Load("lua/Additions/StructureBeacon.lua")
Script.Load("lua/Weapons/Alien/PrimalScream.lua")
Script.Load("lua/Weapons/Marine/PowerFist.lua")
Script.Load("lua/Additions/BackupLight.lua")
Script.Load("lua/Additions/CommTunnel.lua")
Script.Load("lua/Additions/OnoGrow.lua")
Script.Load("lua/Additions/Onocide.lua")
Script.Load("lua/Additions/CragUmbra.lua")
Script.Load("lua/Additions/CommVortex.lua")
Script.Load("lua/Weapons/Alien/AcidRocket.lua")
Script.Load("lua/Weapons/Alien/Rocket.lua")
--Script.Load("lua/Additions/LerkBileBomb.lua")
Script.Load("lua/MAC_Siege.lua")
Script.Load("lua/Additions/LayStructures.lua")
Script.Load("lua/Additions/ExoWelder.lua")
Script.Load("lua/Additions/ExoFlamer.lua")
Script.Load("lua/Babbler.lua")
Script.Load("lua/Onos.lua")
Script.Load("lua/Jetpack.lua")



kEggBeaconArmor = gEggBeaconArmor
kEggBeaconBuildTime = gEggBeaconBuildTime
kEggBeaconCost = gEggBeaconCost
kEggBeaconCoolDown = gEggBeaconCoolDown
kEggBeaconHealth = gEggBeaconHealth
kEggBeaconMaxHealth = gEggBeaconMaxHealth
kEggBeaconMaxArmor = gEggBeaconMaxArmor


function CheckCommTunnelReq(techId, origin, normal, commander)
local tunnelEntrances = 0
for index, tunnelEntrance in ientitylist(Shared.GetEntitiesWithClassname("CommTunnel")) do
tunnelEntrances = tunnelEntrances + 1
end

   local cyst = GetEntitiesWithinRange("Cyst", origin, 7)
   if #cyst >= 1 then
         for i = 1, #cyst do
            local cysty = cyst[i]
                if cysty:GetCurrentInfestationRadius() == kInfestationRadius then
                return tunnelEntrances < 2
                 end
         end
   end
                return false
end

function GetCheckEggBeacon(techId, origin, normal, commander)
    local num = 0
        for index, shell in ientitylist(Shared.GetEntitiesWithClassname("EggBeacon")) do
           -- if not spur:isa("StructureBeacon") then
                num = num + 1
          --  end
    end
    return num < 1
end

function GetCheckStructureBeacon(techId, origin, normal, commander)
    local num = 0
        for index, shell in ientitylist(Shared.GetEntitiesWithClassname("EggBeacon")) do
           -- if not spur:isa("StructureBeacon") then
                num = num + 1
          --  end
    end
    return num < 1
end


local kSiege_TechData =
{

{ [kTechDataId] = kTechId.LayStructures,
[kTechDataMaxHealth] = kMarineWeaponHealth,
[kTechDataMapName] = LayStructures.kMapName,
[kTechDataDisplayName] = "LayStructures",
[kTechDataModel] = LayStructures.kModelName,
--[kTechDataDamageType] = kWelderDamageType,
[kTechDataCostKey] = kWelderCost
},


--Aliens

{ [kTechDataId] = kTechId.ThickenedSkin,
[kTechDataCategory] = kTechId.ShiftHiveTwo,
[kTechDataDisplayName] = "Thickened Skin",
[kTechDataSponitorCode] = "A",
--[kTechDataModel] = ThickenedSkin.kModelName,
[kTechDataCostKey] = kThickenedSkinCost,
[kTechDataTooltipInfo] = "+3% Max HP per Biomass",
},

{ [kTechDataId] = kTechId.Hunger,
[kTechDataCategory] = kTechId.CragHiveTwo,
[kTechDataDisplayName] = "Hunger",
[kTechDataSponitorCode] = "B",
[kTechDataCostKey] = kHungerCost,
--[kTechDataModel] = Hunger.kModelName,
[kTechDataTooltipInfo] = "10% health / energy gain, and effects of Enzyme on player kill (if gorge then structures not players) ",
},


{ [kTechDataId] = kTechId.Rebirth,
[kTechDataCategory] = kTechId.CragHiveTwo,
[kTechDataDisplayName] = "Rebirth",
[kTechDataSponitorCode] = "A",
[kTechDataCostKey] = kRebirthCost,
--[kTechDataModel] = Rebirth.kModelName,
[kTechDataTooltipInfo] = "Replaces death with egg gestation",
},

// Lifeform purchases
{ [kTechDataId] = kTechId.Redemption,
[kTechDataCategory] = kTechId.CragHiveTwo,
[kTechDataDisplayName] = "Redemption",
[kTechDataSponitorCode] = "B",
[kTechDataCostKey] = kRedemptionCost,
--[kTechDataModel] = Redemption.kModelName,
[kTechDataTooltipInfo] = "Check every 3 secs if (HP = 15%-30%) then randomly tp to a spawn egg after (1-4) secs",
},

{ [kTechDataId] = kTechId.AcidRocket,
[kTechDataCategory] = kTechId.Fade,
[kTechDataMapName] = AcidRocket.kMapName,  -- "acidrocket"
[kTechDataCostKey] = kStabResearchCost,  --kStabResearchCost, kAcidRocketResearchCost
[kTechDataResearchTimeKey] = kStabResearchTime, --kStabResearchTime, kAcidRocketResearchTime
[kTechDataDamageType] = kDamageType.Corrode,
[kTechDataDisplayName] = "AcidRocket",
[kTechDataTooltipInfo] = "Ranged Projectile dealing damage only to armor and structures",
[kTechDataModel] = Babbler.kModelName,
},

/*
{ [kTechDataId] = kTechId.LerkBileBomb,
[kTechDataCategory] = kTechId.Lerk,
[kTechDataMapName] = LerkBileBomb.kMapName,
[kTechDataCostKey] = gLerkBileBombResearchCost,
[kTechDataResearchTimeKey] = gLerkBileBombResearchTime,
[kTechDataDamageType] = kDamageType.Corrode,
[kTechDataDisplayName] = "LerkBileBomb",
[kTechDataTooltipInfo] = "Derp",
[kTechDataModel] = LerkBileBomb.kModelName,
},
*/

 { [kTechDataId] = kTechId.CommVortex,
[kTechDataMapName] = CommVortex.kMapName,
[kTechDataAllowStacking] = true,
[kTechDataIgnorePathingMesh] = true,
[kTechDataCollideWithWorldOnly] = true,
[kTechDataRequiresInfestation] = true,
[kTechDataDisplayName] = "Etheral Gate",
[kTechDataCostKey] = gCommVortexCost,
[kTechDataCooldown] = gCommVortexCoolDown,
--[kTechDataModel] = CommVortex.kModelName,
[kTechDataTooltipInfo] =  "Temporarily places marine structures/macs/arcs in another dimension rendering them unable to function correctly. ",
},

{ [kTechDataId] = kTechId.CragUmbra,
[kTechDataDisplayName] = "UMBRA",
--[kVisualRange] = Crag.kHealRadius,
[kTechDataCooldown] = gCragUmbraCooldown,
[kTechDataCostKey] = gCragUmbraCost,
--[kTechDataModel] = CragUmbra.kModelName,
[kTechDataTooltipInfo] = "CRAG_UMBRA_TOOLTIP",
},


{ [kTechDataId] = kTechId.CommTunnel,
--[kTechDataSupply] = kCommTunnelSupply,
[kTechDataBuildRequiresMethod] = CheckCommTunnelReq,
[kTechDataBuildMethodFailedMessage] = "2max/near fully infested cyst only",
[kTechDataGhostModelClass] = "AlienGhostModel",
[kTechDataModel] = TunnelEntrance.kModelName,
[kTechDataMapName] = CommTunnel.kMapName,
[kTechDataMaxHealth] = gTunnelEntranceHealth,
[kTechDataMaxArmor] = gTunnelEntranceArmor,
[kTechDataPointValue] = gTunnelEntrancePointValue,
[kTechDataCollideWithWorldOnly] = true,
[kTechDataDisplayName] = "Commander Tunnel",
[kTechDataCostKey] = 4,
[kTechDataRequiresInfestation] = false,
[kTechDataTooltipInfo] =  "GORGE_TUNNEL_TOOLTIP",
},

{ [kTechDataId] = kTechId.PrimalScream,
[kTechDataCategory] = kTechId.Lerk,
[kTechDataDisplayName] = "Primal Scream",
[kTechDataMapName] =  Primal.kMapName,
--[kTechDataCostKey] = kPrimalScreamCostKey,
-- [kTechDataResearchTimeKey] = kPrimalScreamTimeKey,
--[kTechDataModel] = Primal.kModelName,
[kTechDataTooltipInfo] = "+Energy to teammates, enzyme cloud",
},

{ [kTechDataId] = kTechId.OnoGrow,
[kTechDataCategory] = kTechId.Onos,
[kTechDataMapName] = OnoGrow.kMapName,
[kTechDataCostKey] = kStabResearchCost,
--[kTechDataModel] = OnoGrow.kModelName,
[kTechDataResearchTimeKey] = kStabResearchTime,
--   [kTechDataDamageType] = kStabDamageType,
[kTechDataDisplayName] = "OnoGrow",
[kTechDataTooltipInfo] = "",
},

{ [kTechDataId] = kTechId.Onocide,
[kTechDataCategory] = kTechId.Onos,
[kTechDataMapName] = Onocide.kMapName,
[kTechDataCostKey] = 10,
--[kTechDataModel] = Onocide.kModelName,
[kTechDataResearchTimeKey] = 10,
--   [kTechDataDamageType] = kStabDamageType,
[kTechDataDisplayName] = "Onicide",
[kTechDataTooltipInfo] = "Onicide, Blow up Enemies! Damage = 5-45% current hp",
},

{ [kTechDataId] = kTechId.EggBeacon,
[kTechDataCooldown] = kEggBeaconCoolDown,
[kTechDataTooltipInfo] = "Eggs Spawn approximately at the placed Egg Beacon. Be careful as infestation is required.",
[kTechDataGhostModelClass] = "AlienGhostModel",
[kTechDataBuildRequiresMethod] = GetCheckEggBeacon,
[kTechDataMapName] = EggBeacon.kMapName,
[kTechDataDisplayName] = "Egg Beacon",
[kTechDataCostKey] = kEggBeaconCost,
[kTechDataRequiresInfestation] = true,
[kTechDataHotkey] = Move.C,
[kTechDataBuildTime] = kEggBeaconBuildTime,
[kTechDataModel] = EggBeacon.kModelName,
[kTechDataBuildMethodFailedMessage] = "1 at a time",
[kVisualRange] = 8,
[kTechDataMaxHealth] = kEggBeaconHealth,
[kTechDataMaxArmor] = kEggBeaconArmor,
},


{ [kTechDataId] = kTechId.StructureBeacon,
[kTechDataCooldown] = gAlienStructureBeaconCoolDown,
[kTechDataTooltipInfo] = "Structures move approximately at the placed Egg Beacon",
[kTechDataGhostModelClass] = "AlienGhostModel",
[kTechDataMapName] = StructureBeacon.kMapName,
[kTechDataDisplayName] = "Structure Beacon",  [kTechDataCostKey] = gAlienStructureBeaconCost,
[kTechDataRequiresInfestation] = true, [kTechDataHotkey] = Move.C,
[kTechDataBuildTime] = gAlienStructureBeaconBuildTime,
[kTechDataModel] = StructureBeacon.kModelName,
[kVisualRange] = gAlienStructureBeaconVisualRange,
[kTechDataMaxHealth] = gAlienStructureBeaconHealth,
[kTechDataMaxArmor] = gAlienStructureBeaconArmor,
},



--Marines


{
[kTechDataId] = kTechId.AdvBeacTech,
[kTechDataCostKey] = kAdvBeacTechChost,
[kTechDataDisplayName] = "Advanced Beacon Tech",
[kTechDataResearchTimeKey] = kAdvBeacTechTime,
--[kTechDataModel] = AdvBeacTech.kModelName,
[kTechDataTooltipInfo] = "Unlocks Advanced Beacon (of which revives dead players and teleports exos)"
},


{ [kTechDataId] = kTechId.AdvancedBeacon,
[kTechDataBuildTime] = 0.1,
[kTechDataCooldown] = kAdvancedBeaconCoolDown,
[kTechDataDisplayName] = "Advanced Beacon",
[kTechDataHotkey] = Move.B,
[kTechDataCostKey] = kAdvancedBeaconCost,
--[kTechDataModel] = AdvancedBeacon.kModelName,
[kTechDataTooltipInfo] = "Revives Dead Players as well. Powers off Observatory for a short duration after beaconing.",
},


{ [kTechDataId] = kTechId.DualWelderExosuit,
[kTechIDShowEnables] = false,
[kTechDataDisplayName] = "Dual Welders",
[kTechDataMapName] = "exosiege",
[kTechDataCostKey] = gCreditClassCostWelder,
[kTechDataHotkey] = Move.E,
[kTechDataModel] = ExoWelder.kModelName,
[kTechDataTooltipInfo] = "Dual Welders",
[kTechDataSpawnHeightOffset] = kCommanderEquipmentDropSpawnHeight,
},


{ [kTechDataId] = kTechId.DualFlamerExosuit,
[kTechIDShowEnables] = false,
[kTechDataDisplayName] = "Dual Flame Exo",
[kTechDataMapName] = "exosiege",
--[kTechDataModel] = ExoFlamer.kModelName,
[kTechDataCostKey] = gCreditClassCostFlamer,
[kTechDataHotkey] = Move.E,
--[kTechDataModel] = ExoFlamer.kModelName,
[kTechDataTooltipInfo] = "Dual Flame Exo",
[kTechDataSpawnHeightOffset] = kCommanderEquipmentDropSpawnHeight,
},


{ [kTechDataId] = kTechId.JumpPack,
[kTechDataCostKey] = kJumpPackCost,
[kTechDataDisplayName] = "Jump Pack",
[kTechDataHotkey] = Move.Z,
[kTechDataModel] = Jetpack.kModelName,
[kTechDataTooltipInfo] = "Mimics the NS1/HL1 JumpPack (With Attempted Balance Modifications WIP) - Press DUCK + Jump @ the same time to mindfuck the alien team.",
},


{ [kTechDataId] = kTechId.DropMAC,
[kTechDataMapName] = DropMAC.kMapName,
[kTechDataDisplayName] = "MAC",
[kTechIDShowEnables] = false,
[kTechDataTooltipInfo] =  "Now Constructable!",
[kTechDataModel] = MAC.kModelName,
[kTechDataBuildTime] = 1, --1,
[kTechDataCostKey] = kMACCost,
[kStructureAttachRange] = 8,
[kTechDataSupply] = kMACSupply,
[kStructureAttachId] = { kTechId.RoboticsFactory, kTechId.ARCRoboticsFactory },
[kStructureAttachRequiresPower] = true,
},

{ [kTechDataId] = kTechId.BackupLight,
[kTechDataHint] = "Powered by thought!",
[kTechDataGhostModelClass] = "MarineGhostModel",
[kTechDataRequiresPower] = true,
[kTechDataMapName] = BackupLight.kMapName,
[kTechDataDisplayName] = "Backup Light",
[kTechDataSpecifyOrientation] = true,
[kTechDataCostKey] = gCreditStructureBackupLightCost,
[kTechDataBuildMethodFailedMessage] = "1 per room",
[kStructureBuildNearClass] = "SentryBattery",
[kStructureAttachId] = kTechId.SentryBattery,
[kTechDataBuildRequiresMethod] = GetCheckLightLimit,
[kStructureAttachRange] = gCreditStructureBackupLightAttachRange,
[kTechDataModel] = BackupLight.kModelName,
[kTechDataBuildTime] = gCreditStructureBackupLightBuildTime,
[kTechDataMaxHealth] = gCreditStructureBackupLightMaxHealth,
[kTechDataMaxArmor] = gCreditStructureBackupLightMaxArmor,
[kTechDataPointValue] = gCreditStructureBackupLightPointValue,
[kTechDataHotkey] = Move.O,
[kTechDataNotOnInfestation] = false,
[kTechDataTooltipInfo] = "This bad boy right here has the potential to blind anyone standing in its way.. or just.. you know.. help brighten the mood wherever it's placed.",
[kTechDataObstacleRadius] = gCreditStructureBackupLightObstacleRadius,
},

{ [kTechDataId] = kTechId.Fist,
[kTechDataMapName] = Fist.kMapName,
[kTechDataDisplayName] = "SWITCH_AX",
[kTechDataModel] = Fist.kModelName,
[kTechDataDamageType] = kFistDamageType,
[kTechDataCostKey] = kFistCost,
[kTechDataTooltipInfo] = "Fist_TOOLTIP",
},

{ [kTechDataId] = kTechId.PowerFist,
[kTechDataMapName] = PowerFist.kMapName,
[kTechDataDisplayName] = "PULSE_GRENADE",
[kTechDataModel] = PowerFist.kModelName,
[kTechDataDamageType] = kPowerFistDamageType,
[kTechDataCostKey] = kPowerFistCost,
[kTechDataTooltipInfo] = "PowerFist_TOOLTIP",
},



{ [kTechDataId] = kTechId.MacSpawnOn,
[kTechDataCooldown] = 5,
[kTechDataDisplayName] = "Automatically spawn up to 12 macs for you",
[kTechDataCostKey] = 0,
[kTechDataTooltipInfo] = " 12 Macs Maximum. Turning this on will automatically spawn up to this many for you",
},

{ [kTechDataId] = kTechId.MacSpawnOff,
[kTechDataCooldown] = 5,
[kTechDataDisplayName] = "Disables automatic small mac spawning",
[kTechDataCostKey] = 0,
[kTechDataTooltipInfo] = "For those who prefer micro management",
},

{ [kTechDataId] = kTechId.ArcSpawnOn,
[kTechDataCooldown] = 5,
[kTechDataDisplayName] = "Automatically spawn up to 12 arcs for you",
[kTechDataCostKey] = 0,
[kTechDataTooltipInfo] = "12 Arcs Maximum. Turning this on will automatically spawn up to this many for you",
},

{ [kTechDataId] = kTechId.ArcSpawnOff,
[kTechDataCooldown] = 5,
[kTechDataDisplayName] = "Disables automatic arc spawning",
[kTechDataCostKey] = 0,
[kTechDataTooltipInfo] = "For those who prefer micro management",
},


}



local buildTechData = BuildTechData
function BuildTechData()

    local defaultTechData = buildTechData()
    local moddedTechData = {}
    local usedTechIds = {}

    for i = 1, #kSiege_TechData do
        local techEntry = kSiege_TechData[i]
        table.insert(moddedTechData, techEntry)
        table.insert(usedTechIds, techEntry[kTechDataId])
    end

    for i = 1, #defaultTechData do
        local techEntry = defaultTechData[i]
        if not table.contains(usedTechIds, techEntry[kTechDataId]) then
            table.insert(moddedTechData, techEntry)
        end
    end

    return moddedTechData

end


