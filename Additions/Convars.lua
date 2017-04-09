--Global Variables for everything

--Other



--Unused Start
gWeaponUseTimeLimit = 0.5 --weapon_server.lua






--Unused End

kLimitCragsinHiveRoom = 5

--Credits Start


gCreditStructuredefHUDSlot = 5
gCreditStructurePlacementDistance = 4



--Structures
gCreditStructureObservatoryCost = 10
gCreditStructureArmoryCost = 12
gCreditStructureSentryCost = 8
gCreditStructureSentryLimit = 2
gCreditStructureBackUpBatteryCost = 6
gCreditStructureBackUpBatteryLimit = 1

gCreditStructureBackupLightCost = 6
gCreditStructureBackupLightLimit = 2
gCreditStructureBackupLightBuildTime = 6
gCreditStructureBackupLightMaxHealth = 1000
gCreditStructureBackupLightMaxArmor = 100
gCreditStructureBackupLightPointValue = 2
gCreditStructureBackupLightObstacleRadius = 0.25
gCreditStructureBackupLightAttachRange = 5

gCreditStructurePhaseGateCost = 15
gCreditStructurePhaseGateLimit = 2
gCreditStructureInfantryPortalCost = 15
gCreditStructureInfantryPortalLimit = 50
gCreditStructureRoboticsFactoryCost = 10
gCreditStructureRoboticsFactoryLimit = 50
gCreditStructureMacCost = 4
gCreditStructureMacLimit = 2
gCreditStructureArcCost = 20
gCreditStructureArcLimit = 1
gCreditStructureExtractorCost = 500
gCreditStructureExtractorLimit = 1

--Units
gCreditClassCostJetPack = 8
gCreditClassCostRailGun = 29
gCreditClassCostMiniGun = 30
gCreditClassCostWelder = 25
gCreditClassCostFlamer = 27
gCreditClassCostGorge = 9
gCreditClassCostLerk = 12
gCreditClassCostFade = 20
gCreditClassCostOnos = 25


--Weapons
gCreditWeaponCostMines = 1.5
gCreditWeaponCostWelder = 1
gCreditWeaponCostHMG = 5
gCreditWeaponCostShotGun = 2
gCreditWeaponCostFlameThrower = 3
gCreditWeaponCostGrenadeLauncher = 3



--Alien Abilties
gCreditAbilityCostInk = 1.5
gCreditAbilityCostNutrientMist = 1
gCreditAbilityCostHallucination = 1.75
gCreditAbilityCostEnzymeCloud = 1.5
gCreditAbilityCostContamination = 1
--Alien Credit Structures
gCreditStructureCostHydra = 1
gCreditStructureCostSaltyEgg = 15
gCreditStructureLimitSaltyEgg = 5
gCreditStructureCostShade = 10
gCreditStructureCostCrag = 10
gCreditStructureCostWhip = 10
gCreditStructureCostShift = 10
gCreditStructureCost = 10
gCreditStructureCost = 10
--gCreditStructureCost = 
gCreditStructureCostHarvesterExtractor = 500
gCreditStructureLimitHarvesterExtractor = 1



gCreditPlayerCapPerRound = 200
gCreditPlayerMultiplier = 1
gCreditPlayerSaveJSONFileInterval = 10
gCreditPlayerHTTPReqInterval = 20
gCreditPlayerNotePlayersInterval = 60
gCreditPlayerEndRndDisplayTime = 5

--Credit Team 1
gCreditPlayerTeamOneBuyDelay = 4
gCreditPlayerTeamOneCreditCost = 1
gCreditPlayerTeamOneLimit = 3

gCreditPlayerEnergyCost = 0

--Credit Team 2
gCreditPlayerTeamTwoBuyDelay = 4
gCreditPlayerTeamTwoCreditCost = 2
gCreditPlayerTeamTwoLimit = 3
--KPlayerCreditTeamOne

kCreditCommReward = 10



--Credits End

kMaxEntitiesInRadius = 300
kMaxEntityRadius = 100

--Doors
kDoorMoveUpVect = 40
kPrimaryTimer = 0
kSideTimer = 0 -- b/c maps still use this




--Alien Settings
kAlienDefaultAddXp = 0.5
kAlienDefaultLvl = 25
gAlienEnergyRecuperationRate = 10.0
gAlienWalkBackwardSpeedScalar = 1
gAlienEnergyAdrenalineRecuperationRate = 15




--Alien Upgrades
kEggBeaconArmor = 150
kEggBeaconBuildTime = 8
kEggBeaconCost = 10
kEggBeaconCoolDown = 12
kEggBeaconHealth = 480
kEggBeaconMaxHealth = 715
kEggBeaconMaxArmor = 200

kMatureEggHealth = 400
kMatureEggArmor = 250
kEggHealth = 300
kEggArmor = 150
kEggPointValue = 2


kBabblerHealth = 15 --default 10

gCommVortexCoolDown = 20
gCommVortexCost = 8

gCragUmbraCooldown = 10
gCragUmbraCost = 5
gCragUmbraRadius = 12

gAlienStructureBeaconArmor = 175
gAlienStructureBeaconBuildTime = 8
gAlienStructureBeaconCost = 10
gAlienStructureBeaconCoolDown = 12
gAlienStructureBeaconHealth = 675
gAlienStructureBeaconVisualRange = 8


--Gorge Settings
gTunnelEntranceArmor = kTunnelEntranceArmor
gTunnelEntranceHealth = kTunnelEntranceHealth
gTunnelEntrancePointValue = kTunnelEntrancePointValue
gTunnelEntranceMaturationTime = 4 -- 135
--Gorge Abilties


--Gorge End
--Lerk Settings
--Lerk Abiltiies
kPrimalScreamEnergyCost = 20
kPrimalScreamROF = 1
kPrimalScreamPlayerPointBonus = 0.3

gLerkBileBombResearchCost = 10
gLerkBileBombResearchTime = 10
--Lerk End
--Fade Settings

gFadePrimaryAttackSpeedMultipler = 1 --Increase to slow attack
gFadePrimaryAttackSpeedOnFireMultipler = 1.25 --Increase to slow attack while onfire
kFadeArmor = 104 --30% increase from 80
kFadeArmorFullyUpgradedAmount = 156 --30% increase from 120
gFadeRedemptionCooldown = 20
gFadeRebirthLength = 4

--Fade abilities
gStabResearchTime = 20 --default 60
gStabResearchCost = 20 --default 60

gAcidRocketDamage = 20 --25
gAcidRocketDamageType = kDamageType.Structural
gAcidRocketEnergyCost = 17 --10
gAcidRocketFireDelay = 0.5
gAcidRocketRadius = 4 --6
gAcidRocketResearchTime = 20
gAcidRocketResearchCost = 20
gAcidRocketVelocity = 45
gAcidRocketPlayerVelocityFraction = 0.5
--1gAcidRocket
gAcidRocketHUDSlot = 4

--Fade End

--Onos abilities
kOnocideDetonateTime = 2.0
kOnocideDetonateRange = 1
kOnosStunWallLifeSpan = 3
kOnosStunWallHealth = 200
kOnosHealtPerBioMass = 31
gOnosStompBoneWallDuration = 2 --4
--Onos abilities End



kGorgeRedemptionCooldown = 15
kGorgeRebirthLength = 3

--Marine Upgrades

gAxeHUDSlot = 3 --6
gAxeRange = 1.5
gAxeFloorRange = 1
--gAxePrimaryAttackDelay = 
gAxeSecondaryAttackDelay = 1
gAxe = 0
gAxe = 0
gAxe = 0




kAdvancedBeaconCost = 13

kArmoryHealth = 2000
kArmoryArmor = 500
kArmoryPointValue = 6
kArmoryLvl = 75
kArmoryAddXp = 1
kAdvancedArmoryHealth = 3500
kAdvancedArmoryArmor = 750
kAdvancedArmoryPointValue = 11

kSentrySupply = 2
kSentryHealth = 650
kSentryArmor = 125
kSentryPointValue = 3

kBatteryPowerRange = 4
kCommSentryPerRoom = 6
kInfantryPortalMaxLevel = 25
kInfantryPortalXPGain = 0.5
kMacMaxLevel = 50
gMacMaxAmount = 12
gArcMaxAmount = 12

kMarineDefAddXp = 0.5
kMarineDefLvl = 25

kMarineStunImmuneTime = 2

--kJumpPackCost = 7

--Welder

kWelderPointsPerScore = 10
kWelderScoreAddedPerPoints = 1




--Rifle

gRifleAddClipSize = 25
gRifleClipSize = kRifleClipSize + gRifleAddClipSize


--Shotgun

kShotgunBulletSize = 0.016

--ExoFlamer
kExoFlamerConeWidth = 0.25 --0.17
kExoFlamerCoolDownRate = 0.25 --0.24
kExoFlamerDamage = 15 --23
kExoFlamerDamageLength = 10
kExoFlamerDamageLevels = 5 --3 WIP
kExoFlamerDamageOverTimePerLevel = 5 -- WIP
kExoFlamerDualGunHeatUpRate = 0.06
kExoFlamerFireRate = 0.15
kExoFlamerHeatUpRate = 0.100 --0.168
kExoFlamerImpactEffectRate = 0.15
kExoFlamerPilotEffectRate = 0.3
kExoFlamerSmokeEffectRate = 1.5
kExoFlamerhardeningModifier = 0.8
kExoFlamermaxHardeningValue = 2
kExoFlamerminHardeningValue = 0.5
kExoFlamerTrailnumFlameSegments = 30
kExoFlamer3PminHardeningValue = 0.1  --ThirdPerson view
kExoFlamer3PTrailnumFlameSegments = 8  --ThirdPerson view
kExoFlamerTrailWeight = 0.6
kExoFlamerTrailLength = 9.5
kExoFlameralienvisibilityChangeDuration = 0.5
kExoFlamerMoveSpeedWhileFiringMultipler = 1  --1 = no change in speed. 1.25 = slow by 25%

gExoFlamerThrusterHorizontalAcceleration = 23


--ExoWelder
kExoWelderDamagePerSecond = 28
kExoWelderPlayerWeldRate = 20 --15
kExoWelderStructureWeldRate = 75 --65
kExoWelderStructureWeldRateBreakableDoor = kExoWelderStructureWeldRate * 1.2--65
kExoWelderWeldRange = 4
kExoWelderWelderEffectRate = 0.45
kExoWelderHealScoreAdded = 2
kExoWelderAmountHealedForPoints = 175
kExoWelderMoveSpeedWhileFiringMultipler = 1  --1 = no change in speed. 1.25 = slow by 25%
gExoWelderThrusterHorizontalAcceleration = 23


gExoMinigunThrusterHorizontalAcceleration = 23
kExoMinigunMoveSpeedWhileFiringMultipler = 1  --1 = no change in speed. 1.25 = slow by 25%

gExoRailgunThrusterHorizontalAcceleration = 23
kExoRailgunMoveSpeedWhileFiringMultipler = 1  --1 = no change in speed. 1.25 = slow by 25%

kHorizontalThrusterAddSpeed = 2.5


gAllExoWalkMaxSpeed = 3.7
gAllExoMaxSpeed = 5.75
gAllExoViewOffsetHeight = 2.3

gExoMinigunAcceleration = 20 -- 20
gExoRailgunAcceleration = 20 -- 20
gExoFlamerAcceleration = 20 -- 20
gExoWelderAcceleration = 20 -- 20

gExoMinigunGetStunnedCooldown = 3
gExoRailgunGetStunnedCooldown = 3
gExoFlamerGetStunnedCooldown = 3
gExoWelderGetStunnedCooldown = 3

gExoMinigunUseCatPackCooldown = 6 -- 6
gExoRailgunUseCatPackCooldown = 6 -- 6
gExoFlamerUseCatPackCooldown = 6 -- 6
gExoWelderUseCatPackCooldown = 6 -- 6
/*

gExoMinigun
gExoRailgun
gExoFlamer
gExoWelder

gExoMinigun
gExoRailgun
gExoFlamer
gExoWelder

gExoMinigun
gExoRailgun
gExoFlamer
gExoWelder

gExoMinigun
gExoRailgun
gExoFlamer
gExoWelder
*/
gExoMinigunXZExtents = 0.55 -- 0.55
gExoRailgunXZExtents = 0.55 -- 0.55
gExoFlamerXZExtents = 0.55 -- 0.55
gExoWelderXZExtents = 0.55 -- 0.55

gExoMinigunYExtents = 1.2 -- 1.20
gExoRailgunYExtents = 1.2 -- 1.20
gExoFlamerYExtents = 1.2 -- 1.20
gExoWelderYExtents = 1.2 -- 1.20

gExoMinigunThrustersCooldownTime = 2.0 -- 2.5
gExoRailgunThrustersCooldownTime = 2.0 -- 2.5
gExoFlamerThrustersCooldownTime = 2.0 -- 2.5
gExoWelderThrustersCooldownTime = 2.0 -- 2.5

gExoMinigunThrustersDuration = 2.0 -- 1.5
gExoRailgunThrustersDuration = 2.0 -- 1.5
gExoFlamerThrustersDuration = 2.0 -- 1.5
gExoWelderThrustersDuration = 2.0 -- 1.5

gExoMinigunThrustersMinimumFuel = 0.50 -- 0.99
gExoRailgunThrustersMinimumFuel = 0.50 -- 0.99
gExoFlamerThrustersMinimumFuel = 0.50 -- 0.99
gExoWelderThrustersMinimumFuel = 0.50 -- 0.99

gExoMinigunCrouchShrinkAmount = 0 -- 0
gExoRailgunCrouchShrinkAmount = 0 -- 0
gExoFlamerCrouchShrinkAmount = 0 -- 0
gExoWelderCrouchShrinkAmount = 0 -- 0

gExoMinigunExtentsCrouchShrinkAmount = 0 -- 0
gExoRailgunExtentsCrouchShrinkAmount = 0 -- 0
gExoFlamerExtentsCrouchShrinkAmount = 0 -- 0
gExoWelderExtentsCrouchShrinkAmount = 0 -- 0

gExoMinigunSmashEggRange = 1.0 -- 1.5
gExoRailgunSmashEggRange = 1.0 -- 1.5
gExoFlamerSmashEggRange = 1.0 -- 1.5
gExoWelderSmashEggRange = 1.0 -- 1.5

--kHealthWarningTrigger
--kHealthCriticalTrigger

gAllExoHealthWarningTrigger = 0.4
gAllExoHealthCriticalTrigger = 0.2


gAllExoDeployDuration = 1.0
gAllExoEjectDuration = 1.0
kAllExoArmorPerUpgradeLevel = 35
kAllExoArmor = 385
--gAllExoThrusterHorizontalAcceleration =
gNanoArmorHealPerSecond = 5 --2



kObsAdvBeaconPowerOff = 16 --12 w/ lvl 25
--kAdvBeacTechCost = 15
--kAdvBeacTechTime = 30

/////////////Begin Other Configs


--BalanceMisc_Siege.lua
kNumWebsPerGorge = 6
kChargeEnergyCost = 20 --def 20
kLerkFlapEnergyCost = 2
kHallucinationHealthFraction = 0.25 --default 0.20
kHallucinationArmorFraction = 0.10 -- default 0
kHallucinationMaxHealth = 725 -- default 700
kHeavyMachineGunWeight = 0.20 -- default 0.26
--kNumMines 3 -- default 2
--kEggsPerHatch = 4 -- default 2
kDrifterSupply = 3 --default 10
kHiveInfestationRadius = 8 --8
kMACSupply = 3


kJetpackReplenishFuelRate = .14 -- .11 to .14 %30 increase
kJetpackUseFuelRate = 0.147 -- 30% decrease from .21
kJetpackFuelReplenishDelay = 0.1
--kJetpackWeightLiftForce = 
--kMinWeightJetpackFuelFactor = 


--kXenocideDamageType = kDamageType.Structural
kSwipeDamageType = kDamageType.Normal
kGoreDamage = 100


kUmbraEnergyCost = 23

kGorgeCost = 10
kLerkCost = 20
kFadeCost = 40
kOnosCost = 65

kCommEggOnosCost = 90 --default 100
kSkulkUpgradeCost = 0
kGorgeUpgradeCost = 0
kLerkUpgradeCost = 1
kFadeUpgradeCost = 1
kOnosUpgradeCost = 1


kUmbraShotgunModifier = 0.70
kUmbraBulletModifier = 0.70
kUmbraMinigunModifier = 0.70
kUmbraRailgunModifier = 0.70
kUmbraGrenadeModifer = 0.70


kNumBabblerEggsPerGorge = 3
kRebirthHpBuffTriggered = 1.10
kRebirthHpBuffNew = 1.10
kOnocideDamage = 779
kPrimalScreamROFIncrease = .3
kVortexLifeSpan = 8

kPrimalScreamEnergyCost = 25
kPrimalScreamRange = 10
kPrimalScreamDamageModifier = 1.3
kPrimalScreamDuration = 4
kPrimalScreamEnergyGain = 60
kPrimalScreamROF = 3

kRedemptionCost = 2
kRebirthCost = 2
kRedemptionCooldown = 45
kRedemptionCooldown = 45
kRedemptionEHPThresholdMin = 15
kRedemptionEHPThresholdMax = 30

kBabblerDamage = 9 --default 8 
kExosuitDropCost = 35 -- default 50
kHeavyMachineGunDropCost = 25 --default = 40
kSentryBuildTime = 4 --default 3
kPlayerHallucinationNumFraction = 0.38 --default 0.34

kShotgunFireRate = 0.75 --default 0.88
--kXenocideDamage = 220
--kXenocideDamageType = kDamageType.Structural


kDualRailgunExosuitCost = 35 --default 45
kDualExosuitCost = 35 -- default 45


--kMarineRespawnTime = 8 --default 9

kFlameThrowerEnergyDamage = 1 
kBlinkEnergyCost = 27 -- default 32
kStartBlinkEnergyCost = 13 --default 14
kBoneShieldArmorPerSecond = 95 --default 112
kMucousShieldPercent = 0.20 --default 0.15


kEggGenerationRate = 9 --default 13
kAlienEggsPerHive = 4 --default 3
--kAlienSpawnTime = 9 --default 10
kHydrasPerHive = 4 --default 3




--kEnzymeCloudDuration = 4 --default 3

kGorgeGestateTime = 5 -- default 7
kLerkGestateTime = 8 -- default 15
kFadeGestateTime = 8 -- default 25
kOnosGestateTime = 8-- default 30


kShotgunClipSize = 8 --default 6

kBioMassOneTime = 20 --default 25
kBioMassTwoTime = 35 --default 40

kHiveMaturationTime = 32 -- default 220
kHarvesterMaturationTime = 16 --default 150
kWhipMaturationTime = 8 -- default 120
kCragMaturationTime = 4 -- default 120
kShiftMaturationTime = 8 -- default 90
kShadeMaturationTime = 4 -- default 120
kCystMaturationTime = 4 --default 45balancehea
kHydraMaturationTime = 8 -- default 140
kEggMaturationTime = 8 -- default 100


kCystBuildTime = 4 --default 5


kChargeResearchTime = 35 --default 40
kLeapResearchTime = 35 --default 40
kBileBombResearchTime = 35 --default 40
kUmbraResearchTime = 38 --default 45
kBoneShieldResearchTime = 35 --default 40
kSporesResearchTime = 28 --default 60
kStompResearchTime = 45 --default 60


kMetabolizeEnergyResearchTime = 35 --default 40
kMetabolizeHealthResearchTime = 35 --default 45
kXenocideResearchTime = 35 --default 60

