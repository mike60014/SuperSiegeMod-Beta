--Global Variables for everything


/////////////Begin Other Configs


--BalanceMisc_Siege.lua


--kJetpackWeightLiftForce =
--kMinWeightJetpackFuelFactor =

kSwipeDamageType = kDamageType.Normal
kGoreDamage = 100


kUmbraEnergyCost = 23

kGorgeCost = 8 --10
kLerkCost = 16 --20
kFadeCost = 32 --40
kOnosCost = 64 --65

kCommEggOnosCost = 90 --default 100
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

kOnocideDamage = 400

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

kExosuitDropCost = 35 -- default 50
kHeavyMachineGunDropCost = 25 --default = 40
kSentryBuildTime = 4 --default 3
kPlayerHallucinationNumFraction = 0.38 --default 0.34

kStartBlinkEnergyCost = 13 --default 14
kBoneShieldArmorPerSecond = 65 --default 112
kMucousShieldPercent = 0.20 --default 0.15


kEggGenerationRate = 9 --default 13
kAlienEggsPerHive = 4 --default 3
--kAlienSpawnTime = 9 --default 10
kHydrasPerHive = 4 --default 3




--kEnzymeCloudDuration = 4 --default 3

kGorgeGestateTime = 7 -- default 7
kLerkGestateTime = 8 -- default 15
kFadeGestateTime = 9 -- default 25
kOnosGestateTime = 10-- default 30



kBioMassOneTime = 20 --default 25
kBioMassTwoTime = 20 --default 40

kHiveMaturationTime = 32 -- default 220
kHarvesterMaturationTime = 12 --default 150
kWhipMaturationTime = 8 -- default 120
kCragMaturationTime = 4 -- default 120
kShiftMaturationTime = 8 -- default 90
kShadeMaturationTime = 4 -- default 120
kCystMaturationTime = 4 --default 45balancehea
kHydraMaturationTime = 8 -- default 140
kEggMaturationTime = 8 -- default 100

kCystBuildTime = 4 --default 5

kChargeResearchTime = 20 --35 --default 40
kLeapResearchTime = 20 --35 --default 40
kBileBombResearchTime = 20 --35 --default 40
kUmbraResearchTime = 20 --38 --default 45
kBoneShieldResearchTime = 20 --35 --default 40
kSporesResearchTime = 20 --28 --default 60
kStompResearchTime = 20 --45 --default 60

kMetabolizeEnergyResearchTime = 20 --35 --default 40
kMetabolizeHealthResearchTime = 20 --35 --default 45

kSentryHealth = 650
kSentryArmor = 125
kSentryPointValue = 3

kExosuitArmorPerUpgradeLevel = 35
kExosuitArmor = 385

kSentryBatteryHealth = 780 --30% increase from 600
kSentryBatteryArmor = 230 --30% increase from 200

kMinMatureCystHealth = 200 --250 --default 200
kCystHealth = 100 --150 --default 30
kMatureCystArmor = 150 --30 --default 0
kMatureCystHealth = 350 --500 --default 450

kOnosHealtPerBioMass = 31 //Investigate typo

kEggBeaconMaxHealth = 715
kEggBeaconMaxArmor = 200


kEggHealth = 500
kEggArmor = 0
kEggPointValue = 2
kMatureEggHealth = 650
kMatureEggArmor = 0


kArmoryHealth = 2000
kArmoryArmor = 500
kArmoryPointValue = 6
kAdvancedArmoryHealth = 3500
kAdvancedArmoryArmor = 750
kAdvancedArmoryPointValue = 11

kNumWebsPerGorge = 6
kChargeEnergyCost = 20 --def 20


kLerkFlapEnergyCost = 1

kHallucinationHealthFraction = 0.25 --default 0.20
kHallucinationArmorFraction = 0.10 -- default 0
kHallucinationMaxHealth = 725 -- default 700

--kNumMines 3 -- default 2
--kEggsPerHatch = 4 -- default 2


kDrifterSupply = 5 --default 10


kHiveInfestationRadius = 8

kMACSupply = 5
kSentrySupply = 2

////Final Configs
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



--Alien Abilities
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
gCreditPlayerTeamOneBuyDelay = 10
gCreditPlayerTeamOneCreditCost = 1
gCreditPlayerTeamOneLimit = 3

gCreditPlayerEnergyCost = 0

--Credit Team 2
gCreditPlayerTeamTwoBuyDelay = 10
gCreditPlayerTeamTwoCreditCost = 2
gCreditPlayerTeamTwoLimit = 3
--KPlayerCreditTeamOne

kCreditCommReward = 10



--Credits End

gMaxEntitiesInRadius = 300 --99
gMaxEntityRadius = 100 --99

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

gAliennewMaxHealthMultipler = 1 --1.10


--Alien Upgrades

gEggBeaconArmor = 150
gEggBeaconBuildTime = 8
gEggBeaconCost = 10
gEggBeaconCoolDown = 12
gEggBeaconHealth = 480
gEggBeaconMaxHealth = 715
gEggBeaconMaxArmor = 200

kMatureEggHealth = 400
kMatureEggArmor = 250
kEggHealth = 300
kEggArmor = 150
kEggPointValue = 2


--Alien Vortex
gCommVortexCoolDown = 20
gCommVortexCost = 8



--Alien Buildings


gAlienStructureMoveSpeed = 3 --1.5


kAlienStructureMoveSpeed = gAlienStructureMoveSpeed

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




--Babbler
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


--Skulk Settings


gSkulkMaxMovementSpeed = 9 --7.25
gSkulkLeapForce = 10 --7.6
gSkulkLeapVerticalForce = 16 --10.8
gSkulkLeapTime = 0.5 --0.2
gSneakSpeedModifier = 0.75 --0.66
gSkulkViewOffsetHeight = 0.55
gSkulkMass = 35 --  45=~100 pounds
gSkulkNormalWallWalkFeelerSize = 0.25
gSkulkNormalWallWalkRange = 0.3
gSkulkJumpWallFeelerSize = 0.1
gSkulkJumpWallRange = 1 --0.4
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
gSkulkHealthPerBioMass = 0 --10

gSkulkAcceleration = 13
gSkulkAirAcceleration =  9
gSkulkAirControl = 27
gSkulkGroundTransistionTime = 0.1
--gSkulkAirFriction = 0.055 - (GetHasCelerityUpgrade(self) and GetSpurLevel(self:GetTeamNumber()) or 0) * 0.009
gSkulkGroundFriction = 11
gSkulkIsSmallTarget = true



gSkulkUpgradeCost = 0
gXenocideResearchTime = 5 --35 --default 60

kXenocideResearchTime = gXenocideResearchTime
kSkulkUpgradeCost = gSkulkUpgradeCost
kSkulkHealthPerBioMass = gSkulkHealthPerBioMass


--Skulk Abilities

gSkulkXenocidePlayerDamage = 75
gSkulkXenocideStructureDamage = 220
gSkulkXenocideLeapGetHUDSlot = 3
gSkulkXenocideDetonateTime = 2.0
gSkulkXenocideRadiusRange = 1.4
gSkulkXenocideDistanceFraction = 1 --unused/
gXenocideDamageType = kDamageType.Structural


kXenocideRange = gSkulkXenocideRadiusRange
kXenocideDamage = gXenocideDamage
kXenocideDamageType = gXenocideDamageType
 


--Skulk End
--Gorge Settings


gGorgeArmorTunnelDamagePerSecond = 10
gTunnelEntranceArmor = kTunnelEntranceArmor
gTunnelEntranceHealth = kTunnelEntranceHealth
gTunnelEntrancePointValue = kTunnelEntrancePointValue
gTunnelEntranceMaturationTime = 4 -- 135


kGorgeArmorTunnelDamagePerSecond = gGorgeArmorTunnelDamagePerSecond
kTunnelEntranceArmor = gTunnelEntranceArmor
kTunnelEntranceHealth = gTunnelEntranceHealth
kTunnelEntrancePointValue = gTunnelEntrancePointValue
kTunnelEntranceMaturationTime = gTunnelEntranceMaturationTime

--Gorge Abilities

gSpitDamage = 30
gSpitDamageType = kDamageType.Light
gSpitEnergyCost = 7


kSpitDamage = gSpitDamage
kSpitDamageType = gSpitDamageType
kSpitEnergyCost = gSpitEnergyCost


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

kWebBuildCost = 0
kWebbedDuration = 1.5
kWebbedParasiteDuration = 10
kWebSlowVelocityScalar = 0.75 --Note: Exos override this
--Gorge End
--Lerk Settings


kUmbraEnergyCost = 27
kUmbraMaxRange = 17
kUmbraDuration = 4
kUmbraRadius = 4

kUmbraShotgunModifier = 0.75
kUmbraBulletModifier = 0.75
kUmbraMinigunModifier = 0.75
kUmbraRailgunModifier = 0.75

--Lerk Abilities

--gLerkBileBombResearchCost = 10
--gLerkBileBombResearchTime = 10

kSpikeMaxDamage = 7
kSpikeMinDamage = 7
kSpikeDamageType = kDamageType.Puncture
kSpikeEnergyCost = 1.4
kSpikesAttackDelay = 0.07
kSpikeMinDamageRange = 9
kSpikeMaxDamageRange = 2
kSpikesRange = 50
kSpikesPerShot = 1

kSporesDamageType = kDamageType.Gas
kSporesDustDamagePerSecond = 15
kSporesDustFireDelay = 0.36
kSporesMaxRange = 17
kSporesDustEnergyCost = 27
kSporesDustCloudRadius = 4
kSporesDustCloudLifetime = 4


kPrimalScreamEnergyCost = 20
kPrimalScreamROF = 1
kPrimalScreamPlayerPointBonus = 0.3

--Lerk End

--Fade Settings

gFadePrimaryAttackSpeedMultipler = 1 --Increase to slow attack
gFadePrimaryAttackSpeedOnFireMultipler = 1.25 --Increase to slow attack while onfire
kFadeArmor = 104 --30% increase from 80
kFadeArmorFullyUpgradedAmount = 156 --30% increase from 120
gFadeRedemptionCooldown = 20
gFadeRebirthLength = 4
gFadeXZExtents = 0.4
gFadeYExtents = 1.05

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


--Onos abilities
--gOnosStompBoneWallDuration = 2 --4
gOnocideDetonateTime = 2.0
gOnocideDetonateRange = 10
gOnosStunWallLifeSpan = 3
gOnosStunWallHealth = 200
gOnosHealtPerBioMass = 31

gGoreDamage = 100 --90
gGoreDamageType = kDamageType.Structural
gGoreEnergyCost = 10

gBoneShieldDamageReduction = 0.5
gBoneShieldCooldown = 12.5
gBoneShieldInitialEnergyCost = 20
gBoneShieldSustainCost = 0 -- not yet implemented
gBoneShieldHealPerSecond = 0
gBoneShieldArmorPerSecond = 112.25
gBoneShieldMaxDuration = 4
gBoneShieldMoveFraction = 0
gBoneShieldMinimumFuel = 0.9 -- otherwise you can trigger it for a frame and it feels bad
gBoneShieldPreventEnergize = false
gBoneShieldPreventRecuperation = false

gStompEnergyCost = 30
gStompDamageType = kDamageType.Heavy
gStompDamage = 40
gStompRange = 12
gDisruptMarineTime = 2
gDisruptMarineTimeout = 4

kOnocideDetonateTime = gOnocideDetonateTime
kOnocideDetonateRange = gOnocideDetonateRange
kOnosStunWallLifeSpan = gOnosStunWallLifeSpan
kOnosStunWallHealth = gOnosStunWallHealth
kOnosHealtPerBioMass = gOnosHealtPerBioMass

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


//////////////Marines Settings Start
--Marine Settings

kMarineDefAddXp = 0.5
kMarineDefLvl = 25

kMarineStunImmuneTime = 2

--kMaxTimeToSprintAfterAttack = 1?


kShotgunFireRate = 0.75 --default 0.88




--kMarineRespawnTime = 8 --default 9


--Marine Weapons

--Rifle

gRifleAddClipSize = 25
gRifleClipSize = kRifleClipSize + gRifleAddClipSize

--HMG
kHeavyMachineGunWeight = 0.20 -- default 0.26


--Axe
kAxeDamage = 25
kAxeDamageType = kDamageType.Structural
gAxeHUDSlot = 3 --6
gAxeRange = 1.5
gAxeFloorRange = 1
--gAxePrimaryAttackDelay =
gAxeSecondaryAttackDelay = 1
--gAxe = 0
--gAxe = 0
--gAxe = 0

--GrenadeLauncher
kGrenadeLauncherGrenadeDamage = 125 --165
kGrenadeLauncherGrenadeDamageType = kDamageType.GrenadeLauncher
kGrenadeLauncherClipSize = 4
kGrenadeLauncherGrenadeDamageRadius = 4.8
kGrenadeLifetime = 2.0
kGrenadeUpgradedLifetime = 1.5



--Flame

gFlameUpdateTime = 0.6
gBurnDamagePerSecond = 5--2
gBurnDamagePerStackPerSecond = 5 --3
gCompoundFireDamageDelay = 1 --2
gCompundFireDamageScalar = 1 --
gFlameRadius = 1.8


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

--Flame.kDamageRadius = 1.8
--Flame.kLifeTime = 5.6
--Flame.kDamage = 8



--Shotgun

gShotgunBulletSize = 0.05 --0.016
gShotgunClipSize = 8 --default 6

gShotgunPrimaryBulletSize = 0.016
kShotgunPrimaryDamage = 16
gShotgunPrimaryAttackSpeed = 0.88
gShotgunPrimaryBulletClipCost = 1
gShotgunPrimaryBulletFiredCount = 10
gShotgunPrimaryDamageType = kDamageType.Normal
gShotgunPrimaryEffectRange = 5
gShotgunPrimarySpreadDistance = 16

gShotgunSecondaryBulletSize = 0.016
gShotgunSecondaryDamage = 16
gShotgunSecondaryAttackSpeed = 0.88
gShotgunSecondaryBulletClipCost = 1
gShotgunSecondaryBulletFiredCount = 10
gShotgunSecondaryDamageType = kDamageType.Normal
gShotgunSecondaryEffectRange = 5
gShotgunSecondarySpreadDistance = 32 --Higher number means closer spread


kShotgunFireRate = gShotgunPrimaryAttackSpeed
kShotgunDamage = kShotgunPrimaryDamage
kShotgunDamageType = gShotgunPrimaryDamageType
kShotgunClipSize = gShotgunClipSize
kShotgunBulletsPerShot = gShotgunPrimaryBulletFiredCount
kShotgunSpreadDistance = 8.5 --Gets used as z-axis value for spread vectors before normalization

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
kJetpackReplenishFuelRate = .14 -- .11 to .14 %30 increase
kJetpackUseFuelRate = 0.147 -- 30% decrease from .21
kJetpackFuelReplenishDelay = 0.1


--JumpPack
--kJumpPackCost = 7

--Marine Classes End
//Marine Buildings --Marine Buildings
--AdvBeacon
kAdvancedBeaconCost = 13

--Armory
kArmoryHealth = 2000
kArmoryArmor = 500
kArmoryPointValue = 6
kArmoryLvl = 75
kArmoryAddXp = 1

--Adv Armory
kAdvancedArmoryHealth = 3500
kAdvancedArmoryArmor = 750
kAdvancedArmoryPointValue = 11
--BackupLight

gBackupLightSetInnerCone = 30
gBackupLightSetOuterCone = 45
gBackupLightSetIntensity = 25
gBackupLightSetRadius = 15
gBackupLightSetAtmosphericDensity = 0.2


--BreakableDoor

gBreakableDoorHealth = 4000
--gBreakableDoor

--Sentry
kSentrySupply = 2
kSentryHealth = 650
kSentryArmor = 125
kSentryPointValue = 3
kCommSentryPerRoom = 6

--Battery
kBatteryPowerRange = 4

--InfrantryPortal
kInfantryPortalMaxLevel = 25
kInfantryPortalXPGain = 0.5

--Mac
kMacMaxLevel = 50
gMacMaxAmount = 12

--Arc
gArcMaxAmount = 12
gArcTurnSpeed = math.pi / 2 -- an ARC turns slowly
gArcMaxSpeedLimitAngle = math.pi / 36 -- 5 degrees
gArcNoSpeedLimitAngle = math.pi / 4 -- 24 degrees
gArcHealth                 = kARCHealth
gArcStartDistance          = 4
gArcAttackDamage           = kARCDamage
gArcFireRange              = kARCRange         -- From NS1
gArcMinFireRange           = kARCMinRange
gArcAttackSplashRadius     = 7
gArcUpgradedSplashRadius   = 13
gArcMoveSpeed              = 2.0
gArcCombatMoveSpeed        = 0.8
gArcFov                    = 360
gArcBarrelMoveRate         = 100
gArcMaxPitch               = 45
gArcMaxYaw                 = 180
gArcCapsuleHeight = .05
gArcCapsuleRadius = .5


////Exosuit Settings
--Exos


--ExoFlamer
kExoFlamerConeWidth = 0.25 --0.17
kExoFlamerCoolDownRate = 0.25 --0.24
kExoFlamerDamage = 10 --23
kExoFlamerDamageLength = 6 --6
kExoFlamerDamageLevels = 5 --3 WIP
kExoFlamerDamageOverTimePerLevel = 10  --5 WIP
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
gExoWelderDamagePerSecond = 20
--gExoWelderFireAmount = 0
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

kAcceleration = gExoWelderAcceleration
kExoWelderDamagePerSecond = gExoWelderDamagePerSecond
kExoWelderHealScoreAdded = gExoWelderHealScoreAdded
kExoWelderAmountHealedForPoints = gExoWelderAmountHealedForPoints
kExoWelderMoveSpeedWhileFiringMultipler = gExoWelderMoveSpeedWhileFiringMultipler
kExoThrusterHorizontalAcceleration = gExoWelderThrusterHorizontalAcceleration
--Exo.kXZExtents = gExoWelderXZExtents
--Exo.kYExtents = gExoWelderYExtents


--ExoDualMinigun
gExoMinigunThrusterHorizontalAcceleration = 23
kExoMinigunMoveSpeedWhileFiringMultipler = 1  --1 = no change in speed. 1.25 = slow by 25%

--ExoDualRailgun
gExoRailgunThrusterHorizontalAcceleration = 23
gExoRailgunMoveSpeedWhileFiringMultipler = 1  --1 = no change in speed. 1.25 = slow by 25%


kExoRailgunMoveSpeedWhileFiringMultipler = gExoRailgunMoveSpeedWhileFiringMultipler
kRailgunDamage = 33
kRailgunChargeDamage = 140
kRailgunDamageType = kDamageType.Structural

--AllExo Settings


gNanoArmorHealPerSecond = 5 --2
gAllExoSmashEggRange = 1.5
gAllExoWalkMaxSpeed = 3.7
gAllExoMaxSpeed = 5.75
gAllExoViewOffsetHeight = 2.3
gAllExoThrusterUpwardsAcceleration = 2
gHorizontalThrusterAddSpeed = 2.5
gThrusterHorizontalAcceleration = 23
--gAllExoPlayerWeldRate = 15

gAllExoAtomReconstructionTime = 3

kAtomReconstructionTime = gAllExoAtomReconstructionTime

kExoPlayerWeldRate = kExoPlayerWeldRate
kSmashEggRange = gAllExoSmashEggRange

--kHorizontalThrusterAddSpeed = gHorizontalThrusterAddSpeed
--kThrusterUpwardsAcceleration = gAllExoThrusterUpwardsAcceleration
--kWalkMaxSpeed = gAllExoWalkMaxSpeed
--kViewOffsetHeight = gAllExoViewOffsetHeight
--kMaxSpeed = gAllExoMaxSpeed
--kThrusterHorizontalAcceleration = gThrusterHorizontalAcceleration

gPrototypeLabBonusHealAuraRange = 1 --def 4
gPrototypeLabBonusHealAuraAmount = 15
kPrototypeLabBonusHealAuraRange = gPrototypeLabBonusHealAuraRange
kPrototypeLabBonusHealAuraAmount = gPrototypeLabBonusHealAuraAmount

kDualExosuitCost = 35 -- default 45

gExoClawDamage = 50
gClawDamageType = kDamageType.Structural

kClawDamage = gExoClawDamage
kClawDamageType = gClawDamageType

kDualRailgunExosuitCost = 35 --default 45
gExoMinigunAcceleration = 20 -- 20
gExoRailgunAcceleration = 20 -- 20
gExoFlamerAcceleration = 20 -- 20
gExoWelderAcceleration = 20 -- 20

gExoMinigunGetStunnedCooldown = 3
gExoRailgunGetStunnedCooldown = 3
gExoFlamerGetStunnedCooldown = 3

gExoMinigunUseCatPackCooldown = 6 -- 6
gExoRailgunUseCatPackCooldown = 6 -- 6
gExoFlamerUseCatPackCooldown = 6 -- 6


/*

gExoMinigun
gExoRailgun
gExoFlamer
gExoWelder

*/

gExoMinigunXZExtents = 0.55 -- 0.55
gExoRailgunXZExtents = 0.55 -- 0.55
gExoFlamerXZExtents = 0.55 -- 0.55

gExoMinigunYExtents = 1.2 -- 1.20
gExoRailgunYExtents = 1.2 -- 1.20
gExoFlamerYExtents = 1.2 -- 1.20

gExoMinigunThrustersCooldownTime = 2.0 -- 2.5
gExoRailgunThrustersCooldownTime = 2.0 -- 2.5
gExoFlamerThrustersCooldownTime = 2.0 -- 2.5

gExoMinigunThrustersDuration = 2.0 -- 1.5
gExoRailgunThrustersDuration = 2.0 -- 1.5
gExoFlamerThrustersDuration = 2.0 -- 1.5

gExoMinigunThrustersMinimumFuel = 0.50 -- 0.99
gExoRailgunThrustersMinimumFuel = 0.50 -- 0.99
gExoFlamerThrustersMinimumFuel = 0.50 -- 0.99

gExoMinigunCrouchShrinkAmount = 0 -- 0
gExoRailgunCrouchShrinkAmount = 0 -- 0
gExoFlamerCrouchShrinkAmount = 0 -- 0
gExoWelderCrouchShrinkAmount = 0 -- 0

gExoMinigunExtentsCrouchShrinkAmount = 0 -- 0
gExoRailgunExtentsCrouchShrinkAmount = 0 -- 0
gExoFlamerExtentsCrouchShrinkAmount = 0 -- 0
gExoWelderExtentsCrouchShrinkAmount = 0 -- 0


--kHealthWarningTrigger
--kHealthCriticalTrigger

gAllExoHealthWarningTrigger = 0.4
gAllExoHealthCriticalTrigger = 0.2


gAllExoDeployDuration = 1.0
gAllExoEjectDuration = 1.0
gAllExoCloseDuration = 1.0 --1.8?
kAllExoArmorPerUpgradeLevel = 25 --20
kAllExoArmor = 360
--gAllExoThrusterHorizontalAcceleration =



kObsAdvBeaconPowerOff = 16 --12 w/ lvl 25
--kAdvBeacTechCost = 15
--kAdvBeacTechTime = 30

