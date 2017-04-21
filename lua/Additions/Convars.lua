--Global Variables for everything

--Unused Start
gWeaponUseTimeLimit = 0.5 --weapon_server.lua



--Unused End


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

--Units Credits Cost
gCreditClassCostJetPack = 8
gCreditClassCostRailGun = 29
gCreditClassCostMiniGun = 30
gCreditClassCostWelder = 25
gCreditClassCostFlamer = 27
gCreditClassCostGorge = 9
gCreditClassCostLerk = 12
gCreditClassCostFade = 20
gCreditClassCostOnos = 25


--Weapons Credits Cost
gCreditWeaponCostMines = 1.5
gCreditWeaponCostWelder = 1
gCreditWeaponCostHMG = 5
gCreditWeaponCostShotGun = 2
gCreditWeaponCostFlameThrower = 3
gCreditWeaponCostGrenadeLauncher = 3



--Alien Abilities  Credits Cost
gCreditAbilityCostInk = 1.5
gCreditAbilityCostNutrientMist = 1
gCreditAbilityCostHallucination = 1.75
gCreditAbilityCostEnzymeCloud = 1.5
gCreditAbilityCostContamination = 1

--Alien Structures Credits Cost
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


--General Player Credit Settings 
gCreditPlayerCapPerRound = 200
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

kMinTimeBeforeStalemate = 3 -- * 60
kMaxTimeBeforeReset = 3 * 60
kMinTimeBeforeConcede = 7 * 60
kPercentNeededForVoteConcede = 0.75 --0.75
kPercentNeededForStalemate = 0.85 --0.75


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


--Alien Settings

--Supply
kWhipSupply = 5
kCragSupply = 5
kShadeSupply = 5
kShiftSupply = 5
kDrifterSupply = 5 --default 10

--infestation
gInfestationCorrodeDamagePerSecond = 30 --30
gInfestationCommandCenterCorrodeDamagePerSecond = 120 -- gInfestationCorrodeDamagePerSecond * 4

gAlienDefaultAddXp = 0.5 --0.5
gAlienDefaultLvl = 25 --25
gAlienEnergyRecuperationRate = 10 --10
gAlienWalkBackwardSpeedScalar = 1 --1
gAlienEnergyAdrenalineRecuperationRate = 15 --15

gAliennewMaxHealthMultipler = 1.10


kLimitCragsinHiveRoom = 5
kMarineInfestationSpeedScalar = .1
kOnFireEnergyRecuperationScalar = 1
kElectrifiedEnergyRecuperationScalar = 0.7
kStructureInfestationRadius = 6 --2
kHiveInfestationRadius = 20
kMinMatureCystHealth = 200 --250 --default 200
kCystHealth = 100 --150 --default 30
kMatureCystArmor = 150 --30 --default 0
kMatureCystHealth = 350 --500 --default 450
kCystSpawnBlockDuration = 3 --+7
kInfestationRadius = 10 --7.5
kGorgeInfestationLifetime = 60
kHallucinationHealthFraction = 0.25 --default 0.20
kHallucinationArmorFraction = 0.10 -- default 0
kHallucinationMaxHealth = 725 -- default 700
kPlayerHallucinationNumFraction = 0.38 --default 0.34
--kEggsPerHatch = 4 -- default 2

kMinWebLength = 0.5
kMaxWebLength = 8

kInfestationCorrodeDamagePerSecond = gInfestationCorrodeDamagePerSecond
kInfestationCommandCenterCorrodeDamagePerSecond = gInfestationCommandCenterCorrodeDamagePerSecond
kAlienDefaultAddXp = gAlienDefaultAddXp
kAlienDefaultLvl = gAlienDefaultLvl
kAlienEnergyRecuperationRate = gAlienEnergyRecuperationRate
kAlienWalkBackwardSpeedScalar = gAlienWalkBackwardSpeedScalar
kAlienEnergyAdrenalineRecuperationRate = gAlienEnergyAdrenalineRecuperationRate
kAliennewMaxHealthMultipler = gAliennewMaxHealthMultipler
kSwipeDamageType = kDamageType.Normal

--ALien Field of View
kDefaultFov = 90
kEmbryoFov = 100
kSkulkFov = 105
kGorgeFov = 95
kLerkFov = 100
kFadeFov = 90
kOnosFov = 90
--Alien Heal Rates
kAlienRegenerationTime = 2

kAlienInnateRegenerationPercentage  = 0.02
kAlienMinInnateRegeneration = 1
kAlienMaxInnateRegeneration = 20

-- used for regeneration upgrade
kAlienRegenerationPercentage = 0.1 --0.06
kAlienMinRegeneration = 10 --6
kAlienMaxRegeneration = 100 --80

kAlienHealRateTimeLimit = 1
kAlienHealRateLimit = 1000
kAlienHealRatePercentLimit = 10 --1
kAlienHealRateOverLimitReduction = 1
kOnFireHealingScalar = 0.5


-- when in combat self healing (innate healing or through upgrade) is multiplied with this value
kAlienRegenerationCombatModifier = 0.5 --1
kAbilityMaxEnergy = 120 --100
kAdrenalineAbilityMaxEnergy = 180 --130

-- CarapaceSpeedReduction 
kCarapaceSpeedReduction = 0.25 --0.0
kSkulkCarapaceSpeedReduction = 0 --0.08
kGorgeCarapaceSpeedReduction = 0 --0.08
kLerkCarapaceSpeedReduction = 0 --0.15
kFadeCarapaceSpeedReduction = 0 --0.15

--Umbra
kUmbraEnergyCost = 23
kUmbraShotgunModifier = 0.70
kUmbraBulletModifier = 0.70
kUmbraMinigunModifier = 0.70
kUmbraRailgunModifier = 0.70
kUmbraGrenadeModifer = 0.70

kNumBabblerEggsPerGorge = 3
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
kEggGenerationRate = 9 --default 13
kAlienEggsPerHive = 4 --default 3
--kAlienSpawnTime = 9 --default 10
kHydrasPerHive = 4 --default 3


--Alien Upgrades
kMatureEggHealth = 400
kMatureEggArmor = 250
kEggHealth = 300
kEggArmor = 150
kEggPointValue = 2
kCommEggOnosCost = 90 --default 100


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

--Alien Buildings

gBioMassOneTime = 20 --default 25
gBioMassTwoTime = 20 --default 40
gHiveMaturationTime = 32 -- default 220
gHarvesterMaturationTime = 12 --default 150
gWhipMaturationTime = 8 -- default 120
gCragMaturationTime = 4 -- default 120
gShiftMaturationTime = 8 -- default 90
gShadeMaturationTime = 4 -- default 120
gCystMaturationTime = 4 --default 45balancehea
gHydraMaturationTime = 8 -- default 140
gEggMaturationTime = 8 -- default 100
gCystBuildTime = 4 --default 5

gAlienStructureMoveSpeed = 3 --1.5

kAlienStructureMoveSpeed = gAlienStructureMoveSpeed

--kEnzymeCloudDuration = 4 --default 3
kBioMassOneTime = gBioMassOneTime
kBioMassTwoTime = gBioMassTwoTime
kHiveMaturationTime = gHiveMaturationTime
kHarvesterMaturationTime = gHarvesterMaturationTime
kWhipMaturationTime = gWhipMaturationTime
kCragMaturationTime = gCragMaturationTime
kShiftMaturationTime = gShiftMaturationTime
kShadeMaturationTime = gShadeMaturationTime
kCystMaturationTime = gCystMaturationTime
kHydraMaturationTime = gHydraMaturationTime
kEggMaturationTime = gEggMaturationTime
kCystBuildTime = gCystBuildTime

--Craig

gCragUmbraCooldown = 10
gCragUmbraCost = 5
gCragUmbraRadius = 8 --12

gCragHealBonusDivider = 10 --10  = (self:GetCragsInRange() / gCragHealBonusDivider)
gCraigStructureMoveSpeed = 3 --1.5
gCragHealWaveDuration = 8
gCragHealMaxTargets = 3
gCragHealInterval = 2
gCragHealEffectInterval = 1
gCragHealRadius = 14
gCragHealAmount = 10
gCragHealWaveAmount = 50
gCragHealMinHealAmount = 10
gCragHealMaxHealAmount = 60
gCragHealHealAmountMutliplier = 1.3
gCragHealPercent = 0.06
--gCragHeal
--gCragHeal



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


--Skulk Settings
gSkulkHealth = 75
gSkulkArmor = 10
gSkulkPointValue = 5
gSkulkHealthPerBioMass = 3 --10

gSkulkMaxMovementSpeed = 9 --7.25
gSkulkLeapForce = 12 --7.6
gSkulkLeapVerticalForce = 13 --10.8
gSkulkLeapTime = 0.5 --0.2
gSkulkMass = 35 --  45=~100 pounds
gSkulkSneakSpeedModifier = 0.75 --0.66
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
gSkulkAirAcceleration =  9
gSkulkAirControl = 27
gSkulkGroundTransistionTime = 0.1
gSkulkAirFriction = 0.055 -- (GetHasCelerityUpgrade(self) and GetSpurLevel(self:GetTeamNumber()) or 0) * 0.009
gSkulkGroundFriction = 11
gSkulkIsSmallTarget = true



gSkulkUpgradeCost = 0
gXenocideResearchTime = 5 --35 --default 60

kXenocideResearchTime = gXenocideResearchTime
kSkulkUpgradeCost = gSkulkUpgradeCost

kSkulkHealth = kSkulkHealth
kSkulkArmor = kSkulkArmor
kSkulkPointValue = kSkulkPointValue
kSkulkHealthPerBioMass = gSkulkHealthPerBioMass


--Skulk Abilities

gSkulkXenocidePlayerDamage = 220
gSkulkXenocideStructureDamage = 220
gSkulkXenocideLeapGetHUDSlot = 3
gSkulkXenocideDetonateTime = 2.0
gSkulkXenocideRadiusRange = 1.4
gSkulkXenocideDistanceFraction = 1 --unused/
gXenocideDamageType = kDamageType.Structural


kXenocideRange = gSkulkXenocideRadiusRange
kXenocideDamage = gSkulkXenocidePlayerDamage
kXenocideDamageType = gXenocideDamageType
 


--Skulk End
--Babbler Settings
gBabblerHealth = 15 --default 10
gBabblerMass = 15
gBabblerRadius = 0.25
gBabblerLinearDamping = 0
gBabblerRestitution = 0.65
gBabblerFov = 200 --360

gBabblerTargetSearchRange = 12
gBabblerAttackRate = 0.37
gBabblerLifeTime = 60

gBabblerUpdateMoveInterval = 0.5
gBabblerUpdateAttackInterval = 1
gBabblerMinJumpDistance = 6
gBabblerRunSpeed = 7.5    --7
gBabblerVerticalJumpForce = 6
gBabblerMaxJumpForce = 15
gBabblerMinJumpForce = 5
gBabblerTurnSpeed = math.pi
gBabblerClingDuration = -1

kBabblerPheromoneEnergyCost = 7
kBabblerDamage = 8
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
gGorgeHealthPerBioMass = 2
gGorgeGestateTime = 7 -- default 7

kNumWebsPerGorge = 6
kGorgeGestateTime = gGorgeGestateTime

kGorgeHealth = gGorgeHealth
kGorgeArmor = gGorgeArmor
kGorgePointValue = gGorgePointValue
kGorgeHealthPerBioMass = gGorgeHealthPerBioMass
--Gorge Abilities

gSpitDamage = 30
gSpitDamageType = kDamageType.Light
gSpitEnergyCost = 7


kSpitDamage = gSpitDamage
kSpitDamageType = gSpitDamageType
kSpitEnergyCost = gSpitEnergyCost


gHealsprayDamage = 8
gHealsprayDamageType = kDamageType.Biological
gHealsprayFireDelay = 0.8
gHealsprayEnergyCost = 12
gHealsprayRadius = 3.5

gBileBombDamage = 55 -- per second
gBileBombDamageType = kDamageType.Corrode
gBileBombEnergyCost = 20
gBileBombDuration = 5
-- 200 inches in NS1 = 5 meters
gBileBombSplashRadius = 6
gBileBombDotInterval = 0.4
gBileBombVelocity = 11


gWebBuildCost = 0
gWebbedDuration = 1.5
gWebbedParasiteDuration = 10
gWebSlowVelocityScalar = 0.75 --Note: Exos override this

kHealsprayDamage = gHealsprayDamage
kHealsprayDamageType = gHealsprayDamageType
kHealsprayFireDelay = gHealsprayFireDelay
kHealsprayEnergyCost = gHealsprayEnergyCost
kHealsprayRadius = gHealsprayRadius

kBileBombDamage = gBileBombDamage
kBileBombDamageType = gBileBombDamageType
kBileBombEnergyCost = gBileBombEnergyCost
kBileBombDuration = gBileBombDuration
kBileBombSplashRadius = gBileBombSplashRadius
kBileBombDotInterval = gBileBombDotInterval
kBombVelocity = gBileBombVelocity

kWebBuildCost = gWebBuildCost
kWebbedDuration = gWebbedDuration
kWebbedParasiteDuration = gWebbedParasiteDuration
kWebSlowVelocityScalar = gWebSlowVelocityScalar
--Note: Exos override this
--Gorge End
--Lerk Settings

gLerkCost = 16 --20
gLerkUpgradeCost = 1
gLerkHealth = 150
gLerkArmor = 45
gLerkPointValue = 15
gLerkHealthPerBioMass = 2
gLerkGestateTime = 8 -- default 15
gLerkFlapEnergyCost = 3
gLerkModelSizeScaler = 0.75
gLerkRebirthLength = 4
gLerkRedemptionCooldown = 15

kLerkCost = gLerkCost
kLerkUpgradeCost = gLerkUpgradeCost
kLerkGestateTime = gLerkGestateTime
kLerkFlapEnergyCost = gLerkFlapEnergyCost
kLerkHealth = gLerkHealth
kLerkArmor = gLerkArmor
kLerkPointValue = gLerkPointValue
kLerkHealthPerBioMass = gLerkHealthPerBioMass

--Lerk Abilities

--gLerkBileBombResearchCost = 10
--gLerkBileBombResearchTime = 10

gUmbraEnergyCost = 27
gUmbraMaxRange = 17
gUmbraDuration = 4
gUmbraRadius = 4

kUmbraEnergyCost = gUmbraEnergyCost
kUmbraMaxRange = gUmbraMaxRange
kUmbraDuration = gUmbraDuration
kUmbraRadius = gUmbraRadius


gUmbraShotgunModifier = 0.75
gUmbraBulletModifier = 0.75
gUmbraMinigunModifier = 0.75
gUmbraRailgunModifier = 0.75

kUmbraShotgunModifier = gUmbraShotgunModifier
kUmbraBulletModifier = gUmbraBulletModifier
kUmbraMinigunModifier = gUmbraMinigunModifier
kUmbraRailgunModifier = gUmbraRailgunModifier

gSpikeMaxDamage = 7
gSpikeMinDamage = 7
gSpikeDamageType = kDamageType.Puncture
gSpikeEnergyCost = 1.4
gSpikesAttackDelay = 0.07
gSpikeMinDamageRange = 9
gSpikeMaxDamageRange = 2
gSpikesRange = 50
gSpikesPerShot = 1

gSporesDamageType = kDamageType.Gas
gSporesDustDamagePerSecond = 15
gSporesDustFireDelay = 0.36
gSporesMaxRange = 17
gSporesDustEnergyCost = 27
gSporesDustCloudRadius = 4
gSporesDustCloudLifetime = 4

gPrimalScreamPlayerPointBonus = 0.3
gPrimalScreamROFIncrease = .3
gPrimalScreamEnergyCost = 25
gPrimalScreamRange = 10
gPrimalScreamDamageModifier = 1.3
gPrimalScreamDuration = 4
gPrimalScreamEnergyGain = 60
gPrimalScreamROF = 3

kSpikeMaxDamage = gSpikeMaxDamage
kSpikeMinDamage = gSpikeMinDamage
kSpikeDamageType = gSpikeDamageType
kSpikeEnergyCost = gSpikeEnergyCost
kSpikesAttackDelay = gSpikesAttackDelay
kSpikeMinDamageRange = gSpikeMinDamageRange
kSpikeMaxDamageRange = gSpikeMaxDamageRange
kSpikesRange = gSpikesRange
kSpikesPerShot = gSpikesPerShot

kSporesDamageType = gSporesDamageType
kSporesDustDamagePerSecond = gSporesDustDamagePerSecond
kSporesDustFireDelay = gSporesDustFireDelay
kSporesMaxRange = gSporesMaxRange
kSporesDustEnergyCost = gSporesDustEnergyCost
kSporesDustCloudRadius = gSporesDustCloudRadius
kSporesDustCloudLifetime = gSporesDustCloudLifetime

kPrimalScreamPlayerPointBonus = gPrimalScreamPlayerPointBonus
kPrimalScreamROFIncrease = gPrimalScreamROFIncrease
kPrimalScreamEnergyCost = gPrimalScreamEnergyCost
kPrimalScreamRange = gPrimalScreamRange
kPrimalScreamDamageModifier = gPrimalScreamDamageModifier
kPrimalScreamDuration = gPrimalScreamDuration
kPrimalScreamEnergyGain = gPrimalScreamEnergyGain
kPrimalScreamROF = gPrimalScreamROF

--Lerk End

--Fade Settings

gFadeCost = 32 --40
gFadeUpgradeCost = 1
gFadeGestateTime = 9 -- default 25
gFadeHealth = 250
gFadeArmor = 104 --30% increase from 80
gFadeArmorFullyUpgradedAmount = 156 --30% increase from 120
gFadePointValue = 20
gFadeHealthPerBioMass = 5

gFadePrimaryAttackSpeedMultipler = 1 --Increase to slow attack
gFadePrimaryAttackSpeedOnFireMultipler = 1.25 --Increase to slow attack while onfire

gFadeRedemptionCooldown = 20
gFadeRebirthLength = 4
gFadeXZExtents = 0.4
gFadeYExtents = 1.05


gFadeMass = 158
gFadeJumpHeight = 1.4
gFadeScanDuration = 4
gFadeShadowStepCooldown = 0.73
gFadeShadowStepForce = 4
gFadeShadowStepSpeed = 30
gFadeShadowStepCost = 11
gFadeMaxSpeed = 6.2
gFadeBlinkSpeed = 14
gFadeBlinkAcceleration = 40
gFadeBlinkAddAcceleration = 1
gFadeMetabolizeAnimationDelay = 0.65
gFadeMinEnterEtherealTime = 0.4
gFadeGravityMod = 1.0

gFadeAccerlation = 11
gFadeGroundFriction = 9
gFadeAirControl = 40

gFadeCarapaceSpeedReduction = 0 --0.15


kFadeShadowStepCost = gFadeShadowStepCost
kFadeCarapaceSpeedReduction = gFadeCarapaceSpeedReduction
kFadeCost = gFadeCost
kFadeUpgradeCost = gFadeUpgradeCost
kFadeArmor = gFadeArmor
kFadeArmorFullyUpgradedAmount = gFadeArmorFullyUpgradedAmount
kFadeGestateTime = gFadeGestateTime
kFadePointValue = gFadePointValue
kFadeHealthPerBioMass = gFadeHealthPerBioMass


/*
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
gStabResearchTime = 20 --default 60
gStabResearchCost = 20 --default 60

--Rocket
gRocketRadius = 0.15
gRocketLifeTime = 5 --0.5

gAcidRocketDamage = 20 --25
gAcidRocketDamageType = kDamageType.Structural
gAcidRocketEnergyCost = 15 --10
gAcidRocketFireDelay = 0.5
gAcidRocketRadius = 4 --6
gAcidRocketLifeTime = 0.5
gAcidRocketResearchTime = 20
gAcidRocketResearchCost = 20
gAcidRocketVelocity = 45
gAcidRocketPlayerVelocityFraction = 0.5
gAcidRocketHUDSlot = 4
gAcidRocketignoreLOS = false

kAcidRocketDamage = gAcidRocketDamage
kAcidRocketDamageType = gAcidRocketDamageType

gSwipeDamageType = kDamageType.StructuresOnlyLight
gSwipeDamage = 75
gSwipeEnergyCost = 7
gMetabolizeEnergyCost = 25

gStabDamage = 200 --160
gStabDamageType = kDamageType.Normal
gStabEnergyCost = 45 --30

gVortexEnergyCost = 20
gVortexDuration = 3

gStartBlinkEnergyCost = 14
gBlinkEnergyCost = 27 -- default 32
gHealthOnBlink = 0


kSwipeDamageType = kDamageType.StructuresOnlyLight
kSwipeDamage = 75
kSwipeEnergyCost = 7
kMetabolizeEnergyCost = 25

kStabDamage = gStabDamage
kStabDamageType = gStabDamageType
kStabEnergyCost = gStabEnergyCost

kVortexEnergyCost = gVortexEnergyCost
kVortexDuration = gVortexDuration

kStartBlinkEnergyCost = gStartBlinkEnergyCost
kBlinkEnergyCost = gBlinkEnergyCost
kHealthOnBlink = gHealthOnBlink

--Fade End


--Onos Settings

gOnosHealth = 900
gOnosArmor = 450
gOnosPointValue = 30
gOnosHealthPerBioMass = 31 --30

--Onos Movespeed
gOnosMaxSpeed = 7.5
gOnosChargeSpeed = 11.5
gOnosCelerityMoveSpeed = 9.375
gOnosCarapaceMoveSpeed = 0.88 --0
gOnosMaxChargeSpeed = 12 --11.5
gOnosOnFireMoveSpeedFraction = 0.9
gOnosElectrifiedMoveSpeedFraction = 0.75
gOnocideMoveSpeedFraction = 0.65 --1
gBoneShieldMoveSpeedFraction = 0.1 --0

gOnosJumpForce = 20
gOnosJumpVerticalVelocity = 8
gOnosJumpRepeatTime = 0.25
gOnosViewOffsetHeight = 2.5
gOnosXExtents = 0.7
gOnosYExtents = 1.2
gOnosZExtents = 0.4
gOnosYHeadExtents = 0.7
gOnosYHeadExtentsLowered = 0.0
gOnosMass = 453 -- Half a ton
gOnosJumpHeight = 1.15
-- triggered when the momentum value has changed by this amount (negative because we trigger the effect when the onos stops, not accelerates)
gOnosMomentumEffectTriggerDiff = 3
gOnosGroundFrictionForce = 3

gOnosChargeEnergyCost = 30 -- per second
gOnosChargeUpDuration = 0.5
gOnosChargeDelay = 1.0
gOnosChargingSensScalar = 0.20 --0

gOnosStoopingCheckInterval = 0.3
gOnosStoopingAnimationSpeed = 2



gOnosGestateTime = 10-- default 30
gOnosCost = 64 --65
gOnosUpgradeCost = 1


kOnosGestateTime = gOnosGestateTime
kOnosCost = gOnosCost
kOnosUpgradeCost = gOnosUpgradeCost

--Onos abilities
--gOnosStompBoneWallDuration = 2 --4
gOnocideDetonateTime = 2.0
gOnocideDetonateRange = 5 --10
gOnocideHUDSlot = 4
gOnocideDamage = 400
gOnocideDamageHealthMinRatio = 0 --0.3
gOnocideDamageHealthMaxRatio = 0.5 --1 

gOnosStunWallLifeSpan = 2 --4
gOnosStunWallHealth = 200 --450
gOnosChargeEnergyCost = 30

gOnosChargeDamageReduction = 0.7
gOnosXenocideDamageReduction = 1.2


gGoreDamage = 100 --90
gGoreDamageType = kDamageType.Structural
gGoreEnergyCost = 10

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

gStompEnergyCost = 30
gStompDamageType = kDamageType.Heavy
gStompDamage = 40
gStompRange = 9 --12
gDisruptMarineTime = 2 --4
gDisruptMarineTimeout = 4 --8

kOnosHealth = 900
kOnosArmor = 450
kOnosPointValue = 30

kChargeEnergyCost = gOnosChargeEnergyCost
kOnocideDetonateTime = gOnocideDetonateTime
kOnocideDetonateRange = gOnocideDetonateRange
kOnosStunWallLifeSpan = gOnosStunWallLifeSpan
kOnosStunWallHealth = gOnosStunWallHealth
kOnosHealtPerBioMass = gOnosHealthPerBioMass

kGoreDamage = gGoreDamage
kGoreDamageType = gGoreDamageType
kGoreEnergyCost = gGoreEnergyCost

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

kStompEnergyCost = gStompEnergyCost
kStompDamageType = gStompDamageType
kStompDamage = gStompDamage
kStompRange = gStompRange
kDisruptMarineTime = gDisruptMarineTime
kDisruptMarineTimeout = gDisruptMarineTimeout

--Onos End

--Gorge Settings

--Gorge Abilities
kGorgeRedemptionCooldown = 15
kGorgeRebirthLength = 3



--Gorge Aiblity End



--Gorge End


--////////////Marines Settings Start
--Marine Settings

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

gMarineBulletSize = 0.018
gMarineClipSize = 15 --10
gMarineMaxClips = 8 --4



gMarineDefAddXp = 0.5
gMarineDefLvl = 25

gMarineStunImmuneTime = 2
gMaxTimeToSprintAfterAttack = 0.02 --0.2

gMarineHealth = 100
gMarineArmor = 30
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

kMACSupply = 10
kArmorySupply = 5
kARCSupply = 15
kSentrySupply = 10
kRoboticsFactorySupply = 5
kInfantryPortalSupply = 0
kPhaseGateSupply = 0

--Weights
kPistolWeight = 0.0
kHeavyRifleWeight = 0.25
kHeavyMachineGunWeight = 0.21
kGrenadeLauncherWeight = 0.15
kFlamethrowerWeight = 0.14
kShotgunWeight = 0.14

kJetpackWeightLiftForce = 0.13 --How much weight the jetpack lifts
kMinWeightJetpackFuelFactor = 0.8 --Min factor that gets applied on fuel usage of jetpack

kHandGrenadeWeight = 0.1
kLayMineWeight = 0.10

kClawWeight = 0.01
kMinigunWeight = 0.06
kRailgunWeight = 0.045


--Grenades

--Medpack
gMedpackHeal = 25
gMedpackPickupDelay = 0.45
gMarineRegenerationHeal = 25 --Amount of hp per second

kMedpackHeal = 25
kMedpackPickupDelay = 0.45
kMarineRegenerationHeal = 25 --Amount of hp per second


--kMarineRespawnTime = 8 --default 9


--Marine Weapons

-- Mines
gNumMines = 2
gMineActiveTime = 4
gMineAlertTime = 8
gMineDetonateRange = 5
gMineTriggerRange = 1.5
gLayMinesPointValue = 2


kLayMinesPointValue = gLayMinesPointValue
kNumMines = gNumMines
kMineActiveTime = gMineActiveTime
kMineAlertTime = gMineAlertTime
kMineDetonateRange = gMineDetonateRange
kMineTriggerRange = gMineTriggerRange

--Rifle

kRifleWeight = 0.13
gRifleAddClipSize = 25
--if kRifleClipSize == nil then kRifleClipSize = 50 end
gRifleClipSize = kRifleClipSize + gRifleAddClipSize
gRifleMaxClips = 10
gRifleMaxAmmo = 300


--gRiflePrimary
gRiflePrimaryBulletSize = 0.018
gRiflePrimaryRange = 100
gRiflePrimaryTracerEffectRate = 0.0367 --0.5
gRiflePrimaryEffectRate = 0.0367 --0.08
gRiflePrimaryFireRate = 0.0367 --0.08
gRiflePrimaryBulletsPerShot = 1
gRiflePrimaryDamageType = kDamageType.Normal
gRiflePrimaryDamagePerShot = 10
gRiflePrimaryRangeWhileVortexed = 75
gRiflePrimarySpreadDistance = 10
gRifleRandom = math.random()
gRiflePrimarySpreadDistanceX = Math.Radians(gRifleRandom) --20
gRiflePrimarySpreadDistanceY = Math.Radians(gRifleRandom) --20

--Shoot more bullets at once
gRifleSecondaryBulletSize = 0.018
gRifleSecondaryRange = 50
gRifleSecondaryBulletsPerShot = 5
gRifleSecondaryEffectRate = gRiflePrimaryFireRate * gRifleSecondaryBulletsPerShot --0.48 --Attack Speed 
gRifleSecondaryFireRate = gRiflePrimaryFireRate * gRifleSecondaryBulletsPerShot --0.48 --Attack Speed 
gRifleSecondaryDamageType = kDamageType.Normal--kDamageType.Puncture
gRifleSecondaryDamagePerShot = 10
--gRifleSecondaryRangeWhileVortexed = 200
gRifleSecondarySpreadDistance = 10
--gRifleSecondary



kRifleDamageType = kDamageType.Normal


--HMG


kHeavyRifleDamage = 10
kHeavyRifleDamageType = kDamageType.Puncture
kHeavyRifleCost = 30
kHeavyRifleBulletSize = 0.22
kHeavyRifleRange = 250
kHeavyRifleSpread = Math.Radians(5)
kHeavyRifleMinSpread = Math.Radians(0.2)
kHeavyRifleClipSize = 125 --75


gHeavyMachineGunValue = 15
gHeavyMachineGunWeight = 0.20 -- default 0.26
gHeavyMachineGunDropCost = 25 --default = 40


kHeavyMachineGunValue = gHeavyMachineGunValue
kHeavyMachineGunWeight = 0.20 -- default 0.26
kHeavyMachineGunDropCost = 25 --default = 40



--Axe
gAxeDamage = 40 --25
gAxeDamageType = kDamageType.Structural

gAxeHUDSlot = 3 --6
gAxeRange = 2 --1.5 --1
gAxeFloorRange = 1 --0.8
--gAxePrimaryAttackDelay =
gAxeSecondaryAttackDelay = 1
--gAxe = 0
--gAxe = 0
--gAxe = 0


kAxeDamage = gAxeDamage
kAxeDamageType = gAxeDamageType

--GrenadeLauncher


gGrenadeLauncherPointValue = 10
gGrenadeLauncherGrenadeDamage = 125 --165
gGrenadeLauncherGrenadeDamageType = kDamageType.GrenadeLauncher
gGrenadeLauncherClipSize = 4
gGrenadeLauncherGrenadeDamageRadius = 4.8
gGrenadeLifetime = 2.0
gGrenadeUpgradedLifetime = 1.5

kGrenadeLauncherPointValue = gGrenadeLauncherPointValue
kGrenadeLauncherGrenadeDamage = 125 --165
kGrenadeLauncherGrenadeDamageType = kDamageType.GrenadeLauncher
kGrenadeLauncherClipSize = 4
kGrenadeLauncherGrenadeDamageRadius = 4.8
kGrenadeLifetime = 2.0
kGrenadeUpgradedLifetime = 1.5



--Flame / Burn

gFlameUpdateTime = 0.6
gBurnDamagePerSecond = 5--2
gBurnDamagePerStackPerSecond = 5 --3
gCompoundFireDamageDelay = 1 --2
gCompundFireDamageScalar = 1 --
gFlameRadius = 1.8

--Flame.kDamageRadius = 1.8
--Flame.kLifeTime = 5.6
--Flame.kDamage = 8



kFlameUpdateTime = gFlameUpdateTime
kBurnDamagePerSecond = gBurnDamagePerSecond
kBurnDamagePerStackPerSecond = gBurnDamagePerStackPerSecond
kCompoundFireDamageDelay = gCompoundFireDamageDelay
kCompundFireDamageScalar = gCompundFireDamageScalar
kFlameRadius = gFlameRadius

--FlameThrower

gFlamethrowerDamage = 10 --8
gFlameThrowerEnergyDamage = 2 --3
gFlamethrowerDamageType = kDamageType.Flame
gFlamethrowerClipSize = 75 --50
gFlamethrowerRange = 9
gFlamethrowerUpgradedRange = 11.5
gFlamethrowerMaxStacks = 5 --30
gFlamethrowerBurnDuration = 6
gFlamethrowerStackRate = 0.4 --0.4
gFlamethrowerPointValue = 7

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
--kFlameDamageStackWeight = 0.5




--Shotgun

--gShotgunBulletSize = 0.05 --0.016
gShotgunClipSize = 8 --default 6
gShotgunAmmoSize = 165 --default 6
gShotgunWeight = 0.14

gShotgunPrimaryBulletSize = 0.016
gShotgunPrimaryDamage = 10
gShotgunPrimaryAttackSpeed = 0.88
gShotgunPrimaryBulletsClipCost = 1
gShotgunPrimaryBulletsPerShot = 19
gShotgunPrimaryDamageType = kDamageType.Normal
gShotgunPrimaryRange = 35
gShotgunPrimaryEffectRange = 35 --5
gShotgunPrimaryRangeWhileVortexed = 35  --5
-- higher numbers reduces the spread
gShotgunPrimarySpreadDistance = 10 --16
--gShotgunPrimarySpreadDistanceX = Math.Radians() --20
--gShotgunPrimarySpreadDistanceY = Math.Radians() --20



gShotgunSecondaryBulletSize = 0.5 --0.016
gShotgunSecondaryDamage = 80 
gShotgunSecondaryAttackSpeed = 0.66 --0.88
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


kShotgunPointValue = gShotgunPointValue
/*
kShotgunWeight = gShotgunWeight
kShotgunFireRate = gShotgunPrimaryAttackSpeed
kShotgunDamage = gShotgunPrimaryDamage
kShotgunDamageType = gShotgunPrimaryDamageType
kShotgunClipSize = gShotgunClipSize
kShotgunBulletsPerShot = gShotgunPrimaryBulletsPerShot
*/
kPrimarySpreadDistance = gShotgunPrimarySpreadDistance
kSecondarySpreadDistance = gShotgunSecondarySpreadDistance
--Welder

gLevelScoreAdded = 1
gWelderPointsPerScore = 175
gWelderScoreAddedPerPoints = 2
gWelderDamagePerSecond = 30
gWelderDamageType = kDamageType.Flame
gWelderFireDelay = 0.45 --0.45
gWelderSelfWeldAmount = 5
gWelderPlayerArmorRate = 30
gWelderStructureWeldRateBreakableDoor = gWelderPlayerArmorRate * 1.8 --1.2
gWelderPowerRepairRate = 220
gBuilderPowerRepairRate = 220
gWelderSentryRepairRate = 150
gPlayerWeldRate = gWelderPlayerArmorRate
gStructureWeldRate = gWelderStructureWeldRateBreakableDoor
gDoorWeldTime = 15


kWelderPowerRepairRate = gWelderPowerRepairRate
kBuilderPowerRepairRate = gBuilderPowerRepairRate
kWelderSentryRepairRate = gWelderSentryRepairRate
kPlayerWeldRate = gStructureWeldRate
kStructureWeldRate = gPlayerWeldRate
kDoorWeldTime = gDoorWeldTime

kWelderFireDelay = gWelderFireDelay
kPlayerArmorWeldRate = gWelderPlayerArmorRate
kPlayerWeldRate = gWelderPlayerArmorRate

/*
kWelderEffectRate = gWelderFireDelay
kWelderPointsPerScore = gWelderPointsPerScore
kWelderScoreAddedPerPoints = gWelderScoreAddedPerPoints
kWelderDamagePerSecond = gWelderDamagePerSecond
kWelderDamageType = gWelderDamageType
kSelfWeldAmount = gWelderSelfWeldAmount

*/
--Marine Weapons End
--Marine Classes

--JetPack
gJetpackHealth = 125 --100
gJetpackArmor = 50 --0
gJetpackPointValue = 10
gJetpackingAccel = 1 --0.8
gUpgradedJetpackUseFuelRate = 0.1 --0.19
gJetpackReplenishFuelRate = 0.45 --0.14 -- .11 to .14 %30 increase
gJetpackUseFuelRate = 0.17 --.21
gJetpackFuelReplenishDelay = 1

gJetpackWeightLiftForce = 0.5 --0.13 --How much weight the jetpack lifts
gMinWeightJetpackFuelFactor = 0.45 --0.8 --Min factor that gets applied on fuel usage of jetpack

kJetpackWeightLiftForce = gJetpackWeightLiftForce
kMinWeightJetpackFuelFactor = gMinWeightJetpackFuelFactor

kJetpackHealth = gJetpackHealth
kJetpackArmor = gJetpackArmor
kJetpackPointValue = gJetpackPointValue
kJetpackingAccel = gJetpackingAccel
kUpgradedJetpackUseFuelRate = gUpgradedJetpackUseFuelRate
kJetpackReplenishFuelRate = gJetpackReplenishFuelRate
kJetpackUseFuelRate = gJetpackUseFuelRate
kJetpackFuelReplenishDelay = gJetpackFuelReplenishDelay


--JumpPack
--kJumpPackCost = 7

--Marine Classes End
--Marine Buildings


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
gArmoryArmorHealAmount = 0.34 --0.20 -- 20% armor
gArmoryResupplyInterval = 0.8
gArmoryLoginAndResupplyTime = 0 --0.3
gArmoryResupplyUseRange = 2.5
gArmoryDeployTime = 3

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
gAdvancedArmoryHealth = 2500 --3500
gAdvancedArmoryArmor = 1250 --750
gAdvancedArmoryPointValue = 11
gAdvancedArmoryHealAmount = 35 --25
gAdvancedArmoryResupplyInterval = 0.6 --0.8
gAdvancedArmoryLoginAndResupplyTime = 0 --0.3

kAdvancedArmoryHealth = gAdvancedArmoryHealth
kAdvancedArmoryArmor = gAdvancedArmoryArmor
kAdvancedArmoryPointValue = gAdvancedArmoryPointValue
kAdvancedArmoryHealAmount = gAdvancedArmoryHealAmount
kAdvancedArmoryResupplyInterval = gAdvancedArmoryResupplyInterval
kAdvancedArmoryLoginAndResupplyTime = gAdvancedArmoryLoginAndResupplyTime

--BackupLight Settings

gBackupLightSetInnerCone = 30
gBackupLightSetOuterCone = 45
gBackupLightSetIntensity = 25
gBackupLightSetRadius = 15
gBackupLightSetAtmosphericDensity = 0.2


--BreakableDoor Settings

gBreakableDoorHealth = 4000
--gBreakableDoor


--Sentry Settings

gSentryBuildTime = 4 --default 3
gSentrySupply = 2
gSentryHealth = 650
gSentryArmor = 125
gSentryPointValue = 3
gCommSentryPerRoom = 6

kSentryBuildTime = 4 --default 3
kSentrySupply = 2
kSentryHealth = 650
kSentryArmor = 125
kSentryPointValue = 3
kCommSentryPerRoom = 6

--Battery Settings
gBatteryPowerRange = 4
gSentryBatteryHealth = 780 --30% increase from 600
gSentryBatteryArmor = 230 --30% increase from 200

kBatteryPowerRange = gBatteryPowerRange
kSentryBatteryHealth = gSentryBatteryHealth
kSentryBatteryArmor = gSentryBatteryArmor

--InfrantryPortal Settings
gInfantryPortalMaxLevel = 25
gInfantryPortalXPGain = 0.5

kInfantryPortalMaxLevel = gInfantryPortalMaxLevel
kInfantryPortalXPGain = gInfantryPortalXPGain


-- Phasegate Settings



gPhasegateDelay = 2



--Mac Settings
gMacMaxAmount = 12
gMacMaxLevel = 50
gMACConstructRate = 0.4
gMACWeldRate = 0.5
gMACOrderScanRadius = 10
gMACRepairHealthPerSecond = 50
gMACHealth = kMACHealth
gMACArmor = kMACArmor
gMACMoveSpeed = 6
gMACHoverHeight = .5
gMACStartDistance = 3
gMACWeldDistance = 2
gMACBuildDistance = 2     -- Distance at which bot can start building a structure.
gMACSpeedUpgradePercent = (1 + kMACSpeedAmount)
gMACRolloutSpeed = 2
gMACCapsuleHeight = .2
gMACCapsuleRadius = .5
gMACGreetingUpdateInterval = 1
gMACGreetingInterval = 10
gMACGreetingDistance = 5
gMACUseTime = 2.0
gMACSupplyCost = 5


kMACSupply = gMACSupplyCost

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
gArcMaxAmount = 12
gArcTurnSpeed = math.pi / 2 -- an ARC turns slowly
gArcMaxSpeedLimitAngle = math.pi / 36 -- 5 degrees
gArcNoSpeedLimitAngle = math.pi / 4 -- 24 degrees
gArcHealth = kARCHealth
gArcStartDistance = 4
gArcAttackDamage = kARCDamage
gArcFireRange = kARCRange -- From NS1
gArcMinFireRange = kARCMinRange
gArcAttackSplashRadius = 7
gArcUpgradedSplashRadius = 13
gArcMoveSpeed = 2.0
gArcCombatMoveSpeed = 0.8
gArcFov = 360
gArcBarrelMoveRate = 100
gArcMaxPitch = 45
gArcMaxYaw = 180
gArcCapsuleHeight = .05
gArcCapsuleRadius = .5

kArcMaxAmount = gArcMaxAmount
kArcTurnSpeed = gArcTurnSpeed
kArcMaxSpeedLimitAngle = gArcMaxSpeedLimitAngle
kArcNoSpeedLimitAngle = gArcNoSpeedLimitAngle
kArcHealth = gArcHealth
kArcStartDistance = gArcStartDistance
kArcAttackDamage = gArcAttackDamage
kArcFireRange = gArcFireRange
kArcMinFireRange = gArcMinFireRange
kArcAttackSplashRadius = gArcAttackSplashRadius
kArcUpgradedSplashRadius = gArcUpgradedSplashRadius
kArcMoveSpeed = gArcMoveSpeed
kArcCombatMoveSpeed = gArcCombatMoveSpeed
kArcFov = gArcFov
kArcBarrelMoveRate = gArcBarrelMoveRate
kArcMaxPitch = gArcMaxPitch
kArcMaxYaw = gArcMaxYaw
kArcCapsuleHeight = gArcCapsuleHeight
kArcCapsuleRadius = gArcCapsuleRadius

--//Exosuit Settings
--Exos


--ExoFlamer Settings

gExoFlamer3PTrailnumFlameSegments = 8  --ThirdPerson view
gExoFlamer3PminHardeningValue = 0.1  --ThirdPerson view
gExoFlamerAcceleration = 20 -- 20
gExoFlamerAlienVisibilityChangeDuration = 0.5
gExoFlamerConeWidth = 0.25 --0.17
gExoFlamerCoolDownRate = 0.25 --0.24
gExoFlamerDamage = 10 --23
gExoFlamerDamageLength = 6 --6
gExoFlamerDamageLevels = 5 --3 WIP
gExoFlamerDamageOverTimePerLevel = 10  --5 WIP
gExoFlamerDualGunHeatUpRate = 0.06
gExoFlamerFireRate = 0.15
gExoFlamerGetStunnedCooldown = 3
gExoFlamerHardeningModifier = 0.8
gExoFlamerHeatUpRate = 0.100 --0.168
gExoFlamerImpactEffectRate = 0.15
gExoFlamerMaxHardeningValue = 2
gExoFlamerMinHardeningValue = 0.5
gExoFlamerMoveSpeedWhileFiringMultipler = 1  --1 = no change in speed. 1.25 = slow by 25%
gExoFlamerPilotEffectRate = 0.3
gExoFlamerSmokeEffectRate = 1.5
gExoFlamerThrusterHorizontalAcceleration = 23
gExoFlamerTrailLength = 9.5
gExoFlamerTrailWeight = 0.6
gExoFlamerTrailnumFlameSegments = 30
gExoFlamerUseCatPackCooldown = 6 -- 6
gExoFlamerXZExtents = 0.55 -- 0.55
gExoFlamerYExtents = 1.2 -- 1.20
gExoFlamerThrustersCooldownTime = 2.0 -- 2.5

gExoFlamerThrustersDuration = 2.0 -- 1.5
gExoFlamerThrustersMinimumFuel = 0.50 -- 0.99
gExoFlamerCrouchShrinkAmount = 0 -- 0
gExoFlamerExtentsCrouchShrinkAmount = 0 -- 0

kExoFlamer3PTrailnumFlameSegments = gExoFlamer3PTrailnumFlameSegments
kExoFlamer3PminHardeningValue = gExoFlamer3PminHardeningValue
kExoFlamerAcceleration = gExoFlamerAcceleration
kExoFlamerConeWidth = gExoFlamerConeWidth
kExoFlamerCoolDownRate = gExoFlamerCoolDownRate
kExoFlamerDamage = gExoFlamerDamage
kExoFlamerDamageLength = gExoFlamerDamageLength
kExoFlamerDamageLevels = gExoFlamerDamageLevels
kExoFlamerDamageOverTimePerLevel = gExoFlamerDamageOverTimePerLevel
kExoFlamerDualGunHeatUpRate = gExoFlamerDualGunHeatUpRate
kExoFlamerFireRate = gExoFlamerFireRate
kExoFlamerGetStunnedCooldown = gExoFlamerGetStunnedCooldown
kExoFlamerHeatUpRate = gExoFlamerHeatUpRate
kExoFlamerImpactEffectRate = gExoFlamerImpactEffectRate
kExoFlamerMoveSpeedWhileFiringMultipler = gExoFlamerMoveSpeedWhileFiringMultipler
kExoFlamerPilotEffectRate = gExoFlamerPilotEffectRate
kExoFlamerSmokeEffectRate = gExoFlamerSmokeEffectRate
kExoFlamerThrusterHorizontalAcceleration = gExoFlamerThrusterHorizontalAcceleration
kExoFlamerTrailLength = gExoFlamerTrailLength
kExoFlamerTrailWeight = gExoFlamerTrailWeight
kExoFlamerTrailnumFlameSegments = gExoFlamerTrailnumFlameSegments
kExoFlameralienvisibilityChangeDuration = gExoFlameralienvisibilityChangeDuration
kExoFlamerhardeningModifier = gExoFlamerhardeningModifier
kExoFlamermaxHardeningValue = gExoFlamermaxHardeningValue
kExoFlamerminHardeningValue = gExoFlamerminHardeningValue

--ExoWelder Settings
gExoWelderDamagePerSecond = 20
gExoWelderPlayerWeldAmount = 15 --15
gExoWelderStructureWeldAmount = 65
gExoWelderStructureWeldRateBreakableDoor = 65
gExoWelderWeldRange = 2 --4
gExoWelderEffectRate = 0.45 --0.45
gExoWelderFireDelay = 0.2
gExoWelderHealScoreAdded = 1
gExoWelderAmountHealedForPoints = 200
gExoWelderSelfWeldAmount = 5
gExoWelderPlayerWeldRate = 0.45 --0.45
gExoWelderStructureWeldRate = 0.2
gExoWelderGetStunnedCooldown = 3

gExoWelderCrouchShrinkAmount = 0 -- 0
gExoWelderExtentsCrouchShrinkAmount = 0 -- 0
gExoWelderMoveSpeedWhileFiringMultipler = 1  --1 = no change in speed. 1.25 = slow by 25% still need to implement
gExoWelderThrusterHorizontalAcceleration = 23 --23
gExoWelderAcceleration = 30 --20
gExoWelderThrustersMinimumFuel = 0.35 -- 0.99
gExoWelderThrustersDuration = 2.0 -- 1.5
gExoWelderThrustersCooldownTime = 2.0 -- 2.5
gExoWelderThrustersDuration = 2.0 -- 1.5
gExoWelderXZExtents = 0.35 -- 0.55
gExoWelderYExtents = 1.0 -- 1.2
gExoWelderUseCatPackCooldown = 6 -- 6

kExoWelderWeldRange = gExoWelderWeldRange
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
kExoWelderDamagePerSecond = gExoWelderDamagePerSecond
kExoWelderHealScoreAdded = gExoWelderHealScoreAdded
kExoWelderAmountHealedForPoints = gExoWelderAmountHealedForPoints
kExoWelderMoveSpeedWhileFiringMultipler = gExoWelderMoveSpeedWhileFiringMultipler
kExoThrusterHorizontalAcceleration = gExoWelderThrusterHorizontalAcceleration
--Exo.kXZExtents = gExoWelderXZExtents
--Exo.kYExtents = gExoWelderYExtents


--ExoDualMinigun Settings
gExoMinigunAcceleration = 20 -- 20
gExoMinigunThrusterHorizontalAcceleration = 23
gExoMinigunMoveSpeedWhileFiringMultipler = 1  --1 = no change in speed. 1.25 = slow by 25%
gExoMinigunXZExtents = 0.55 -- 0.55
gExoMinigunYExtents = 1.2 -- 1.20
gExoMinigunThrustersCooldownTime = 2.0 -- 2.5
gExoMinigunThrustersDuration = 2.0 -- 1.5
gExoMinigunThrustersMinimumFuel = 0.50 -- 0.99
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
gExoRailgunThrustersCooldownTime = 2.0 -- 2.5
gExoRailgunThrustersDuration = 2.0 -- 1.5
gExoRailgunThrustersMinimumFuel = 0.50 -- 0.99
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
gExosuitHealth = 100
gExosuitArmor = 360 --360
gAllExosuitArmorPerUpgradeLevel = 35 --20
gHorizontalThrusterAddSpeed = 2.5
gNanoArmorHealPerSecond = 5 --2
gThrusterHorizontalAcceleration = 23
gExosuitDropCost = 35 --35

gExoClawDamage = 50
gClawDamageType = kDamageType.Structural
gExosuitPointValue = 20



gPrototypeLabBonusHealAuraRange = 1 --def 4
gPrototypeLabBonusHealAuraAmount = 15


kExosuitArmorPerUpgradeLevel = gAllExosuitArmorPerUpgradeLevel
kExosuitArmor = gExosuitArmor
kAllExoArmorPerUpgradeLevel = gAllExosuitArmorPerUpgradeLevel
kAllExoArmor = gExosuitArmor
kAtomReconstructionTime = gAllExoAtomReconstructionTime
--kExoPlayerWeldRate = kExoPlayerWeldRate
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

