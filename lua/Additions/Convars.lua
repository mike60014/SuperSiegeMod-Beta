--Global Variables for everything

--Unused Start
gWeaponUseTimeLimit = 0.5 --weapon_server.lua

kStartHealthScalar = 1 --0.3


--Unused End


--Credits Start

gCreditLowerSupplyLimit = 1000
gCreditStructuredefHUDSlot = 5
gCreditStructurePlacementDistance = 4

--Credits Structures Marine
gCreditStructureObservatoryCost = 100
gCreditStructureArmoryCost = 120
gCreditStructureSentryCost = 80
gCreditStructureSentryLimit = 2
gCreditStructureBackUpBatteryCost = 60
gCreditStructureBackUpBatteryLimit = 1

gCreditStructureBackupLightCost = 60
gCreditStructureBackupLightLimit = 2
gCreditStructureBackupLightBuildTime = 6
gCreditStructureBackupLightMaxHealth = 1000
gCreditStructureBackupLightMaxArmor = 100
gCreditStructureBackupLightPointValue = 2
gCreditStructureBackupLightObstacleRadius = 0.25

gCreditStructurePhaseGateCost = 150
gCreditStructurePhaseGateLimit = 2
gCreditStructureInfantryPortalCost = 150
gCreditStructureInfantryPortalLimit = 50
gCreditStructureRoboticsFactoryCost = 100
gCreditStructureRoboticsFactoryLimit = 50
gCreditStructureMacCost = 4
gCreditStructureMacLimit = 2
gCreditStructureArcCost = 200
gCreditStructureArcLimit = 1
gCreditStructureExtractorCost = 5000
gCreditStructureExtractorLimit = 1



--Classes Credits Cost
gCreditClassCostJetPack = 80
gCreditClassCostRailGun = 290
gCreditClassCostMiniGun = 300
gCreditClassCostWelder = 250
gCreditClassCostFlamer = 270

gCreditClassCostGorge = 90
gCreditClassCostLerk = 120
gCreditClassCostFade = 200
gCreditClassCostOnos = 250


--Weapons Credits Cost
gCreditWeaponCostMines = 15
gCreditWeaponCostWelder = 10
gCreditWeaponCostHMG = 50
gCreditWeaponCostShotGun = 20
gCreditWeaponCostHeavyRifle = 20
gCreditWeaponCostFlameThrower = 30
gCreditWeaponCostGrenadeLauncher = 30
gCreditWeaponCostGrenadeGas = 1
gCreditWeaponCostGrenadeCluster = 1
gCreditWeaponCostGrenadePulse = 1
gCreditWeaponCostGrenadeOffensiveConc = 100
gCreditWeaponCostGrenadeJediConc = 500


--Alien Abilities  Credits Cost
gCreditAbilityCostInk = 500 --1.5
gCreditAbilityCostNutrientMist = 1
gCreditAbilityCostHallucination = 17
gCreditAbilityCostEnzymeCloud = 1.5
gCreditAbilityCostContamination = 10


--Alien Abilities  Credits Delay
gCreditAbilityDelayInk = 50 --1.5
gCreditAbilityDelayNutrientMist = 0
gCreditAbilityDelayHallucination = 10
gCreditAbilityDelayEnzymeCloud = 10
gCreditAbilityDelayContamination = 10


--Alien Structures Credits Cost
gCreditStructureCostHydra = 1
gCreditStructureCostSaltyEgg = 15
gCreditStructureLimitSaltyEgg = 0
gCreditStructureCostShade = 100
gCreditStructureCostCrag = 100
gCreditStructureCostWhip = 100
gCreditStructureCostShift = 100
gCreditStructureCostTunnelToHive = 10
gCreditStructureCostDrifter = 10
gCreditStructureCostClog = 10
gCreditStructureCost = 10
gCreditStructureCostHarvesterExtractor = 5000
gCreditStructureLimitHarvesterExtractor = 1
--gCreditStructureCost =

--Alien Structures Credits Delay After Purchasing
gCreditStructureDelayHydra = 1
gCreditStructureDelaySaltyEgg = 10
gCreditStructureDelayShade = 5
gCreditStructureDelayCrag = 5
gCreditStructureDelayWhip = 5
gCreditStructureDelayShift = 8
gCreditStructureDelayTunnelToHive = 10
gCreditStructureDelay = 5
gCreditStructureDelayHarvesterExtractor = 15
--gCreditStructureDelay =

--Credit Mariners Tech

gCreditAbilityCostBlank = 0

gCreditAbilityCostScan = 10
gCreditAbilityDelayScan = 10

gCreditAbilityCostMedpack = 10
gCreditAbilityDelayMedpack = 5




--General Player Credit Settings 
gCreditPlayerCapPerRound = 3000
gCreditPlayerMultiplier = 1
gCreditPlayerSaveJSONFileInterval = 10
gCreditPlayerHTTPReqInterval = 20
gCreditPlayerNotePlayersInterval = 60
gCreditPlayerEndRndDisplayTime = 5

--Credit Team 1
gCreditPlayerTeamOneBuyDelay = 10
gCreditPlayerTeamOneCreditCost = 1
gCreditPlayerTeamOneLimit = 3

gCreditPlayerEnergyCost = 0

--Credit Team 2
gCreditPlayerTeamTwoBuyDelay = 10
gCreditPlayerTeamTwoCreditCost = 2
gCreditPlayerTeamTwoLimit = 3
--KPlayerCreditTeamOne

gCreditCommReward = 10

kCreditCommReward = gCreditCommReward



--Credits End



--Game Settings

kNeutralTeamType = 0
kMarineTeamType = 1
kAlienTeamType = 2
kRandomTeamType = 3

--Vote Stalemate
kMinTimeBeforeStalemate = 1 -- 45 * 60 -- 45min
kPercentAllPlayersNeededForStalemate = 0.90 --0.75

--Vote Reset
kMaxTimeBeforeReset = 360 --


-- Vote concede sequence constants
kConcedeTimeBeforeMontage = 1.0
kConcedeMontageDuration = 5.0
kConcedeTimeAfterMontage = 4.0

kConcedeNumAnglesToCheck = 64 -- adjust for performance
kConcedeIdealDistance = {6.5, 6.5, 4.5} -- xz distance
kConcedeIdealHeightOffset = {2.5, 2.0, 1.5} -- y distance
kConcedeIdealCameraSpeed = 1.0
kConcedeRelevancyDistance = 20 -- reduce relevancy distance for these sequences

kMinTimeBeforeConcede = 600 -- 7 * 60
kPercentNeededForVoteConcede = 0.75 --0.75


--Entities Settings
gMaxEntitiesInRadius = 300 --99
gMaxEntityRadius = 100 --99
kMaxEntitiesInRadius = gMaxEntitiesInRadius
kMaxEntityRadius = kMaxEntityRadius

--Doors Settings
kDoorMoveUpVect = 40
kPrimaryTimer = 0
kSideTimer = 0 -- b/c maps still use this

--Unknown Settings
kHealingClampInterval = 2
kHealingClampMaxHPAmount = 0.2
kHealingClampReductionScalar = 0.2

--Team/Game Initial s

kPlayingTeamInitialTeamRes = 100 --60
kMarineInitialIndivRes = 15
kAlienInitialIndivRes = 12
kCommanderInitialIndivRes = 25 --0


--Resources
kResourceTowerResourceInterval = 6
kPlayerResPerInterval = 0.125 -- was 1.25, but players now also get res while dead
kTeamResourcePerTick = 1

kMaxTeamResources = 200
kMaxPersonalResources = 100

kKillTeamReward = 0
kPersonalResPerKill = 2 --0



--Alien Settings

kAlienSpawnTime = 9 --default 10

kEggGenerationRate = 9 --default 13
kAlienEggsPerHive = 4 --default 3


kAbilityMaxEnergy = 120 --100

--Supply
kWhipSupply = 5
kCragSupply = 5
kShadeSupply = 5
kShiftSupply = 5
kDrifterSupply = 5 --default 10

--infestation
kInfestationCorrodeDamagePerSecond = 30 --30
kInfestationCommandCenterCorrodeDamagePerSecond = 120 -- gInfestationCorrodeDamagePerSecond * 4

kAlienDefaultAddXp = 0.5 --0.5
kAlienDefaultLvl = 25 --25


--Adrenailine
kAdrenalineAbilityMaxEnergy = 180 --130
kAlienEnergyRecuperationRate = 10 --10
kAlienWalkBackwardSpeedScalar = 1 --1
kAlienEnergyAdrenalineRecuperationRate = 15 --15
kEnergyAdrenalineRecuperationRate = kAlienEnergyAdrenalineRecuperationRate
kEnergyRecuperationRate = kAlienEnergyRecuperationRate
kOnFireEnergyRecuperationScalar = 0.75


--Regeneration
kAlienRegenerationPercentage = 0.06
kAlienMinRegeneration = 6
kAlienMaxRegeneration = 80



kMarineInfestationSpeedScalar = .1
kOnFireEnergyRecuperationScalar = 1
kElectrifiedEnergyRecuperationScalar = 0.7
kInfestationRadius = 10 --7.5
kGorgeInfestationLifetime = 60
kHallucinationHealthFraction = 0.25 --default 0.20
kHallucinationArmorFraction = 0.10 -- default 0
kHallucinationMaxHealth = 725 -- default 700
kPlayerHallucinationNumFraction = 0.38 --default 0.34
--kEggsPerHatch = 4 -- default 2


--Web
kMinWebLength = 0.5
kMaxWebLength = 8

kAlienBiomassAddHealthMultipler = gAlienBiomassAddHealthMultipler
kSwipeDamageType = kDamageType.Normal

--Alien Field of View
kDefaultFov = 90
kEmbryoFov = 100
kSkulkFov = 105
kGorgeFov = 95
kLerkFov = 100
kFadeFov = 90
kOnosFov = 90

--Alien Heal Rates
kAlienRegenerationTime = 2
kAlienRegenerationCombatModifier = 0.75 --1

kAlienInnateRegenerationPercentage  = 0.02
kAlienMinInnateRegeneration = 5 --1
kAlienMaxInnateRegeneration = 35 --20

kAlienHealRateTimeLimit = 1
kAlienHealRateLimit = 1000
kAlienHealRatePercentLimit = 10 --1
kAlienHealRateOverLimitReduction = 1
kOnFireHealingScalar = 0.5


--Alien Traits / Player Bonuses

--Thickened Skin
gAlienBiomassAddHealthMultipler = 0.0333334

--Bonus 2

--Bonus 3


--Vampirism
kAlienVampirismHealingScalarPerLevel = 0.3334
kAlienVampirismNotHealArmor = true
--Base Leech amounts = classbelow * (veillevel * kAlienVampirismHealingScalarPerLevel)

kLifeformVampirismScalars = {} --FIXME change to Weapon/Doer classnames, not lifeform
kLifeformVampirismScalars["Skulk"] = 14
kLifeformVampirismScalars["Gorge"] = 15
kLifeformVampirismScalars["LerkBite"] = 10
kLifeformVampirismScalars["LerkSpikes"] = 2
kLifeformVampirismScalars["Fade"] = 20
kLifeformVampirismScalars["Onos"] = 40  --Stomp?



--Crush

kAlienCrushDamagePercentByLevel = 0.15 --0.07  --Max 21%


--Focus
kAlienFocusUpgradeAttackDelay = 1 --FIXME Does not account for variable attack-rates
kAlienFocusDamageBonusAtMax = 0.5


-- Carapace

gCarapaceArmorPerLevelPercent = 0.11

kCarapaceSpeedReduction = 0.15 --0.0
kGorgeCarapaceSpeedReduction = 0.08
kLerkCarapaceSpeedReduction = 0.15
kFadeCarapaceSpeedReduction = 0.15



--Alien Research


kUpgradeSkulkResearchCost = 10 --20
kUpgradeSkulkResearchTime = 10 --90
kUpgradeGorgeResearchCost = 10 --30
kUpgradeGorgeResearchTime = 10 --90
kUpgradeLerkResearchCost = 10 --35
kUpgradeLerkResearchTime = 10 --90
kUpgradeFadeResearchCost = 10 --35
kUpgradeFadeResearchTime = 10 --120
kUpgradeOnosResearchCost = 10 --35
kUpgradeOnosResearchTime = 10 --120


kGorgeTunnelResearchCost = 10 --15
kGorgeTunnelResearchTime = 10 --40
kChargeResearchCost = 10 --15
kChargeResearchTime = 10 --40
kLeapResearchCost = 10 --15
kLeapResearchTime = 10 --40
kBileBombResearchCost = 10 --15
kBileBombResearchTime = 10 --40
kShadowStepResearchCost = 10 --15
kShadowStepResearchTime = 10 --40
kUmbraResearchCost = 10 --20
kUmbraResearchTime = 10 --45
kBoneShieldResearchCost = 10 --20
kBoneShieldResearchTime = 10 --40
kSporesResearchCost = 10 --20
kSporesResearchTime = 10 --60
kStompResearchCost = 10 --25
kStompResearchTime = 10 --60
kStabResearchCost = 10 --25
kStabResearchTime = 10 --60
kMetabolizeEnergyResearchCost = 10 --20
kMetabolizeEnergyResearchTime = 10 --40
kMetabolizeHealthResearchCost = 10 --20
kMetabolizeHealthResearchTime = 10 --45
kXenocideResearchCost = 10 --25
kXenocideResearchTime = 10 --60
kVortexResearchCost = 10 --15
kVortexResearchTime = 10 --60
kWebResearchCost = 10 --10
kWebResearchTime = 10 --60


--Alien Upgrades



--Umbra
kUmbraEnergyCost = 23
kUmbraShotgunModifier = 0.70
kUmbraBulletModifier = 0.70
kUmbraMinigunModifier = 0.70
kUmbraRailgunModifier = 0.70
kUmbraGrenadeModifer = 0.70

kVortexLifeSpan = 8
kRedemptionCost = 2
kRebirthCost = 2
kRedemptionCooldown = 45
kRedemptionCooldown = 45
kRedemptionEHPThresholdMin = 15
kRedemptionEHPThresholdMax = 30
kStartBlinkEnergyCost = 13 --default 14
kBoneShieldArmorPerSecond = 65 --default 112
kMucousShieldPercent = 0.20 --default 0.15
kHydrasPerHive = 4 --default 3

kMatureEggHealth = 400
kMatureEggArmor = 250
kEggHealth = 300
kEggArmor = 150
kEggPointValue = 2

kGorgeEggCost = 8
kLerkEggCost = 16
kFadeEggCost = 32
kOnosEggCost = 64 --default 100
kCommEggOnosCost = kOnosEggCost


kChargeResearchTime = 5 --35 --default 40
kLeapResearchTime = 5 --35 --default 40
kBileBombResearchTime = 5 --35 --default 40
kUmbraResearchTime = 5 --38 --default 45
kBoneShieldResearchTime = 5 --35 --default 40
kSporesResearchTime = 5 --28 --default 60
kStompResearchTime = 5 --45 --default 60

kMetabolizeEnergyResearchTime = 5 --35 --default 40
kMetabolizeHealthResearchTime = 5 --35 --default 45



--Alien Vortex
gCommVortexCoolDown = 20
gCommVortexCost = 8

--Drifter
gDrifterMaxBuildingOne = 5

kDrifterHealth = 300
kDrifterArmor = 20
kDrifterPointValue = 5

--Alien Buildings


kResearchBioMassOneCost = 10 --default 15
kResearchBioMassTwoCost = 10 --default 20
kBioMassOneTime = 5 --default 25
kBioMassTwoTime = 5 --default 40
kHiveMaturationTime = 32 -- default 220
kHarvesterMaturationTime = 12 --default 150
kWhipMaturationTime = 8 -- default 120
kCragMaturationTime = 4 -- default 120
kShiftMaturationTime = 8 -- default 90
kShadeMaturationTime = 20 -- default 120
kCystMaturationTime = 8 --default 45balancehea
kHydraMaturationTime = 8 -- default 140
kEggMaturationTime = 8 -- default 100
kCystBuildTime = 3 --default 5

kLimitCragsinHiveRoom = 7 --5

gAlienStructureMoveSpeed = 3 --1.5

kAlienStructureMoveSpeed = gAlienStructureMoveSpeed

--kEnzymeCloudDuration = 4 --default 3



--Cyst
kHiveInfestationRadius = 8 --default 20 --Dropped to 8 to prevent it from going through walls on certain maps. doesnt seem to adhere to LOS for infestation

kCystHealth = 150 --default 30
kCystArmor = 75 --default 0
kMatureCystHealth = 450 --default 450
kMatureCystArmor = 150 --default 0
kCystPointValue = 3 --default 1
kMinMatureCystHealth = 200 --default 200
kMinCystScalingDistance = 48 --default 48
kMaxCystScalingDistance = 168 --default 168

kStructureInfestationRadius = 3 --default 2
kMinMatureCystHealth = 200 --default 200
kMatureCystArmor = 150 --30 --default 0
kMatureCystHealth = 250 --500 --default 450
kCystSpawnBlockDuration = 1 --7
kCystBurstDuration = 3
kCystCooldown = 0
kCystCost = 0.33
kCystInfestationRateMultiplier = 6 --3
kHiveCystParentRange = 16 --24 -- distance from a hive a cyst can be connected
kCystMaxParentRange = 14 --24 -- distance from a cyst another cyst can be placed
kCystRedeployRange = 10 --7 -- distance from existing Cysts that will cause redeployment


--Clog
kClogsPerHive = 6 --10

--Hive
kHiveCost = 20 --40
kHiveHealth = 4000
kHiveArmor = 750
kHivePointValue = 30
kBioMassUpgradePointValue = 10
kUgradedHivePointValue = 5
kMatureHiveHealth = 6000
kMatureHiveArmor = 1400

--Craig


kCragHealth = 600
kCragArmor = 200
kCragPointValue = 10
kMatureCragHealth = 700
kMatureCragArmor = 340
kMatureCragPointValue = 10

gCragUmbraCooldown = 10
gCragUmbraCost = 5
gCragUmbraRadius = 8 --12

gCragHealRadius = 10 --14
kCragHealBonusRatio = 0.10 --+10% per crag --   = (self:GetCragsInRange() / gCragHealBonusDivider)
gCragStructureMoveSpeed = 3 --1.5

kCragHealMaxBonusCragsInRange = 7
gCragHealWaveDuration = 8
gCragHealMaxTargets = 5 --3
gCragHealInterval = 2
gCragHealEffectInterval = 1
gCragHealAmount = 10
gCragHealWaveAmount = 50
gCragHealMinHealAmount = 10
gCragHealMaxHealAmount = 60
gCragHealHealAmountMutliplier = 1.3
gCragHealPercent = 0.06 -- of targets hp / armor
gCragHealIgnoreLOS = true
--gCragHeal

kCragCost = 13
kCragBuildTime = 25
kCragInitialEnergy = 25
kCragMaxEnergy = 100 
kCragHealWaveCost = 3
kHealWaveCooldown = 6
kMatureCragMaxEnergy = 150

--Beacon Structure
gAlienStructureBeaconArmor = 175
gAlienStructureBeaconBuildTime = 8
gAlienStructureBeaconCost = 10
gAlienStructureBeaconCoolDown = 12
gAlienStructureBeaconHealth = 675
gAlienStructureBeaconVisualRange = 8


--Gorge / Comm Tunnel Settings


gTunnelEntranceArmor = 15
gTunnelEntranceHealth = 15
gTunnelEntrancePointValue = 15
gTunnelEntranceMaturationTime = 4 -- 135
gTunnelArmorDamagePerSecond = 10


kGorgeArmorTunnelDamagePerSecond = gTunnelArmorDamagePerSecond
kTunnelEntranceArmor = gTunnelEntranceArmor
kTunnelEntranceHealth = gTunnelEntranceHealth
kTunnelEntrancePointValue = gTunnelEntrancePointValue
kTunnelEntranceMaturationTime = gTunnelEntranceMaturationTime

--Tunnel End

--Whip

kWhipBuildTime = 20
kWhipCost = 13
kEvolveBombardCost = 5
kEvolveBombardResearchTime = 15

kWhipSlapDamage = 50
kWhipBombardDamage = 250
kWhipBombardDamageType = kDamageType.Corrode
kWhipBombardRadius = 6
kWhipBombardRange = 10
kWhipBombardROF = 6







--Alien Unit Settings
--Skulk Settings
gSkulkHealth = 80
gSkulkArmor = 10
gSkulkPointValue = 5
kSkulkHealthPerBioMass = gAlienBiomassAddHealthMultipler
kSkulkArmorFullyUpgradedAmount = 46 --15?

kSkulkCarapaceSpeedReduction = 0.08
gSkulkMaxMovementSpeed = 7.25
gSkulkLeapForce = 9 --7.6
gSkulkLeapVerticalForce = 10.8
gSkulkLeapTime = 0.4 --0.2
gSkulkMass = 45 --  45=~100 pounds
gSkulkSneakSpeedModifier = 0.75 --0.66
gSkulkOnFireSpeedModifier = 1.20 --0.66
gSkulkViewOffsetHeight = 0.55
gSkulkNormalWallWalkFeelerSize = 0.25
gSkulkNormalWallWalkRange = 0.3
gSkulkJumpWallRange = 1 --0.4
gSkulkJumpWallFeelerSize = 0.1
gSkulkXExtents = .45
gSkulkYExtents = .45
gSkulkZExtents = .45
gSkulkMaxSneakOffset = 0 --0.55
gSkulkWallJumpInterval = 0.1 --0.4
gSkulkWallJumpForce = 5.6 --6.4 -- scales down the faster you are
gSkulkMinWallJumpForce = 0.1
gSkulkVerticalWallJumpForce = 6 --4.3
gSkulkWallJumpMaxSpeed = 16 --11
gSkulkWallJumpMaxSpeedCelerityBonus = 1.8 --1.2
gSkulkCrouchSpeedScalar = 0

gSkulkAcceleration = 13
gSkulkAirControl = 27
gSkulkAirAcceleration =  9
gSkulkGroundTransistionTime = 0.1
--gSkulkAirFriction = 0.055 --- (GetHasCelerityUpgrade(self) and GetSpurLevel(self:GetTeamNumber()) or 0) * 0.009
gSkulkGroundFriction = 11
gSkulkIsSmallTarget = true



kSkulkUpgradeCost = 0
kXenocideResearchTime = 5 --35 --default 60

kSkulkHealth = gSkulkHealth
kSkulkArmor = gSkulkArmor
kSkulkPointValue = gSkulkPointValue

--Skulk Abilities


kBiteDamage = 75
kBiteDamageType = kDamageType.Normal
kBiteEnergyCost = 5.85

kLeapEnergyCost = 45

kParasiteDamage = 10
kParasiteDamageType = kDamageType.Normal
kParasiteEnergyCost = 30

kXenocideDamage = 160 --Start at 2x skulk HP
gSkulkXenocidePlayerDamage = kXenocideDamage / 2
gSkulkXenocideStructureDamage = kXenocideDamage
kXenocideDamageType = kDamageType.Normal
kXenocidekRange = 1.4 --Unused local var
kXenocideRange = 7 --14
kXenocideEnergyCost = 30
kXenocideDentonateTime = 2.0
kXenocideHUDSlot = 3

gSkulkXenocideLeapGetHUDSlot = 3
gSkulkXenocideDetonateTime = 2.0
--gSkulkXenocideRadiusRange = 1.4
gSkulkXenocideDistanceFraction = 1 --unused/
--gXenocideDamageType = kDamageType.Structural

 


--Skulk End
--Babbler Settings
gBabblerHealth = 10 --default 10
gBabblerMass = 15
gBabblerRadius = 0.25
gBabblerLinearDamping = 0
gBabblerRestitution = 0.65
gBabblerFov = 240 --360

gBabblerTargetSearchRange = 12
gBabblerAttackRate = 0.37
gBabblerLifeTime = 60

gBabblerUpdateMoveInterval = 0.5
gBabblerUpdateAttackInterval = 1
gBabblerMinJumpDistance = 6
gBabblerRunSpeed = 7.5    --7
gBabblerVerticalJumpForce = 6
gBabblerMaxJumpForce = 8 --15
gBabblerMinJumpForce = 5
gBabblerTurnSpeed = math.pi
gBabblerClingDuration = -1

kBabblerPheromoneEnergyCost = 7
kBabblerDamage = 3 --8
kBabblerDamageType = kDamageType.Structural

kBabblerHealth = gBabblerHealth

kBabblerCost = 1
kBabblerEggBuildTime = 6
kNumBabblerEggsPerGorge = 3 --1
kNumBabblersPerEgg = 6

--Babbler End
--Gorge Settings


kMinBuildTimePerHealSpray = 0.9
kMaxBuildTimePerHealSpray = 1.8
kGorgeCost = 8 --10
kGorgeUpgradeCost = 0
gGorgeHealth = 160
gGorgeArmor = 75
gGorgePointValue = 7
gGorgeHealthPerBioMass = gAlienBiomassAddHealthMultipler
kGorgeArmorFullyUpgradedAmount = 150
gGorgeGestateTime = 7 -- default 7

kNumWebsPerGorge = 6
kGorgeGestateTime = gGorgeGestateTime

kGorgeHealth = gGorgeHealth
kGorgeArmor = gGorgeArmor
kGorgePointValue = gGorgePointValue
kGorgeHealthPerBioMass = gGorgeHealthPerBioMass

--Gorge Abilities


kSpitDamage = 30
kSpitDamageType = kDamageType.Light
kSpitEnergyCost = 7


kHealsprayDamage = 8
kHealsprayDamageType = kDamageType.Biological
kHealsprayFireDelay = 0.8
kHealsprayEnergyCost = 12
kHealsprayRadius = 3.5

kBileBombDamage = 55 -- per second
kBileBombDamageType = kDamageType.Corrode
kBileBombEnergyCost = 20
kBileBombDuration = 5
-- 200 inches in NS1 = 5 meters
kBileBombSplashRadius = 6
kBileBombDotInterval = 0.4
kBombVelocity = 11


kWebBuildCost = 0
kWebbedDuration = 1.5
kWebbedParasiteDuration = 10
kWebSlowVelocityScalar = 0.75 --Note: Exos override this


--Gorge End
--Lerk Settings


kLerkBiteDamage = 60
kBitePoisonDamage = 6 -- per second
kPoisonBiteDuration = 6
kLerkBiteEnergyCost = 5
kLerkBiteDamageType = kDamageType.Normal

kLerkCost = 16 --20
kLerkUpgradeCost = 0 --1 --def 3
kLerkHealth = 150
kLerkArmor = 45
kLerkPointValue = 15
kLerkHealthPerBioMass = gAlienBiomassAddHealthMultipler
kLerkArmorFullyUpgradedAmount = 115
kLerkGestateTime = 6 -- default 15
kLerkFlapEnergyCost = 3 --2 --1
kLerkModelSizeScaler = 0.75
kLerkRebirthLength = 4
kLerkRedemptionCooldown = 15

--Lerk Abilities

--gLerkBileBombResearchCost = 10
--gLerkBileBombResearchTime = 10

kUmbraEnergyCost = 27
kUmbraMaxRange = 17
kUmbraDuration = 4
kUmbraRadius = 4


kUmbraShotgunModifier = 0.75
kUmbraBulletModifier = 0.75
kUmbraMinigunModifier = 0.75
kUmbraRailgunModifier = 0.75

kSpikeMaxDamage = 7
kSpikeMinDamage = 2 --7
kSpikeDamageType = kDamageType.Puncture
kSpikeEnergyCost = 1.4
kSpikesAttackDelay = 0.07
kSpikeMinDamageRange = 10 --9
kSpikeMaxDamageRange = 3 --2
kSpikesRange = 50
kSpikesPerShot = 1

kSporesDamageType = kDamageType.Gas
kSporesDustDamagePerSecond = 6 --15
kSporesDustFireDelay = 0.36
kSporesMaxRange = 12 --17
kLerkSporeShootRange = 10
kSporesDustEnergyCost = 27
kSporesDustCloudRadius = 4
kSporesDustCloudLifetime = 4

kPrimalScreamPlayerPointBonus = 0.3
kPrimalScreamROFIncrease = .3
kPrimalScreamEnergyCost = 25
kPrimalScreamRange = 10
kPrimalScreamDamageModifier = 1.3
kPrimalScreamDuration = 4
kPrimalScreamEnergyGain = 60
kPrimalScreamROF = 3

--Lerk End

--Fade Settings


kFadeCost = 32 --40
kFadeUpgradeCost = 1 --1 --def 5
kFadeGestateTime = 9 -- default 25
kFadeHealth = 250
kFadeArmor = 80 --100
kFadeArmorFullyUpgradedAmount = 195 --220
kFadePointValue = 20
kFadeHealthPerBioMass = gAlienBiomassAddHealthMultipler
kFadeHealthPercentPerBioMass = gAlienBiomassAddHealthMultipler

kFadePrimaryAttackSpeedMultipler = 1 --Increase to slow attack
kFadePrimaryAttackSpeedOnFireMultipler = 1.25 --Increase to slow attack while onfire

kFadeRedemptionCooldown = 20
kFadeRebirthLength = 4
kFadeXZExtents = 0.4
kFadeYExtents = 1.05


kFadeMass = 158
kFadeJumpHeight = 1.4
kFadeScanDuration = 4
kFadeShadowStepCooldown = 0.73
kFadeShadowStepForce = 4
kFadeShadowStepSpeed = 30
kFadeShadowStepCost = 11
kFadeMaxSpeed = 6.2
kFadeBlinkSpeed = 14
kFadeBlinkAcceleration = 40
kFadeBlinkAddAcceleration = 1
kFadeMetabolizeAnimationDelay = 0.65
kFadeMinEnterEtherealTime = 0.4
kFadeGravityMod = 1.0

kFadeAccerlation = 11
kFadeGroundFriction = 9
kFadeAirControl = 40

kFadeCarapaceSpeedReduction = 0 --0.15

/*
kFadeShadowStepCost = gFadeShadowStepCost
kFadeCarapaceSpeedReduction = gFadeCarapaceSpeedReduction
kFadeArmor = gFadeArmor
kFadeArmorFullyUpgradedAmount = gFadeArmorFullyUpgradedAmount
kFadeGestateTime = gFadeGestateTime
kFadePointValue = gFadePointValue

kMass = gFadeMass
kJumpHeight = gFadeJumpHeight
kFadeScanDuration = gFadeScanDuration
kShadowStepCooldown = gFadeShadowStepCooldown
kShadowStepForce = gFadeShadowStepForce
kShadowStepSpeed = gFadeShadowStepSpeed
kMaxSpeed = gFadeMaxSpeed
kBlinkSpeed = gFadeBlinkSpeed
kBlinkAcceleration = gFadeBlinkAcceleration
kBlinkAddAcceleration = gFadeBlinkAddAcceleration
kMetabolizeAnimationDelay = gFadeMetabolizeAnimationDelay
kMinEnterEtherealTime = gFadeMinEnterEtherealTime
kFadeGravityMod = gFadeJumpHeight
kFadeHealth = gFadeHealth
*/

--Fade abilities
kStabResearchTime = 20 --default 60
kStabResearchCost = 20 --default 60

--Rocket
kRocketRadius = 0.15
kRocketLifeTime = 5 --0.5

kAcidRocketDamage = 20 --25
kAcidRocketDamageType = kDamageType.Corrode --kDamageType.Structural
kAcidRocketEnergyCost = 15 --10
kAcidRocketFireDelay = 0.5
kAcidRocketRadius = 4 --6
kAcidRocketLifeTime = 0.5
kAcidRocketResearchTime = 20
kAcidRocketResearchCost = 20
kAcidRocketVelocity = 45
kAcidRocketPlayerVelocityFraction = 0.5
kAcidRocketHUDSlot = 4
kAcidRocketignoreLOS = false

kSwipeDamageType = kDamageType.StructuresOnlyLight
kSwipeDamage = 75
kSwipeEnergyCost = 7
kMetabolizeEnergyCost = 25

kStabDamage = 200 --160
kStabDamageType = kDamageType.Normal
kStabEnergyCost = 45 --30

kVortexEnergyCost = 20
kVortexDuration = 3



kSwipeDamageType = kDamageType.StructuresOnlyLight
kSwipeDamage = 75
kSwipeEnergyCost = 7
kMetabolizeEnergyCost = 25

--Fade End


--Onos Settings

-- Light shaking constants
kOnosLightDistance = 25 --default 50
kOnosLightShakeDuration = 0.05 --default 0.2
kLightShakeMaxYDiff = 0.025 --default 0.05
kLightShakeBaseSpeed = 30
kLightShakeVariableSpeed = 30

kOnosHealth = 900
kOnosArmor = 450
kOnosPointValue = 30
kOnosHealtPerBioMass = gAlienBiomassAddHealthMultipler
kOnosHealthPerBioMass = gAlienBiomassAddHealthMultipler
kOnosArmorFullyUpgradedAmount = 865 --650
kGoreMarineFallTime = 1
kDisruptTime = 2
kOnosRebirthLength = 6 --5
kOnosRedemptionCooldown = 25


--Onos Movespeed
kOnosMaxSpeed = 7.5 -- 9.325 from somewhere?
kOnosChargeSpeed = 11.5
kOnosCelerityMoveSpeed = 9.375
kOnosCarapaceMoveSpeed = 0.88 --0
kOnosMaxChargeSpeed = 12 --11.5
kOnosOnFireMoveSpeedFraction = 0.9
kOnosElectrifiedMoveSpeedFraction = 0.75
kOnocideMoveSpeedFraction = 0.65 --1
kBoneShieldMoveSpeedFraction = 0.1 --0

kOnosJumpForce = 20
kOnosJumpVerticalVelocity = 8
kOnosJumpRepeatTime = 0.25
kOnosViewOffsetHeight = 2.5
kOnosXExtents = 0.7
kOnosYExtents = 1.2
kOnosZExtents = 0.4
kOnosYHeadExtents = 0.7
kOnosYHeadExtentsLowered = 0.0
kOnosMass = 453 -- 453 = Half a ton
kOnosJumpHeight = 1.15
-- triggered when the momentum value has changed by this amount (negative because we trigger the effect when the onos stops, not accelerates)
kOnosMomentumEffectTriggerDiff = 3
kOnosGroundFrictionForce = 3

kOnosChargeEnergyCost = 30 -- per second
kOnosChargeUpDuration = 0.5
kOnosChargeDelay = 1.0
kOnosChargingSensScalar = 0.20 --0

kOnosStoopingCheckInterval = 0.3
kOnosStoopingAnimationSpeed = 2



kOnosGestateTime = 10 -- default 30
kOnosCost = 64 --default 65
kOnosUpgradeCost = 0 --1 --default 8



--Onos abilities
gOnocideDetonateTime = 2.0
kOnocideDetonateTime = 2.0
kOnocideDetonateRange = 10
kOnocideInitialEnergyCost = 20
kOnocideHUDSlot = 4
gOnocideDamage = kOnosHealth --Clamp(player:GetHealthScalar(), gOnocideDamageHealthMinRatio, gOnocideDamageHealthMaxRatio)
gOnocideDamageType = kDamageType.Structural --Clamp(player:GetHealthScalar(), gOnocideDamageHealthMinRatio, gOnocideDamageHealthMaxRatio)
kOnocideDamageHealthMinRatio = 0.00--0.3
kOnocideDamageHealthMaxRatio = 0.40 --1 
kOnocideMinimumFuel = 0.9
kOnocideCooldown = 12.5
gOnocideDamageReduction = 1.2
kOnocideMaxDuration = kOnocideDetonateTime

--gOnosStompBoneWallDuration = 2 --4
kOnosStunWallLifeSpan = 2 --4
kOnosStunWallHealth = 200 --450
kOnosChargeEnergyCost = 30
kChargeEnergyCost = kOnosChargeEnergyCost

kOnosChargeDamageReduction = 0.7

kGoreDamage = 100 --90
kGoreDamageType = kDamageType.Structural
kGoreEnergyCost = 10
kGoreAimInterruptForMarineDuration = 0 --0.7
kGoreAttackRange = 1.7
kGoreFloorAttackRange = 0.9

gBoneShieldDamageReduction = 0.5
gBoneShieldCooldown = 12.5
gBoneShieldInitialEnergyCost = 20
gBoneShieldSustainCost = 0 -- not yet implemented
gBoneShieldHealPerSecond = 0
gBoneShieldArmorPerSecond = 85 --112.25
gBoneShieldMaxDuration = 4
gBoneShieldMinimumFuel = 0.9 -- otherwise you can trigger it for a frame and it feels bad
gBoneShieldPreventEnergize = false
gBoneShieldPreventRecuperation = false

kStompEnergyCost = 30
kStompDamageType = kDamageType.Heavy
kStompDamage = 40
kStompRange = 12
kDisruptMarineTime = 2
kDisruptMarineTimeout = 4




kBoneShieldDamageReduction = gBoneShieldDamageReduction
kBoneShieldCooldown = gBoneShieldCooldown
kBoneShieldInitialEnergyCost = gBoneShieldInitialEnergyCost
kBoneShieldSustainCost = gBoneShieldSustainCost -- not yet implemented
kBoneShieldHealPerSecond = gBoneShieldHealPerSecond
kBoneShieldArmorPerSecond = gBoneShieldArmorPerSecond
kBoneShieldMaxDuration = gBoneShieldMaxDuration
kBoneShieldMoveFraction = gBoneShieldMoveFraction
kBoneShieldMinimumFuel = gBoneShieldMinimumFuel
kBoneShieldPreventEnergize = gBoneShieldPreventEnergize
kBoneShieldPreventRecuperation = gBoneShieldPreventRecuperation


--Onos End

--Gorge Settings

--Gorge Abilities
kGorgeRedemptionCooldown = 15
kGorgeRebirthLength = 3



--Gorge Aiblity End



--Gorge End


--////////////Marines Settings Start
--Marine Settings
kMarineRespawnTime = 9

/* Marine_Siege.lua
Marine.kMaxSprintFov = 95
-- Player phase delay - players can only teleport this often
Marine.kPlayerPhaseDelay = 2

Marine.kWalkMaxSpeed = 5                -- Four miles an hour = 6,437 meters/hour = 1.8 meters/second (increase for FPS tastes)
--Marine.kRunMaxSpeed = 6.0               -- 10 miles an hour = 16,093 meters/hour = 4.4 meters/second (increase for FPS tastes)
--Marine.kRunInfestationMaxSpeed = 5.2    -- 10 miles an hour = 16,093 meters/hour = 4.4 meters/second (increase for FPS tastes)
Marine.kRunMaxSpeed = 5.75
Marine.kRunInfestationMaxSpeed = 5

-- How fast does our armor get repaired by welders
Marine.kArmorWeldRate = kMarineArmorWeldRate
Marine.kWeldedEffectsInterval = .5

Marine.kSpitSlowDuration = 3

Marine.kWalkBackwardSpeedScalar = 0.4

-- start the get up animation after stun before giving back control
Marine.kGetUpAnimationLength = 0

-- tracked per techId
Marine.kMarineAlertTimeout = 4

Marine.kDropWeaponTimeLimit = 1
Marine.kFindWeaponRange = 2
Marine.kPickupWeaponTimeLimit = 1
Marine.kPickupPriority = { [kTechId.Flamethrower] = 1, [kTechId.GrenadeLauncher] = 2, [kTechId.HeavyMachineGun] = 3, [kTechId.Shotgun] = 4 }
	
Marine.kAcceleration = 100
Marine.kSprintAcceleration = 120 -- 70
Marine.kSprintInfestationAcceleration = 60

Marine.kGroundFrictionForce = 16

Marine.kAirStrafeWeight = 2
*/


gMarineDefAddXp = 0.5
gMarineDefLvl = 25

gMarineStunImmuneTime = 2
gMaxTimeToSprintAfterAttack = 0.08 --0.2

gMarineHealth = 100
gMarineArmor = 30 --30
gMarinePointValue = 5
gMarineWeaponHealth = 400


kMarineDefAddXp = gMarineDefAddXp
kMarineDefLvl = gMarineDefLvl
kMarineStunImmuneTime = gMarineStunImmuneTime
kMaxTimeToSprintAfterAttack = gMaxTimeToSprintAfterAttack
kMarineHealth = gMarineHealth
kMarineArmor = gMarineArmor
kMarinePointValue = gMarinePointValue
kMarineWeaponHealth = gMarineWeaponHealth

--Supply

kMACSupply = 5 --10
kArmorySupply = 5
kARCSupply = 15
kRoboticsFactorySupply = 5
kPrototypeLabSupply = 5
kInfantryPortalSupply = 0
kPhaseGateSupply = 0

--Weights
kPistolWeight = 0.0
kGrenadeLauncherWeight = 0.15
kFlamethrowerWeight = 0.14
kShotgunWeight = 0.14


kHandGrenadeWeight = 0.1
kLayMineWeight = 0.10

kClawWeight = 0.01
kMinigunWeight = 0.06
kRailgunWeight = 0.045


--Medpack
gMedpackHeal = 25
gMedpackPickupDelay = 0.45
gMarineRegenerationHeal = 25 --Amount of hp per second

kMedpackHeal = 25
kMedpackPickupDelay = 0.45
kMarineRegenerationHeal = 25 --Amount of hp per second


--kMarineRespawnTime = 8 --default 9


--Marine Weapons

--Grenades

kPulseGrenadeDamageRadius = 6
kPulseGrenadeEnergyDamageRadius = 10
kPulseGrenadeDamage = 110
kPulseGrenadeEnergyDamage = 0
kPulseGrenadeDamageType = kDamageType.Normal

kClusterGrenadeDamageRadius = 10
kClusterGrenadeDamage = 55
kClusterFragmentDamageRadius = 6
kClusterFragmentDamage = 20
kClusterGrenadeDamageType = kDamageType.Flame

kNerveGasDamagePerSecond = 50
kNerveGasDamageType = kDamageType.NerveGas

--OffensiveConcGrenade



--JediConcGrenade





-- Mines
kNumMines = 2
kMineActiveTime = 4
kMineAlertTime = 8
kMineDetonateRange = 5
kMineTriggerRange = 1.5
kLayMinesPointValue = 2
kMineResearchTime = 20
kMineDamage = 125
kMineDamageType = kDamageType.Light


--Rifle

kRifleClipSize = 50
kRifleWeight = 0.13
gRifleAddClipSize = 25
--if kRifleClipSize == nil then kRifleClipSize = 50 end
gRifleClipSize = kRifleClipSize + gRifleAddClipSize
gRifleMaxClips = 10
gRifleMaxAmmo = 750


--gRiflePrimary
gRiflePrimaryBulletSize = 0.018
gRiflePrimaryRange = 75 --100
gRiflePrimaryTracerEffectRate = 0.5 --0.5
gRiflePrimaryEffectRate = 0.04--0.08 0.0367
gRiflePrimaryFireRate = 0.04 --0.08
gRiflePrimaryBulletsPerShot = 1
gRiflePrimaryDamageType = kDamageType.Normal
gRiflePrimaryDamagePerShot = 10
gRiflePrimaryRangeWhileVortexed = 75

--gRifleRandomX = math.random(-100,100) * 0.01 --0.0 thru 3.0
--gRifleRandomY = math.random(-75,75) * 0.01 --0.0 thru 3.0
gRifleRandomSpread = math.random(30,40)
--gRiflePrimarySpreadDistance = Math.Radians(gRifleRandomSpread)
--gRiflePrimarySpreadDistanceX = Math.Radians(gRifleRandomX) --20
--gRiflePrimarySpreadDistanceY = Math.Radians(gRifleRandomY) --20

--Shoot more bullets at once
gRifleSecondaryBulletSize = 0.018
gRifleSecondaryRange = 65 --100
gRifleSecondaryBulletsPerShot = 5
gRifleSecondaryEffectRate = gRiflePrimaryFireRate * gRifleSecondaryBulletsPerShot --0.48 --Attack Speed 
gRifleSecondaryFireRate = gRiflePrimaryFireRate * gRifleSecondaryBulletsPerShot --0.48 --Attack Speed 
gRifleSecondaryDamageType = kDamageType.Puncture
gRifleSecondaryDamagePerShot = gRiflePrimaryDamagePerShot
--gRifleSecondaryRangeWhileVortexed = 200
--gRifleSecondaryPrecisionRatio = 0.75 --+25% spread distrance for the triple fire
--gRifleSecondarySpreadDistance = 0--Math.Radians(gRifleRandomSpread) * gRifleSecondaryPrecisionRatio
--gRifleSecondarySpreadDistanceX = Math.Radians(gRifleRandomX) * gRifleSecondaryPrecisionRatio
--gRifleSecondarySpreadDistanceY = Math.Radians(gRifleRandomY) * gRifleSecondaryPrecisionRatio
--gRifleSecondarySpreadDistance = gRiflePrimarySpreadDistance * gRifleSecondaryPrecisionRatio
--gRifleSecondarySpreadDistanceX = gRiflePrimarySpreadDistanceX * gRifleSecondaryPrecisionRatio
--gRifleSecondarySpreadDistanceY = gRiflePrimarySpreadDistanceY * gRifleSecondaryPrecisionRatio
--gRifleSecondary



kRifleDamageType = kDamageType.Normal


--Heavy Rifle


kHeavyRifleTechResearchTime = 20 --60
gHeavyRifleDamage = 10
gHeavyRifleDamageType = kDamageType.Puncture
gHeavyRifleCost = 30
gHeavyRifleBulletSize = 0.22
gHeavyRifleRange = 250
gHeavyRifleSpread = Math.Radians(4)
gHeavyRifleMinSpread = Math.Radians(0.2)
gHeavyRifleClipSize = 125 --75
gHeavyRifleRandom = math.max(0.2 + NetworkRandom())
gHeavyRifleWeight = 0.25
gHeavyRiflePrimaryEffectRate = 0.08
gHeavyRifleSecondaryEffectRate = 0.08


kHeavyRifleWeight = gHeavyRifleWeight
kHeavyRifleDamage = gHeavyRifleDamage
kHeavyRifleDamageType = kgHeavyRifleDamageType
kHeavyRifleCost = gHeavyRifleCost
kHeavyRifleBulletSize = gHeavyRifleBulletSize
kHeavyRifleRange = gHeavyRifleRange
kHeavyRifleSpread = gHeavyRifleSpread
kHeavyRifleMinSpread = gHeavyRifleMinSpread
kHeavyRifleClipSize = gHeavyRifleClipSize

--Heavy Rifle End
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-- Heavy MachineGun

gRifleToHMGReloadSpeed = 4 --rifleReloadTime / hmgReloadTime

kHeavyMachineGunTechResearchTime = 20 --30
kHeavyMachineGunWeight = 0.20 --0.26
kHeavyMachineGunCost = 25
kHeavyMachineGunDamage = 6
kHeavyMachineGunDamageType = kDamageType.Puncture
kHeavyMachineGunClipSize = 125
kHeavyMachineGunClipNum = 4
kHeavyMachineGunRange = 65 --100

kHeavyMachineGunSpread = Math.Radians(4)
kHeavyMachineGunSecondaryRange = 25 --1.1
kHeavyMachineGunSecondarySpread = Math.Radians(8)

kHeavyMachineGunValue = 15
kHeavyMachineGunDropCost = 25 --default = 40


--Axe
gAxePrimarySwingAmount = 40
gAxeDamage = 30 --25
gAxePrimaryDamage = 30 --25
gAxeDamageType = kDamageType.Structural

gAxeHUDSlot = 3 --6
gAxeRange = 1.5 --1.5 --1
gAxePrimaryRange = 1.5 --1.5 --1
gAxeFloorRange = 0.8
--gAxePrimaryAttackDelay =
gAxeSecondarySwingAmount = 15
gAxeSecondaryAttackDelay = 1.5
gAxeSecondaryDamage = 100
gAxeSecondaryRange = 2
gAxeSecondaryFloorRange = 2
--gAxe = 0
--gAxe = 0
--gAxe = 0


kAxeDamage = gAxeDamage
kAxeDamageType = gAxeDamageType

--GrenadeLauncher


kNadeLauncherClipSize = 4


kGrenadeLauncherTechResearchTime = 20
kGrenadeLauncherPointValue = gGrenadeLauncherPointValue
kGrenadeLauncherGrenadeDamage = 165
kGrenadeLauncherGrenadeDamageType = kDamageType.GrenadeLauncher
kGrenadeLauncherClipSize = 4
kGrenadeLauncherGrenadeDamageRadius = 4.8
kGrenadeLifetime = 2.0
kGrenadeUpgradedLifetime = 1.5



--Flame / Burn

gFlameUpdateTime = 0.6
gBurnDamagePerSecond = 2
gBurnDamagePerStackPerSecond = 5 --3
gCompoundFireDamageDelay = 1 --2
gCompundFireDamageScalar = 1 -- 0.5
gFlameRadius = 1.8

--Flame.kDamageRadius = 1.8
--Flame.kLifeTime = 5.6
--Flame.kDamage = 8

kFlameDamageStackWeight = 0.5


kFlameUpdateTime = gFlameUpdateTime
kBurnDamagePerSecond = gBurnDamagePerSecond
kBurnDamagePerStackPerSecond = gBurnDamagePerStackPerSecond
kCompoundFireDamageDelay = gCompoundFireDamageDelay
kCompundFireDamageScalar = gCompundFireDamageScalar
kFlameRadius = gFlameRadius

--FlameThrower

gFlamethrowerDamage = 8 --8
gFlameThrowerEnergyDamage = 2 --3
gFlamethrowerDamageType = kDamageType.Flame
gFlamethrowerClipSize = 75 --50
gFlamethrowerRange = 9
gFlamethrowerUpgradedRange = 11.5
gFlamethrowerMaxStacks = 30
gFlamethrowerBurnDuration = 5
gFlamethrowerStackRate = 0.2 --0.4
gFlamethrowerPointValue = 7
gFlamethrowerStructureDamage = 1.5 --1.125
kFTStructureDamage = gFlamethrowerStructureDamage

kFlamethrowerDamageType = kDamageType.Flame
kFlamethrowerClipSize = 50
kFlamethrowerRange = 9
kFlamethrowerUpgradedRange = 11.5
kFlamethrowerCost = 12
kFlamethrowerDropCost = 15
kFlamethrowerTechResearchCost = 20
kFlamethrowerRangeTechResearchCost = 10
kFlamethrowerTechResearchTime = 60
kFlamethrowerAltTechResearchTime = 60
kFlamethrowerRangeTechResearchTime = 60
kFlamethrowerBurnDuration = 5 --4

kFlamethrowerPointValue = gFlamethrowerPointValue
kFlamethrowerDamage = gFlamethrowerDamage
kFlameThrowerEnergyDamage = gFlameThrowerEnergyDamage
kFlamethrowerDamageType = gFlamethrowerDamageType
kFlamethrowerClipSize = gFlamethrowerClipSize
kFlamethrowerRange = gFlamethrowerRange
kFlamethrowerUpgradedRange = gFlamethrowerUpgradedRange
kFlamethrowerMaxStacks = gFlamethrowerMaxStacks
kFlamethrowerBurnDuration = gFlamethrowerBurnDuration
kFlamethrowerStackRate = gFlamethrowerStackRate




--Shotgun

--gShotgunBulletSize = 0.05 --0.016
gShotgunClipSize = 8 --default 6
gShotgunAmmoSize = 32 --default 6
gShotgunWeight = 0.14
gShotgunReloadSpeed = 0.1

gShotgunPrimaryBulletSize = 0.016
gShotgunPrimaryDamage = 10
gShotgunPrimaryAttackSpeed = 0.78 --0.88
gShotgunPrimaryBulletsClipCost = 1
gShotgunPrimaryBulletsPerShot = 19 --17
gShotgunPrimaryDamageType = kDamageType.Normal
gShotgunPrimaryRange = 35
gShotgunPrimaryEffectRange = 35 --5
gShotgunPrimaryRangeWhileVortexed = 35  --5
-- higher numbers reduces the spread
gShotgunPrimarySpreadDistance = 10 --8.5

--19 bullets .016 in 1 shot size = 0.304
gShotgunSecondaryBulletSize = 0.304 --0.016
gShotgunSecondaryDamage = 80 
gShotgunSecondaryAttackSpeed = 0.78 --0.88
gShotgunSecondaryBulletsClipCost = 1
gShotgunSecondaryBulletsPerShot = 1 --10
gShotgunSecondaryDamageType = kDamageType.Puncture --kDamageType.Normal
gShotgunSecondaryRange = 35
gShotgunSecondaryEffectRange = 35 --5
gShotgunSecondaryRangeWhileVortexed = 35
-- higher numbers reduces the spread
gShotgunSecondarySpreadDistance = 10    --Higher number means closer spread

gShotgunSecondarySpreadDistance = 10
gShotgunSecondarySpreadDistanceX = Math.Radians(gShotgunPrimarySpreadDistance * 0.001) --20
gShotgunSecondarySpreadDistanceY = Math.Radians(gShotgunPrimarySpreadDistance * 0.001) --20

gShotgunPointValue = 10
kShotgunTechResearchTime = 30


kShotgunPointValue = gShotgunPointValue

kShotgunWeight = gShotgunWeight
kShotgunFireRate = gShotgunPrimaryAttackSpeed
kShotgunDamage = gShotgunPrimaryDamage
kShotgunDamageType = gShotgunPrimaryDamageType
kShotgunClipSize = gShotgunClipSize
kShotgunBulletsPerShot = gShotgunPrimaryBulletsPerShot

kPrimarySpreadDistance = gShotgunPrimarySpreadDistance
kSecondarySpreadDistance = gShotgunSecondarySpreadDistance

--Welder
gLevelScoreAdded = 1
gWelderPointsPerScore = 175
gWelderScoreAddedPerPoints = 2
gWelderDamagePerSecond = 30
gWelderDamageType = kDamageType.Flame
kWelderFireDelay = 0.45 --0.20 --0.45 ?
gWelderSelfWeldAmount = 5
gWelderPlayerArmorRate = 30
gWelderStructureWeldRateBreakableDoor = gWelderPlayerArmorRate * 1.8 --1.2
gWelderPowerRepairRate = 175
gBuilderPowerRepairRate = 600
gWelderSentryRepairRate = 150
gWelderStructureWeldRate = 200
gDoorWeldTime = 15 --per player?


kWelderPowerRepairRate = gWelderPowerRepairRate
kBuilderPowerRepairRate = gBuilderPowerRepairRate
kWelderSentryRepairRate = gWelderSentryRepairRate
kDoorWeldTime = gDoorWeldTime

kPlayerArmorWeldRate = gWelderPlayerArmorRate
kPlayerWeldRate = gWelderPlayerArmorRate

/*
kWelderPointsPerScore = gWelderPointsPerScore
kWelderScoreAddedPerPoints = gWelderScoreAddedPerPoints
kWelderDamagePerSecond = gWelderDamagePerSecond
kWelderDamageType = gWelderDamageType
kSelfWeldAmount = gWelderSelfWeldAmount

*/
--Marine Weapons End

--Marine Research

kWeapons1ResearchTime = 30 --60
kWeapons2ResearchTime = 30 --90
kWeapons3ResearchTime = 30 --120
kArmor1ResearchTime = 30 --60
kArmor2ResearchTime = 30 --90
kArmor3ResearchTime = 30 --120
kTechEMPResearchTime = 60
kTechMACSpeedResearchTime = 15
kCatPackTechResearchTime = 45

kPowerSurgeResearchCost = 15
kPowerSurgeResearchTime = 45
kPowerSurgeCooldown = 20
kPowerSurgeDuration = 20
kPowerSurgeCost = 5
kPowerSurgeDamage = 25
kPowerSurgeDamageRadius = 6
kPowerSurgeElectrifiedDuration = 6




--Marine Classes

--JetPack
kJetpackHealth = 125 --100
kJetpackArmor = 50 --0
kJetpackPointValue = 10
kUpgradedJetpackUseFuelRate = .19
kJetpackingAccel = 0.8
kJetpackUseFuelRate = .21
kJetpackReplenishFuelRate = .11
kJetpackUseFuelRate = 0.21
kJetpackFuelReplenishDelay = 0

kJetpackWeightLiftForce = 0.5 --0.13 --How much weight the jetpack lifts
kMinWeightJetpackFuelFactor = 0.45 --0.8 --Min factor that gets applied on fuel usage of jetpack

kJetpackTechResearchTime = 20 --90
kJetpackFuelTechResearchTime = 20 --60
kJetpackArmorTechResearchTime = 20 --60




--JumpPack
--kJumpPackCost = 7



--Marine Classes End

--NanoShield
kNanoShieldDuration = 5
kNanoShieldResearchCost = 15
kNanoSnieldResearchTime = 60
gNanoArmorHealPerSecond = 5 --2
kNanoShieldDamageReductionDamage = 0.68

--Marine Buildings
kRecycleTime = 12


--AdvBeacon
kAdvancedBeaconCost = 13
kObsAdvBeaconPowerOff = 16 --12 w/ lvl 25
--kAdvBeacTechCost = 15
--kAdvBeacTechTime = 30

--Armory Settings
gArmoryHealth = 1500 --2000
gArmoryArmor = 1000 --500
gArmoryPointValue = 6
gArmoryLvl = 75
gArmoryAddXp = 1
gArmoryHealAmount = 25
gArmoryArmorHealPercent = 0.20 -- 20% armor
gArmoryResupplyInterval = 0.8
gArmoryLoginAndResupplyTime = 0 --0.3
gArmoryResupplyUseRange = 2.5
gArmoryDeployTime = 1 --3
kArmoryBuildTime = 12

kArmoryDeployTime = gArmoryDeployTime
kArmoryHealth = gArmoryHealth
kArmoryArmor = gArmoryArmor
kArmoryPointValue = gArmoryPointValue
kArmoryLvl = gArmoryLvl
kArmoryAddXp = gArmoryHealAmount
kArmoryHealAmount = gArmoryHealAmount
kArmoryResupplyInterval = gArmoryResupplyInterval
kArmoryLoginAndResupplyTime = gArmoryLoginAndResupplyTime


--Adv Armory Settings
kAdvancedArmoryResearchTime = 10 --90
gAdvancedArmoryHealth = 2500 --3500
gAdvancedArmoryArmor = 1250 --750
gAdvancedArmoryPointValue = 11
/*
gAdvancedArmoryHealAmount = 35 --25
gAdvancedArmoryArmorHealPercent = 0.34 --0.20 -- 20% armor
gAdvancedArmoryResupplyInterval = 0.6 --0.8
gAdvancedArmoryLoginAndResupplyTime = 0.3
*/
kAdvancedArmoryHealth = gAdvancedArmoryHealth
kAdvancedArmoryArmor = gAdvancedArmoryArmor
kAdvancedArmoryPointValue = gAdvancedArmoryPointValue
kAdvancedArmoryHealAmount = gAdvancedArmoryHealAmount
kAdvancedArmoryResupplyInterval = gAdvancedArmoryResupplyInterval
kAdvancedArmoryLoginAndResupplyTime = gAdvancedArmoryLoginAndResupplyTime

--Arms Lab

kArmsLabHealth = 1650
kArmsLabArmor = 500
kArmsLabPointValue = 15

--BackupLight Settings

gBackupLightSetInnerCone = 30
gBackupLightSetOuterCone = 45
gBackupLightSetIntensity = 25
gBackupLightSetRadius = 15
gBackupLightSetAtmosphericDensity = 0.2


--BreakableDoor Settings

gBreakableDoorHealth = 4000
kBreakableDoorHealth = 4000
--gBreakableDoor

--Command Station

kCommandStationHealth = 3000
kCommandStationArmor = 1500
kCommandStationPointValue = 20

--Sentry Settings

kSentryAttackDamageType = kDamageType.Normal
kSentryAttackBaseROF = .15
kSentryAttackRandROF = 0.0
kSentryAttackBulletsPerSalvo = 1
kConfusedSentryBaseROF = 2.0
kSentryBuildTime = 4 --default 3
kSentrySupply = 2
kSentryHealth = 650
kSentryArmor = 125
kSentryPointValue = 3
kCommSentryPerRoom = 6

--Battery Settings

kSentryBatteryPointValue = 5
kBatteryPowerRange = 4
kSentryBatteryHealth = 780 --30% increase from 600
kSentryBatteryArmor = 230 --30% increase from 200
kSentryBatteryCost = 10
kSentryBatteryBuildTime = 5

--InfrantryPortal Settings
kInfantryPortalHealth = 1525
kInfantryPortalArmor = 500
kInfantryPortalPointValue = 10
kInfantryPortalBuildTime = 7

kInfantryPortalMaxLevel = 25
kInfantryPortalXPGain = 0.5


--Observatory

kObservatoryHealth = 700
kObservatoryArmor = 500
kObservatoryPointValue = 10

-- Phasegate Settings


kPhaseGateHealth = 1500
kPhaseGateArmor = 800
kPhaseGatePointValue = 10
gPhasegateDelay = 2


--Protolab


kPrototypeLabBuildTime = 10 --20
kPrototypeLabHealth = 2000 --3000
kPrototypeLabArmor = 750 --500
kPrototypeLabPointValue = 20


--Robo Factory

kRoboticsFactoryHealth = 2800
kRoboticsFactoryArmor = 600
kRoboticsFactoryPointValue = 5


--Arc Robotices

kARCRoboticsFactoryHealth = 2800
kARCRoboticsFactoryArmor = 600
kARCRoboticsFactoryPointValue = 7

--Extractor
kExtractorBuildTime = 11

--Mac Settings
kMACAttackDamage = 5
kMACAttackDamageType = kDamageType.Normal
kMACAttackFireDelay = 0.6
kMACInitialEnergy = 50
kMACMaxEnergy = 150
kMACBuildTime = 5
gMACMaxAmount = 12
gMACMaxLevel = 50
gMACConstructRate = 0.4
gMACWeldRate = 0.5 --1
gMACOrderScanRadius = 10
gMACRepairHealthPerSecond = 50
kMACHealth = 300    kMACArmor = 50 
gMACHealth = kMACHealth
gMACArmor = kMACArmor
gMACMoveSpeed = 6
gMACHoverHeight = .5
gMACStartDistance = 3
gMACWeldDistance = 2
gMACBuildDistance = 2     -- Distance at which bot can start building a structure.
--gMACSpeedUpgradePercent = (1 + kMACSpeedAmount)
gMACRolloutSpeed = 2
gMACCapsuleHeight = .2
gMACCapsuleRadius = .5
gMACGreetingUpdateInterval = 1
gMACGreetingInterval = 10
gMACGreetingDistance = 5
gMACUseTime = 2.0

-- how often we check to see if we are in a marines face when welding Note: Need to be fairly long to allow it to weld marines with backs towards walls - the AI will -- stop moving after a < 1 sec long interval, and the welding will be done in the time before it tries -- to move behind their backs again
gMACWeldPositionCheckInterval = 1 
/*
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

-- how often we check to see if we are in a marines face when welding Note: Need to be fairly long to allow it to weld marines with backs towards walls - the AI will -- stop moving after a < 1 sec long interval, and the welding will be done in the time before it tries -- to move behind their backs again
MAC.kWeldPositionCheckInterval = 1 
*/



kMacMaxAmount = gMacMaxAmount
kMacMaxLevel = kMacMaxLevel

--Arc Settings
kARCMaxAmount = 12
kARCTurnSpeed = math.pi / 2 -- an ARC turns slowly
kARCMaxSpeedLimitAngle = math.pi / 36 -- 5 degrees
kARCNoSpeedLimitAngle = math.pi / 4 -- 24 degrees
kARCHealth = kARCHealth
kARCStartDistance = 4
kARCDamage = 450
kARCRange = 26 -- From NS1
kARCMinRange = 0 --7
kARCAttackSplashRadius = 7
kARCUpgradedSplashRadius = 13
kARCMoveSpeed = 2.0
kARCCombatMoveSpeed = 0.8
kARCFov = 360
kARCBarrelMoveRate = 100
kARCMaxPitch = 45
kARCMaxYaw = 180
kARCCapsuleHeight = .05
kARCCapsuleRadius = .5

kARCDamageType = kDamageType.Splash -- splash damage hits friendly arcs as well

kARCBuildTime = 7
kARCSplashTechResearchTime = 30
kARCArmorTechResearchTime = 30

--//Exosuit Settings
--Exos


--ExoFlamer Settings

kExoFlamer3PTrailnumFlameSegments = 8  --ThirdPerson view
kExoFlamer3PminHardeningValue = 0.1  --ThirdPerson view
kExoFlamerAcceleration = 20 -- 20
kExoFlamerAlienVisibilityChangeDuration = 0.5
kExoFlamerConeWidth = 0.25 --0.17
kExoFlamerCoolDownRate = 0.25 --0.24
kExoFlamerDamage = 10 --23
kExoFlamerDamageLength = 6 --6
kExoFlamerDamageLevels = 5 --3 WIP
kExoFlamerDamageOverTimePerLevel = 10  --5 WIP
kExoFlamerDualGunHeatUpRate = 0.06
kExoFlamerFireRate = 0.15
kExoFlamerGetStunnedCooldown = 3
kExoFlamerHardeningModifier = 0.8
kExoFlamerHeatUpRate = 0.100 --0.168
kExoFlamerImpactEffectRate = 0.15
kExoFlamerMaxHardeningValue = 2
kExoFlamerMinHardeningValue = 0.5
kExoFlamerMoveSpeedWhileFiringMultipler = 1  --1 = no change in speed. 1.25 = slow by 25%
kExoFlamerPilotEffectRate = 0.3
kExoFlamerSmokeEffectRate = 1.5
kExoFlamerThrusterHorizontalAcceleration = 23
kExoFlamerTrailLength = 9.5
kExoFlamerTrailWeight = 0.6
kExoFlamerTrailnumFlameSegments = 30
kExoFlamerUseCatPackCooldown = 6 -- 6
kExoFlamerXZExtents = 0.55 -- 0.55
kExoFlamerYExtents = 1.2 -- 1.20
kExoFlamerThrustersCooldownTime = 2.5

gExoFlamerThrustersDuration =  1.5
gExoFlamerThrustersMinimumFuel =  0.99
gExoFlamerCrouchShrinkAmount = 0 -- 0
gExoFlamerExtentsCrouchShrinkAmount = 0 -- 0



--ExoWelder Settings
gExoWelderDamagePerAttack = 20
gExoWelderPlayerWeldAmount = 20 --15
gExoWelderStructureWeldAmount = 75 --65
gExoWelderStructureWeldRateBreakableDoor = 90
gExoWelderWeldRange = 3 --4
kExoWelderWeldRange = 3 --4
gExoWelderEffectRate = 0.45 --0.45
gExoWelderFireDelay = 0.45 --0.2 ?
kExoWelderHealScoreAdded = 1
kExoWelderAmountHealedForPoints = 200
gExoWelderSelfWeldAmount = 10 --5
gExoWelderPlayerWeldRate = 0.45 --0.45
gExoWelderStructureWeldRate = 0.2
gExoWelderGetStunnedCooldown = 3

gExoWelderCrouchShrinkAmount = 0 -- 0
gExoWelderExtentsCrouchShrinkAmount = 0 -- 0
gExoWelderMoveSpeedWhileFiringMultipler = 1  --1 = no change in speed. 1.25 = slow by 25% still need to implement
gExoWelderThrusterHorizontalAcceleration = 23 --23
gExoWelderAcceleration = 30 --20
gExoWelderThrustersMinimumFuel = 0.99
gExoWelderThrustersDuration = 1.5
gExoWelderThrustersCooldownTime = 2.5
gExoWelderThrustersDuration =  1.5
gExoWelderXZExtents = 0.35 -- 0.55
gExoWelderYExtents = 1.0 -- 1.2
gExoWelderUseCatPackCooldown = 6 -- 6

kExoWelderWelderEffectRate = gExoWelderEffectRate
--kExoWelderFireRate = gExoWelderFireAmount
kExoWelderEffectRate = gExoWelderEffectRate
kExoWelderFireDelay = gExoWelderFireDelay
kExoWelderStructureWeldAmount = gExoWelderStructureWeldAmount
kExoWelderPlayerWeldAmount = gExoWelderPlayerWeldAmount
kExoWelderPlayerWeldRate = gExoWelderPlayerWeldRate
kExoWelderStructureWeldRate = gExoWelderStructureWeldAmount
kExoWelderSelfWeldAmount = gExoWelderSelfWeldAmount
kExoWelderStructureWeldRateBreakableDoor = gExoWelderStructureWeldRateBreakableDoor

kExoWelderCrouchShrinkAmount = gExoWelderCrouchShrinkAmount
kExoWelderExtentsCrouchShrinkAmount = gExoWelderExtentsCrouchShrinkAmount
--kAcceleration = gExoWelderAcceleration
kExoWelderDamagePerSecond = gExoWelderDamagePerAttack
kExoWelderMoveSpeedWhileFiringMultipler = gExoWelderMoveSpeedWhileFiringMultipler
kExoThrusterHorizontalAcceleration = gExoWelderThrusterHorizontalAcceleration
--Exo.kXZExtents = gExoWelderXZExtents
--Exo.kYExtents = gExoWelderYExtents


--ExoDualMinigun Settings


kMinigunDamage = 10
kMinigunDamageType = kDamageType.Normal
kMinigunClipSize = 250

gExoMinigunAcceleration = 20 -- 20
gExoMinigunThrusterHorizontalAcceleration = 23
gExoMinigunMoveSpeedWhileFiringMultipler = 1  --1 = no change in speed. 1.25 = slow by 25%
gExoMinigunXZExtents = 0.55 -- 0.55
gExoMinigunYExtents = 1.2 -- 1.20
gExoMinigunThrustersCooldownTime = 2.5
gExoMinigunThrustersDuration = 1.5
gExoMinigunThrustersMinimumFuel = 0.99
gExoMinigunCrouchShrinkAmount = 0 -- 0
gExoMinigunExtentsCrouchShrinkAmount = 0 -- 0
gExoMinigunUseCatPackCooldown = 6 -- 6
gExoMinigunGetStunnedCooldown = 3
gExoMinigunRange = 400
gExoMinigunSpread = Math.Radians(5)
gExoMinigunBulletSize = 0.03
gExoMinigunHeatUpRate = 0.3
gExoMinigunCoolDownRate = 0.4
gExoMinigunPointValue = 10
gExoMinigunWeight = 0.06
gExoMinigunTracerEffectFrequency = 1


kMinigunWeight = gExoMinigunWeight
kMinigunPointValue = gExoMinigunPointValue
--ExoDualRailgun Settings
gExoRailgunDamage = 33
gExoRailgunChargeDamage = 140
gExoRailgunThrusterHorizontalAcceleration = 23
gExoRailgunMoveSpeedWhileFiringMultipler = 1  --1 = no change in speed. 1.25 = slow by 25%
gExoRailgunXZExtents = 0.55 -- 0.55
gExoRailgunYExtents = 1.2 -- 1.20
gExoRailgunThrustersCooldownTime = 2.5
gExoRailgunThrustersDuration = 1.5
gExoRailgunThrustersMinimumFuel = 0.99
gExoRailgunCrouchShrinkAmount = 0 -- 0
gExoRailgunExtentsCrouchShrinkAmount = 0 -- 0
gExoRailgunUseCatPackCooldown = 6 -- 6
gExoRailgunGetStunnedCooldown = 3
gExoRailgunAcceleration = 20 -- 20
gExoRailgunSuitCost = 35 --default 45
gExoRailgunDamageType = kDamageType.Structural
gRailgunPointValue = 10



kRailgunPointValue = gRailgunPointValue
kDualRailgunExosuitCost = gExoRailgunSuitCost
kExoRailgunMoveSpeedWhileFiringMultipler = gExoRailgunMoveSpeedWhileFiringMultipler
kRailgunDamage = gExoRailgunDamage
kRailgunChargeDamage = gExoRailgunChargeDamage
kRailgunDamageType = gExoRailgunDamageType


--AllExo Settings-------------------------------
--gAllExoPlayerWeldRate = 15
kWeaponsModuleAddonTime = 40
kExosuitTechResearchTime = 20 --90
kExosuitLockdownTechResearchTime = 20 --60
kExosuitUpgradeTechResearchTime = 20 --60
kDualMinigunTechResearchTime = 20 --60
kClawRailgunTechResearchTime = 20 --60
kDualRailgunTechResearchTime = 20 --60

gAllExoAtomReconstructionTime = 3
gAllExoCloseDuration = 1.0 --1.8?
gAllExoDeployDuration = 1.0
gAllExoEjectDuration = 1.0
gAllExoHealthCriticalTrigger = 0.2
gAllExoHealthWarningTrigger = 0.4
gAllExoMaxSpeed = 5.75
gAllExoSmashEggRange = 1.5
gAllExoThrusterUpwardsAcceleration = 2
gAllExoViewOffsetHeight = 2.3
gAllExoWalkMaxSpeed = 3.7
gExosuitHealth = 1
gExosuitArmor = 360 --360
gAllExosuitArmorPerUpgradeLevel = 20 --20
gHorizontalThrusterAddSpeed = 2.5

gThrusterHorizontalAcceleration = 23
gExosuitDropCost = 35 --35

gExoClawDamage = 50
gClawDamageType = kDamageType.Structural
gExosuitPointValue = 20



gPrototypeLabBonusHealAuraRange = 3 --def 4
gPrototypeLabBonusHealAuraAmount = 15


kExosuitArmorPerUpgradeLevel = gAllExosuitArmorPerUpgradeLevel
kExosuitArmor = gExosuitArmor
kAllExoArmorPerUpgradeLevel = gAllExosuitArmorPerUpgradeLevel
kAllExoArmor = gExosuitArmor
kAtomReconstructionTime = gAllExoAtomReconstructionTime
--kExoPlayerWeldRate = gExoPlayerWeldRate
kSmashEggRange = gAllExoSmashEggRange
/*
kHorizontalThrusterAddSpeed = gHorizontalThrusterAddSpeed
kThrusterUpwardsAcceleration = gAllExoThrusterUpwardsAcceleration
kWalkMaxSpeed = gAllExoWalkMaxSpeed
kViewOffsetHeight = gAllExoViewOffsetHeight
kMaxSpeed = gAllExoMaxSpeed
kThrusterHorizontalAcceleration = gThrusterHorizontalAcceleration
*/
kPrototypeLabBonusHealAuraRange = gPrototypeLabBonusHealAuraRange
kPrototypeLabBonusHealAuraAmount = gPrototypeLabBonusHealAuraAmount
kDualExosuitCost = gExosuitDropCost -- default 45
kExosuitDropCost = gExosuitDropCost -- default 50
kClawDamage = gExoClawDamage
kClawDamageType = gClawDamageType
kHealthWarningTrigger = gAllExoHealthWarningTrigger
kHealthCriticalTrigger = gAllExoHealthCriticalTrigger
kExosuitHealth = gExosuitHealth
kExosuitArmor = gExosuitArmor
kExosuitPointValue = gExosuitPointValue

----Sort these


kRoboticsFactoryBuildTime = 8
kObservatoryBuildTime = 15
kPhaseTechResearchTime = 45
kPhaseGateBuildTime = 12


kNanoArmorResearchTime = 60

kHiveBuildTime = 180

kDrifterBuildTime = 4

--Harvester
kHarvesterBuildTime = 38
kHarvesterCost = 8


kShellCost = 15
kShellBuildTime = 18

kSpurCost = 15
kSpurBuildTime = 16

kShiftCost = 13
kShiftBuildTime = 18

kVeilCost = 15
kVeilBuildTime = 14

kShadeCost = 13
kShadeBuildTime = 18

kEvolveHallucinationsResearchTime = 30



kHydraBuildTime = 13

kCystBuildTime = 5

kSkulkGestateTime = 3

kEggGestateTime = 45

kEvolutionGestateTime = 1.5 --3


kAlienBrainResearchCost = 35
kAlienBrainResearchTime = 90

kAlienMusclesResearchCost = 35
kAlienMusclesResearchTime = 90

kDefensivePostureResearchCost = 35
kDefensivePostureResearchTime = 90

kOffensivePostureResearchCost = 35
kOffensivePostureResearchTime = 90


kCommandStationInitialEnergy = 100
kCommandStationMaxEnergy = 250
kNanoShieldCost = 5
kNanoShieldCooldown = 10
kEMPCost = 50

kAmmoPackCost = 1
kMedPackCost = 1
kMedPackCooldown = 0
kCatPackCost = 3
kCatPackMoveAddSpeed = 1.25
kCatPackWeaponSpeed = 1.5
kCatPackDuration = 12


kObservatoryInitialEnergy = 25  kObservatoryMaxEnergy = 100
kObservatoryScanCost = 3
kObservatoryDistressBeaconCost = 10

kArmoryInitialEnergy = 100
kArmoryMaxEnergy = 150



kHiveInitialEnergy = 50
kHiveMaxEnergy = 200
kMatureHiveMaxEnergy = 250

kDrifterInitialEnergy = 50
kDrifterMaxEnergy = 200

kEnzymeCloudCost = 2
kHallucinationCloudCost = 2
kMucousMembraneCost = 2
kStormCost = 2

kMucousShieldCooldown = 5
kMucousShieldPercent = 0.2
kMucousShieldDuration = 5

kHallucinationLifeTime = 30

-- only allow x% of affected players to create a hallucination
kPlayerHallucinationNumFraction = 0.34
-- cooldown per entity
kHallucinationCloudCooldown = 3
kDrifterAbilityCooldown = 0
kHallucinationCloudAbilityCooldown = 12
kMucousMembraneAbilityCooldown = 1
kEnzymeCloudAbilityCooldown = 1

kNutrientMistCost = 2
kNutrientMistCooldown = 2
-- Note: If kNutrientMistDuration changes, there is a tooltip that needs to be updated.
kNutrientMistDuration = 15
-- 100% + X (increases by 66%, which is 10 second reduction over 15 seconds)
kNutrientMistPercentageIncrease = 66
kNutrientMistMaturingIncrease = 66

kRuptureCost = 3
kRuptureCooldown = 4
kRuptureParasiteTime = 10
kRuptureBurstTime = 1.25 --Time before rupture "pops"
kRuptureEffectTime = 1.5
kRuptureEffectDuration = 3
kRuptureEffectRadius = 8.7

kBoneWallCost = 3
kBoneWallCooldown = 10

kContaminationCost = 5
kContaminationCooldown = 6
kContaminationLifeSpan = 20
kContaminationBileInterval = 2
kContaminationBileSpewCount = 3

kEchoHydraCost = 1
kEchoWhipCost = 2
kEchoTunnelCost = 5
kEchoCragCost = 1
kEchoShadeCost = 1
kEchoShiftCost = 1
kEchoVeilCost = 1
kEchoSpurCost = 1
kEchoShellCost = 1
kEchoHiveCost = 10
kEchoEggCost = 2
kEchoHarvesterCost = 2

kDrifterCost = 8
kDrifterCooldown = 0
kDrifterHatchTime = 7



kHydraDamage = 15 -- From NS1
kHydraAttackDamageType = kDamageType.Normal

kWhipInitialEnergy = 25
kWhipMaxEnergy = 100
kMatureWhipMaxEnergy = 150

kShiftInitialEnergy = 50  kShiftMaxEnergy = 150
kShiftHatchCost = 5
kShiftHatchRange = 11
kMatureShiftMaxEnergy = 200

kShadeInitialEnergy = 25  kShadeMaxEnergy = 100
kShadeInkCost = 3
kShadeInkCooldown = 16
kShadeInkDuration = 6.3
kMatureShadeMaxEnergy = 150

kEnergyUpdateRate = 0.5

-- This is for CragHive, ShadeHive and ShiftHive
kUpgradeHiveCost = 10
kUpgradeHiveResearchTime = 20

kHiveBiomass = 1

kCragBiomass = 0
kShadeBiomass = 0
kShiftBiomass = 0
kWhipBiomass = 0
kHarvesterBiomass = 0
kShellBiomass = 0
kVeilBiomass = 0
kSpurBiomass = 0



kHydraCost = 3
kClogCost = 0
kGorgeTunnelCost = 3
kGorgeTunnelBuildTime = 10

kEnzymeCloudDuration = 3

kCrushCost = 0
kCarapaceCost = 0
kRegenerationCost = 0

kCamouflageCost = 0
kAuraCost = 0
kFocusCost = 0

kSilenceCost = 0
kAdrenalineCost = 0
kCelerityCost = 0

--Marine sort

kPulseGrenadeDamageRadius = 6
kPulseGrenadeEnergyDamageRadius = 10
kPulseGrenadeDamage = 110
kPulseGrenadeEnergyDamage = 0

kFistAttackPerSecond = 0.50 -- 
kFistDamage = 65 --110 kPulseGrenadeDamage = 110
kFistDamageRadius = 3 --6 kPulseGrenadeDamageRadius = 6
kFistEnergyDamageRadius = 5 -- 10 kPulseGrenadeEnergyDamageRadius = 10
kFistEnergyDamage = 50 -- default 0
kFistDamageType = kDamageType.GrenadeLauncher --kDamageType.Normal

kPowerFistAttackPerSecond = 5.00 -- 
kPowerFistDamage = 65 --110 kPulseGrenadeDamage = 110
kPowerFistDamageRadius = 3 --6 kPulseGrenadeDamageRadius = 6
kPowerFistEnergyDamageRadius = 5 -- 10 kPulseGrenadeEnergyDamageRadius = 10
kPowerFistEnergyDamage = 50 -- default 0
kPowerFistDamageType = kDamageType.GrenadeLauncher --kDamageType.Normal


kObservatoryCost = 10 -- default 10
kPhaseGateCost = 10 -- default 15
kPhaseTechResearchCost = 10 -- default 10


kUpgradeToDualMinigunCost = 10 -- default 20
kUpgradeToDualRailgunCost = 10 -- default 20

kDualMinigunTechResearchCost = 10 -- default 30
kClawRailgunTechResearchCost = 10 -- default 30
kDualRailgunTechResearchCost = 10 -- default 30

kCatPackTechResearchCost = 10 -- default 15
kWeapons1ResearchCost = 10 -- default 20
kWeapons2ResearchCost = 10 -- default 30
kWeapons3ResearchCost = 10 -- default 40

kArmor1ResearchCost = 10 -- default 20
kArmor2ResearchCost = 10 -- default 30
kArmor3ResearchCost = 10 -- default 40
kNanoArmorResearchCost = 10 -- default 20

kRifleUpgradeTechResearchCost = 10 -- default 10


kShotgunCost = 20
kShotgunDropCost = 20
kShotgunTechResearchCost = 20
kHeavyRifleTechResearchCost = 30
kHeavyMachineGunDropCost = 40
kHeavyMachineGunTechResearchCost = 20


kClusterGrenadeCost = 2
kGasGrenadeCost = 2
kPulseGrenadeCost = 2

kGrenadeLauncherCost = 20
kGrenadeLauncherDropCost = 20
kGrenadeLauncherTechResearchCost = 15
kDetonationTimeTechResearchCost = 15

kAdvancedWeaponryResearchCost = 10




kRoboticsFactoryCost = 10
kUpgradeRoboticsFactoryCost = 5
kUpgradeRoboticsFactoryTime = 10 -- default 20
kARCCost = 10
kARCSplashTechResearchCost = 10 -- default 15
kARCArmorTechResearchCost = 10 -- default 15
kWelderTechResearchCost = 0
kWelderCost = 3
kWelderDropCost = 5

kJetpackCost = 10 -- default 15
kJetpackDropCost = 10 -- default 15
kJetpackTechResearchCost = 10 -- default 25
kJetpackFuelTechResearchCost = 10 -- default 15
kJetpackArmorTechResearchCost = 10 -- default 15

kExosuitTechResearchCost = 10 -- default 20
kExosuitLockdownTechResearchCost = 10 -- default 20

kExosuitCost = 10 -- default 40
kExosuitDropCost = 10 -- default 50
kClawRailgunExosuitCost = 10 -- default 40
kDualExosuitCost = 10 -- default 45
kDualRailgunExosuitCost = 10 -- default 45


kCommandStationCost = 15

kExtractorCost = 10

kExtractorArmorCost = 5
kExtractorArmorResearchTime = 10 -- default 20

kInfantryPortalCost = 20

kArmoryCost = 10
kArmsLabCost = 15

kAdvancedArmoryUpgradeCost = 20
kPrototypeLabCost = 40

kSentryCost = 5
kPowerNodeCost = 0

kMACCost = 5
kMineCost = 10
kDropMineCost = 15
kMineResearchCost  = 10
kTechEMPResearchCost = 0
kTechMACSpeedResearchCost = 10

kWelderTechResearchTime = 15

kGrenadeTechResearchCost = 10
kGrenadeTechResearchTime = 45

-- affects dual minigun and dual railgun damage output
kExoDualMinigunModifier = 1
kExoDualRailgunModifier = 1

-- 10 bullets per second
kPistolRateOfFire = 0.1
kPistolDamage = 25
kPistolDamageType = kDamageType.Light
kPistolClipSize = 10
-- not used yet
kPistolMinFireDelay = 0.1

kPistolAltDamage = 40

kSentryDamage = 5


-- commander has  to stay in command structure for the first kCommanderMinTime seconds of each round
kCommanderMinTime = 30

kDefaultBuildTime = 8
kAutoBuildRate = 1 --0.3

kMaxSupply = 250 --200
kSupplyPerTechpoint = 250 --100


kTransformResourcesTime = 15
kTransformResourcesCost = 15
kTransformResourcesRate = 1

-- setting to true will prevent any placement and construction of marine structures on infested areas
kPreventMarineStructuresOnInfestation = false
kCorrodeMarineStructureArmorOnInfestation = true

kClawDamage = 50
kClawDamageType = kDamageType.Structural


local kDamagePerUpgradeScalar = 0.1
kWeapons1DamageScalar = 1 + kDamagePerUpgradeScalar
kWeapons2DamageScalar = 1 + kDamagePerUpgradeScalar * 2
kWeapons3DamageScalar = 1 + kDamagePerUpgradeScalar * 3


kMelee1DamageScalar = 1.1
kMelee2DamageScalar = 1.2
kMelee3DamageScalar = 1.3

--[[


kAlienStructureMoveSpeed = 1.5
kShiftStructurespeedScalar = 1

kPoisonDamageThreshhold = 5

kSpawnBlockRange = 5

kInfestationBuildModifier = 0.75

-- Time spawning alien player must be in egg before hatching
kAlienSpawnTime = 2
kInitialMACs = 0
-- Construct at a slower rate than players
kMACConstructEfficacy = .3
kFlamethrowerAltTechResearchCost = 20

kNanoArmorHealPerSecond = 0.5

kResearchMod = 1

kMinSupportedRTs = 0
kRTsPerTechpoint = 3

kEMPBlastEnergyDamage = 50

kEnzymeAttackSpeed = 1.25
kElectrifiedAttackSpeed = 0.8
kElectrifiedDuration = 5

kHallucinationHealthFraction = 0.20
kHallucinationArmorFraction = 0
kHallucinationMaxHealth = 700

-- set to -1 for no time limit
kParasiteDuration = 44

-- increases max speed by 1.5 m/s
kCelerityAddSpeed = 1.5

-- add delay between attacks equal to this value times the attack duration.  A value of 1 will half the effective attack speed.
-- 'at max' refers to # of veils.  3 = max, 0 = no effect.
kFocusAttackSlowAtMax = 0.5

kHydrasPerHive = 3
kClogsPerHive = 10
kNumWebsPerGorge = 3
kCystInfestDuration = 37.5

kSentriesPerBattery = 3

kStructureCircleRange = 4
kInfantryPortalAttachRange = 10
kArmoryWeaponAttachRange = 10
-- Minimum distance that initial IP spawns away from team location
kInfantryPortalMinSpawnDistance = 4
kItemStayTime = 30    -- NS1
kWeaponStayTime = 25

-- For power points
kMarineRepairHealthPerSecond = 600
-- The base weapons need to cost a small amount otherwise they can
-- be spammed.
kRifleCost = 0
kPistolCost = 0
kAxeCost = 0
kInitialDrifters = 0
kSkulkCost = 0

kMACSpeedAmount = .5
-- How close should MACs/Drifters fly to operate on target
kCommandStationEngagementDistance = 4
kInfantryPortalEngagementDistance = 2
kArmoryEngagementDistance = 3
kArmsLabEngagementDistance = 3
kExtractorEngagementDistance = 2
kObservatoryEngagementDistance = 1
kPhaseGateEngagementDistance = 2
kRoboticsFactorEngagementDistance = 5
kARCEngagementDistance = 2
kSentryEngagementDistance = 2
kPlayerEngagementDistance = 1
kExoEngagementDistance = 1.5
kOnosEngagementDistance = 2

-- entrance and exit
kNumGorgeTunnels = 2

-- maturation time for alien buildings
kHiveMaturationTime = 220
kHarvesterMaturationTime = 150
kWhipMaturationTime = 120
kCragMaturationTime = 120
kShiftMaturationTime = 90
kShadeMaturationTime = 120
kVeilMaturationTime = 60
kSpurMaturationTime = 60
kShellMaturationTime = 60
kCystMaturationTime = 45
kHydraMaturationTime = 140
kEggMaturationTime = 100
kTunnelEntranceMaturationTime = 135

kNutrientMistMaturitySpeedup = 2
kNutrientMistAutobuildMultiplier = 1

kMinBuildTimePerHealSpray = 0.9
kMaxBuildTimePerHealSpray = 1.8

-- Marine buy costs
kFlamethrowerAltCost = 25

-- Scanner sweep
kScanDuration = 10
kScanRadius = 20

-- Distress Beacon (from NS1)
kDistressBeaconRange = 25
kDistressBeaconTime = 3

kEnergizeRange = 17
-- per stack
kEnergizeEnergyIncrease = .25
kStructureEnergyPerEnergize = 0.15
kPlayerEnergyPerEnergize = 15
kEnergizeUpdateRate = 1

kEchoRange = 8

kSprayDouseOnFireChance = .5

-- Players get energy back at this rate when on fire
kOnFireEnergyRecuperationScalar = 1

-- Players get energy back at this rate when electrified
kElectrifiedE

kDamageVelocityScalar = 2.5

-- Each upgrade costs this much extra evolution time
kUpgradeGestationTime = 2

-- Cyst parent ranges, how far a cyst can support another cyst
--
-- NOTE: I think the range is a bit long for kCystMaxParentRange, there will be gaps between the
-- infestation patches if the range is > kInfestationRadius * 1.75 (about).
--
kHiveCystParentRange = 24 -- distance from a hive a cyst can be connected
kCystMaxParentRange = 24 -- distance from a cyst another cyst can be placed
kCystRedeployRange = 7 -- distance from existing Cysts that will cause redeployment

-- Damage over time that all cysts take when not connected
kCystUnconnectedDamage = 12


-- Mines
kNumMines = 2
kMineActiveTime = 4
kMineAlertTime = 8
kMineDetonateRange = 5
kMineTriggerRange = 1.5

-- Onos
kGoreMarineFallTime = 1
kDisruptTime = 5

kEncrustMaxLevel = 5
kSpitObscureTime = 8
kGorgeCreateDistance = 6.5

kMaxTimeToSprintAfterAttack = .2



-- when in combat self healing (innate healing or through upgrade) is multiplied with this value
kAlienRegenerationCombatModifier = 1

-- Carries the umbra cloud for x additional seconds
kUmbraRetainTime = 0.25





]]--

--[[  Balance Health


--Time interval allowed for healing to be clamped
kHealingClampInterval = 2
kHealingClampMaxHPAmount = 0.2
kHealingClampReductionScalar = 0.2

-- HEALTH AND ARMOR        
kMarineHealth = 100    kMarineArmor = 30    kMarinePointValue = 5
kJetpackHealth = 100    kJetpackArmor = 30    kJetpackPointValue = 10
kExosuitHealth = 100    kExosuitArmor = 320    kExosuitPointValue = 20

--Medpack
kMedpackHeal = 25
kMedpackPickupDelay = 0.45
kMarineRegenerationHeal = 25 --Amount of hp per second

kLayMinesPointValue = 2
kGrenadeLauncherPointValue = 10
kShotgunPointValue = 10
kHeavyMachineGunValue = 15
kFlamethrowerPointValue = 7

kMinigunPointValue = 10
kRailgunPointValue = 10

kMarineWeaponHealth = 400
        
kEggHealth = 350    kEggArmor = 0    kEggPointValue = 1
kMatureEggHealth = 400    kMatureEggArmor = 0

kBabblerHealth = 10    kBabblerArmor = 0    kBabblerPointValue = 0
kBabblerEggHealth = 300    kBabblerEggArmor = 0    kBabblerEggPointValue = 0
        
kArmorPerUpgradeLevel = 20
kExosuitArmorPerUpgradeLevel = 30
kArmorHealScalar = 1 -- 0.75

kParasitePlayerPointValue = 1
kBuildPointValue = 5
kRecyclePaybackScalar = 0.75

kCarapaceHealReductionPerLevel = 0.0

kBalanceInfestationHurtPercentPerSecond = 2
kMinHurtPerSecond = 20

-- used for structures
kStartHealthScalar = 0.3

kArmoryHealth = 1800    kArmoryArmor = 300    kArmoryPointValue = 5
kAdvancedArmoryHealth = 3000    kAdvancedArmoryArmor = 500    kAdvancedArmoryPointValue = 10
kCommandStationHealth = 3000    kCommandStationArmor = 1500    kCommandStationPointValue = 20
kObservatoryHealth = 700    kObservatoryArmor = 500    kObservatoryPointValue = 10
kPhaseGateHealth = 1500    kPhaseGateArmor = 800    kPhaseGatePointValue = 10
kRoboticsFactoryHealth = 2800    kRoboticsFactoryArmor = 600    kRoboticsFactoryPointValue = 5
kARCRoboticsFactoryHealth = 2800    kARCRoboticsFactoryArmor = 600    kARCRoboticsFactoryPointValue = 7
kPrototypeLabHealth = 3000    kPrototypeLabArmor = 500    kPrototypeLabPointValue = 20
kInfantryPortalHealth = 1525    kInfantryPortalArmor = 500    kInfantryPortalPointValue = 10
kArmsLabHealth = 1650    kArmsLabArmor = 500    kArmsLabPointValue = 15
kSentryBatteryHealth = 600    kSentryBatteryArmor = 200    kSentryBatteryPointValue = 5

-- 5000/1000 is good average (is like 7,000 health from NS1)
kHiveHealth = 4000    kHiveArmor = 750    kHivePointValue = 30
kBioMassUpgradePointValue = 10 kUgradedHivePointValue = 5
kMatureHiveHealth = 6000 kMatureHiveArmor = 1400
        
kDrifterHealth = 300    kDrifterArmor = 20    kDrifterPointValue = 5
kMACHealth = 300    kMACArmor = 50    kMACPointValue = 2
kMineHealth = 20    kMineArmor = 5    kMinePointValue = 1
        
kExtractorHealth = 2400 kExtractorArmor = 1050 kExtractorPointValue = 15
kExtractorArmorAddAmount = 700 -- not used

-- (2500 = NS1)
kHarvesterHealth = 2000 kHarvesterArmor = 200 kHarvesterPointValue = 15
kMatureHarvesterHealth = 2300 kMatureHarvesterArmor = 320

kSentryHealth = 500    kSentryArmor = 100    kSentryPointValue = 2
kARCHealth = 2000    kARCArmor = 500    kARCPointValue = 5
kARCDeployedHealth = 2000    kARCDeployedArmor = 0
        
kShellHealth = 600     kShellArmor = 150     kShellPointValue = 12
kMatureShellHealth = 700     kMatureShellArmor = 200
 
kWhipHealth = 650    kWhipArmor = 175    kWhipPointValue = 10
kMatureWhipHealth = 720    kMatureWhipArmor = 240    kMatureWhipPointValue = 10
        
kSpurHealth = 800     kSpurArmor = 50     kSpurPointValue = 12
kMatureSpurHealth = 900  kMatureSpurArmor = 100  kMatureSpurPointValue = 12

kShiftHealth = 750    kShiftArmor = 75    kShiftPointValue = 10
kMatureShiftHealth = 1100    kMatureShiftArmor = 150    kMatureShiftPointValue = 10

kVeilHealth = 900     kVeilArmor = 0     kVeilPointValue = 12
kMatureVeilHealth = 1100     kMatureVeilArmor = 0     kVeilPointValue = 12

kShadeHealth = 750    kShadeArmor = 0    kShadePointValue = 10
kMatureShadeHealth = 1500    kMatureShadeArmor = 0    kMatureShadePointValue = 10

kHydraHealth = 350    kHydraArmor = 10    kHydraPointValue = 2
kMatureHydraHealth = 450    kMatureHydraArmor = 50    kMatureHydraPointValue = 2

kClogHealth = 250  kClogArmor = 0 kClogPointValue = 0
kWebHealth = 50

kBoneWallHealth = 100 kBoneWallArmor = 0    kBoneWallHealthPerBioMass = 100
kContaminationHealth = 1000 kContaminationArmor = 0    kContaminationPointValue = 2

kPowerPointHealth = 2000    kPowerPointArmor = 1000    kPowerPointPointValue = 10
kDoorHealth = 2000    kDoorArmor = 1000    kDoorPointValue = 0

kTunnelEntranceHealth = 1000    kTunnelEntranceArmor = 100    kTunnelEntrancePointValue = 5
kMatureTunnelEntranceHealth = 1250    kMatureTunnelEntranceArmor = 200

]]--