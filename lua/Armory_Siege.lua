
Script.Load("lua/Mixins/ClientModelMixin.lua")
Script.Load("lua/LiveMixin.lua")
Script.Load("lua/PointGiverMixin.lua")
Script.Load("lua/AchievementGiverMixin.lua")
Script.Load("lua/GameEffectsMixin.lua")
Script.Load("lua/SelectableMixin.lua")
Script.Load("lua/FlinchMixin.lua")
Script.Load("lua/LOSMixin.lua")
Script.Load("lua/CorrodeMixin.lua")
Script.Load("lua/ConstructMixin.lua")
Script.Load("lua/ResearchMixin.lua")
Script.Load("lua/RecycleMixin.lua")
Script.Load("lua/CommanderGlowMixin.lua")

Script.Load("lua/ScriptActor.lua")
Script.Load("lua/RagdollMixin.lua")
Script.Load("lua/NanoShieldMixin.lua")
Script.Load("lua/ObstacleMixin.lua")
Script.Load("lua/WeldableMixin.lua")
Script.Load("lua/UnitStatusMixin.lua")
Script.Load("lua/DissolveMixin.lua")
Script.Load("lua/PowerConsumerMixin.lua")
Script.Load("lua/GhostStructureMixin.lua")
Script.Load("lua/MapBlipMixin.lua")
Script.Load("lua/VortexAbleMixin.lua")
Script.Load("lua/CombatMixin.lua")
Script.Load("lua/InfestationTrackerMixin.lua")
Script.Load("lua/SupplyUserMixin.lua")
Script.Load("lua/IdleMixin.lua")
Script.Load("lua/ParasiteMixin.lua")
Script.Load("lua/Additions/LevelsMixin.lua")
Script.Load("lua/Additions/AvocaMixin.lua")


class 'Armory' (ScriptActor)
class 'AdvancedArmory' (Armory)
class 'ArmoryAddon' (ScriptActor)


AdvancedArmory.kMapName = "advancedarmory"
ArmoryAddon.kMapName = "ArmoryAddon"
Armory.kMapName = "armory"
Armory.kModelName = PrecacheAsset("models/marine/armory/armory.model")

local kAnimationGraph = PrecacheAsset("models/marine/armory/armory.animation_graph")

-- Looping sound while using the armory
Armory.kResupplySound = PrecacheAsset("sound/NS2.fev/marine/structures/armory_resupply")
Armory.kArmoryBuyMenuUpgradesTexture = "ui/marine_buymenu_upgrades.dds"
Armory.kAttachPoint = "Root"
Armory.kAdvancedArmoryChildModel = PrecacheAsset("models/marine/advanced_armory/advanced_armory.model")
Armory.kAdvancedArmoryAnimationGraph = PrecacheAsset("models/marine/advanced_armory/advanced_armory.animation_graph")
Armory.kBuyMenuFlash = "ui/marine_buy.swf"
Armory.kBuyMenuTexture = "ui/marine_buymenu.dds"
Armory.kBuyMenuUpgradesTexture = "ui/marine_buymenu_upgrades.dds"
Armory.kHealAmount = gArmoryHealAmount
Armory.kResupplyInterval = gArmoryResupplyInterval
gArmoryHealthHeight = 1.4
-- Players can use menu and be supplied by armor inside this range
Armory.kResupplyUseRange = gArmoryResupplyUseRange
kArmoryArmorHealAmount = gArmoryArmorHealAmount

local kHealthIndicatorModelName = PrecacheAsset("models/marine/armory/health_indicator.model")
local kLoginAndResupplyTime = gArmoryLoginAndResupplyTime
	
if Server then
    Script.Load("lua/Armory_Server.lua")
elseif Client then
    Script.Load("lua/Armory_Client.lua")
end

local networkVars =
{
    -- How far out the arms are for animation (0-1)
    loggedInEast     = "boolean",
    loggedInNorth    = "boolean",
    loggedInSouth    = "boolean",
    loggedInWest     = "boolean",
    deployed         = "boolean"
}


AddMixinNetworkVars(AvocaMixin, networkVars)
AddMixinNetworkVars(LevelsMixin, networkVars)
AddMixinNetworkVars(BaseModelMixin, networkVars)
AddMixinNetworkVars(ClientModelMixin, networkVars)
AddMixinNetworkVars(LiveMixin, networkVars)
AddMixinNetworkVars(GameEffectsMixin, networkVars)
AddMixinNetworkVars(FlinchMixin, networkVars)
AddMixinNetworkVars(TeamMixin, networkVars)
AddMixinNetworkVars(LOSMixin, networkVars)
AddMixinNetworkVars(CorrodeMixin, networkVars)
AddMixinNetworkVars(ConstructMixin, networkVars)
AddMixinNetworkVars(ResearchMixin, networkVars)
AddMixinNetworkVars(RecycleMixin, networkVars)
AddMixinNetworkVars(SelectableMixin, networkVars)

AddMixinNetworkVars(NanoShieldMixin, networkVars)
AddMixinNetworkVars(ObstacleMixin, networkVars)
AddMixinNetworkVars(DissolveMixin, networkVars)
AddMixinNetworkVars(PowerConsumerMixin, networkVars)
AddMixinNetworkVars(GhostStructureMixin, networkVars)
AddMixinNetworkVars(VortexAbleMixin, networkVars)
AddMixinNetworkVars(CombatMixin, networkVars)
AddMixinNetworkVars(IdleMixin, networkVars)
AddMixinNetworkVars(ParasiteMixin, networkVars)

function Armory:OnCreate()

    ScriptActor.OnCreate(self)
    
    InitMixin(self, BaseModelMixin)
    InitMixin(self, ClientModelMixin)
    InitMixin(self, LiveMixin)
    InitMixin(self, GameEffectsMixin)
    InitMixin(self, FlinchMixin)
    InitMixin(self, TeamMixin)
    InitMixin(self, PointGiverMixin)
    InitMixin(self, AchievementGiverMixin)
    InitMixin(self, SelectableMixin)
    InitMixin(self, EntityChangeMixin)
    InitMixin(self, LOSMixin)
    InitMixin(self, CorrodeMixin)
    InitMixin(self, ConstructMixin)
    InitMixin(self, ResearchMixin)
    InitMixin(self, RecycleMixin)
    InitMixin(self, RagdollMixin)
    InitMixin(self, ObstacleMixin)
    InitMixin(self, DissolveMixin)
    InitMixin(self, GhostStructureMixin)
    InitMixin(self, VortexAbleMixin)
    InitMixin(self, CombatMixin)
    InitMixin(self, PowerConsumerMixin)
    InitMixin(self, ParasiteMixin)
	InitMixin(self, AvocaMixin)
    
    if Client then
        InitMixin(self, CommanderGlowMixin)
    end

    self:SetLagCompensated(false)
    self:SetPhysicsType(PhysicsType.Kinematic)
    self:SetPhysicsGroup(PhysicsGroup.BigStructuresGroup)
    
    -- False if the player that's logged into a side is only nearby, true if
    -- the pressed their key to open the menu to buy something. A player
    -- must use the armory once "logged in" to be able to buy anything.
    self.loginEastAmount = 0
    self.loginNorthAmount = 0
    self.loginWestAmount = 0
    self.loginSouthAmount = 0
    
    self.timeScannedEast = 0
    self.timeScannedNorth = 0
    self.timeScannedWest = 0
    self.timeScannedSouth = 0
    
    self.deployed = false
    
end

function Armory:GetMaxLevel()
	return kArmoryLvl
end

function Armory:GetAddXPAmount()
	return kArmoryAddXp
end

-- Check if friendly players are nearby and facing armory and heal/resupply them
local function LoginAndResupply(self)

   self:UpdateLoggedIn()
   --Armory:UpdateLoggedIn()
    
    -- Make sure players are still close enough, alive, marines, etc.
    -- Give health and ammo to nearby players.
    if GetIsUnitActive(self) then
        --self:ResupplyPlayer() --self:ResupplyPlayers()
        Armory:ResupplyPlayers() --self:ResupplyPlayers()
    end
    
    return true
    
end

function Armory:OnInitialized()
    ScriptActor.OnInitialized(self)
    
    self:SetModel(Armory.kModelName, kAnimationGraph)
    
    InitMixin(self, WeldableMixin)
    InitMixin(self, NanoShieldMixin)

    if Server then    
    
        self.loggedInArray = { false, false, false, false }
        
        -- Use entityId as index, store time last resupplied
        self.resuppliedPlayers = { }

        self:AddTimedCallback(LoginAndResupply, kLoginAndResupplyTime)
        
        -- This Mixin must be inited inside this OnInitialized() function.
        if not HasMixin(self, "MapBlip") then
            InitMixin(self, MapBlipMixin)
        end
        
        InitMixin(self, StaticTargetMixin)
        InitMixin(self, InfestationTrackerMixin)
        InitMixin(self, SupplyUserMixin)
        
    elseif Client then
    
        self:OnInitClient()        
        InitMixin(self, UnitStatusMixin)
        InitMixin(self, HiveVisionMixin)
        
    end
    
    InitMixin(self, IdleMixin)
    
end

function Armory:GetCanBeUsed(player, useSuccessTable)

    if player:isa("Exo") then
        useSuccessTable.useSuccess = false
    end
    
end

function Armory:GetCanBeUsedConstructed(byPlayer)
    return not byPlayer:isa("Exo")
end    

function Armory:GetRequiresPower()
    return true
end

function Armory:GetTechIfResearched(buildId, researchId)

    local techTree = nil
    if Server then
        techTree = self:GetTeam():GetTechTree()
    else
        techTree = GetTechTree()
    end
    ASSERT(techTree ~= nil)
    
    -- If we don't have the research, return it, otherwise return buildId
    local researchNode = techTree:GetTechNode(researchId)
    ASSERT(researchNode ~= nil)
    ASSERT(researchNode:GetIsResearch())
    return ConditionalValue(researchNode:GetResearched(), buildId, researchId)
    
end

function Armory:GetTechButtons(techId)

    local techButtons = nil

    techButtons = { kTechId.ShotgunTech, kTechId.MinesTech, kTechId.GrenadeTech, kTechId.None,
                    kTechId.None, kTechId.None, kTechId.None, kTechId.None }

    -- Show button to upgraded to advanced armory
    if self:GetTechId() == kTechId.Armory and self:GetResearchingId() ~= kTechId.AdvancedArmoryUpgrade then
        techButtons[kMarineUpgradeButtonIndex] = kTechId.AdvancedArmoryUpgrade
    else
        techButtons[kMarineUpgradeButtonIndex] = kTechId.HeavyMachineGunTech
    end

    return techButtons
    
end

function Armory:GetTechAllowed(techId, techNode, player)

    local allowed, canAfford = ScriptActor.GetTechAllowed(self, techId, techNode, player)
    
    if techId == kTechId.HeavyRifleTech then
        allowed = allowed and self:GetTechId() == kTechId.AdvancedArmory
    end
    
    return allowed, canAfford

end

function Armory:OnUpdatePoseParameters()

    if GetIsUnitActive(self) and self.deployed then
        
        if self.loginNorthAmount then
            self:SetPoseParam("log_n", self.loginNorthAmount)
        end
        
        if self.loginSouthAmount then
            self:SetPoseParam("log_s", self.loginSouthAmount)
        end
        
        if self.loginEastAmount then
            self:SetPoseParam("log_e", self.loginEastAmount)
        end
        
        if self.loginWestAmount then
            self:SetPoseParam("log_w", self.loginWestAmount)
        end
        
        if self.scannedParamValue then
        
            for extension, value in pairs(self.scannedParamValue) do
                self:SetPoseParam("scan_" .. extension, value)
            end
            
        end
        
    end
    
end

local function UpdateArmoryAnim(self, extension, loggedIn, scanTime, timePassed)

    local loggedInName = "log_" .. extension
    local loggedInParamValue = ConditionalValue(loggedIn, 1, 0)

    if extension == "n" then
        self.loginNorthAmount = Clamp(Slerp(self.loginNorthAmount, loggedInParamValue, timePassed * 2), 0, 1)
    elseif extension == "s" then
        self.loginSouthAmount = Clamp(Slerp(self.loginSouthAmount, loggedInParamValue, timePassed * 2), 0, 1)
    elseif extension == "e" then
        self.loginEastAmount = Clamp(Slerp(self.loginEastAmount, loggedInParamValue, timePassed * 2), 0, 1)
    elseif extension == "w" then
        self.loginWestAmount = Clamp(Slerp(self.loginWestAmount, loggedInParamValue, timePassed * 2), 0, 1)
    end
    
    local scannedName = "scan_" .. extension
    self.scannedParamValue = self.scannedParamValue or { }
    self.scannedParamValue[extension] = ConditionalValue(scanTime == 0 or (Shared.GetTime() > scanTime + 3), 0, 1)
    
end

function Armory:OnUpdate(deltaTime)

    if Client then
        self:UpdateArmoryWarmUp()
    end
    
    if GetIsUnitActive(self) and self.deployed then
    
        -- Set pose parameters according to if we're logged in or not
        UpdateArmoryAnim(self, "e", self.loggedInEast, self.timeScannedEast, deltaTime)
        UpdateArmoryAnim(self, "n", self.loggedInNorth, self.timeScannedNorth, deltaTime)
        UpdateArmoryAnim(self, "w", self.loggedInWest, self.timeScannedWest, deltaTime)
        UpdateArmoryAnim(self, "s", self.loggedInSouth, self.timeScannedSouth, deltaTime)
        
    end
    
    ScriptActor.OnUpdate(self, deltaTime)
    
end

function Armory:GetReceivesStructuralDamage()
    return true
end

function Armory:GetDamagedAlertId()
    return kTechId.MarineAlertStructureUnderAttack
end

function Armory:GetItemList(forPlayer)
    
    local itemList = {
        kTechId.Welder,
        kTechId.Shotgun,
        kTechId.LayMines, 
        kTechId.ClusterGrenade,
        kTechId.GasGrenade,
        kTechId.PulseGrenade
    }
    
    if self:GetTechId() == kTechId.AdvancedArmory then
    
        itemList = {
            kTechId.Shotgun,
            kTechId.HeavyMachineGun,
            kTechId.GrenadeLauncher,
            kTechId.Flamethrower,
            kTechId.LayMines,
            kTechId.ClusterGrenade,
            kTechId.GasGrenade,
            kTechId.PulseGrenade,
            kTechId.Welder
        }
        
    end
    
    return itemList
    
end


function Armory:GetHealthbarOffset()
    return gArmoryHealthHeight
end 

local addonNetworkVars ={
    -- required for smoother raise animation
    creationTime = "float"
}

AddMixinNetworkVars(BaseModelMixin, addonNetworkVars)
AddMixinNetworkVars(ClientModelMixin, addonNetworkVars)
AddMixinNetworkVars(TeamMixin, addonNetworkVars)

function ArmoryAddon:OnCreate()
    ScriptActor.OnCreate(self)
    InitMixin(self, BaseModelMixin)
    InitMixin(self, ClientModelMixin)
    InitMixin(self, TeamMixin)
    
    if Server then self.creationTime = Shared.GetTime() end
    gArmoryHealthHeight = 1.7
    
end

function ArmoryAddon:OnInitialized()

    ScriptActor.OnInitialized(self)
    
    self:SetModel(Armory.kAdvancedArmoryChildModel, Armory.kAdvancedArmoryAnimationGraph)
    
end

function ArmoryAddon:OnDestroy()

    ScriptActor.OnDestroy(self)
    
    gArmoryHealthHeight = 1.4
    
end

function ArmoryAddon:OnUpdatePoseParameters()

    PROFILE("ArmoryAddon:OnUpdatePoseParameters")
    
    local researchProgress = Clamp((Shared.GetTime() - self.creationTime) / kAdvancedArmoryResearchTime, 0, 1)
    self:SetPoseParam("spawn", researchProgress)
    
end

function ArmoryAddon:OnUpdateAnimationInput(modelMixin)

    PROFILE("ArmoryAddon:OnUpdateAnimationInput")
    
    local parent = self:GetParent()
    if parent then
        modelMixin:SetAnimationInput("built", parent:GetTechId() == kTechId.AdvancedArmory)        
    end

end

function ArmoryAddon:OnGetIsVisible(visibleTable, viewerTeamNumber)

    local parent = self:GetParent()
    if parent then
        visibleTable.Visible = parent:GetIsVisible()
    end
    
end


if Client then

	local kHealthIndicatorModelName = PrecacheAsset("models/marine/armory/health_indicator.model")

	function GetResearchPercentage(techId)

		local techNode = GetTechTree():GetTechNode(techId)
		
		if(techNode ~= nil) then
		
			if(techNode:GetAvailable()) then
				return 1
			elseif(techNode:GetResearching()) then
				return techNode:GetResearchProgress()
			end    
			
		end
		
		return 0
		
	end

	function Armory_Debug()
		-- Draw armory points
		local indexToUseOrigin = {
			Vector(Armory.kResupplyUseRange, 0, 0), Vector(0, 0, Armory.kResupplyUseRange), Vector(-Armory.kResupplyUseRange, 0, 0), Vector(0, 0, -Armory.kResupplyUseRange)
		}
		local indexToColor = {
			Vector(1, 0, 0), Vector(0, 1, 0), Vector(0, 0, 1), Vector(1, 1, 1)
		}
		function isaArmory(entity) return entity:isa("Armory") end
		
		for index, armory in ientitylist(Shared.GetEntitiesWithClassname("Armory")) do
		
			local startPoint = armory:GetOrigin()
			
			for loop = 1, 4 do
				
				local endPoint = startPoint + indexToUseOrigin[loop]
				local color = indexToColor[loop]
				DebugLine(startPoint, endPoint, .2, color.x, color.y, color.z, 1)
				
			end
			
		end
		
	end

	function Armory:OnInitClient()

		if not self.clientConstructionComplete then
			self.clientConstructionComplete = self.constructionComplete
		end    


	end

	function Armory:GetWarmupCompleted()
		return not self.timeConstructionCompleted or (self.timeConstructionCompleted + 0.7 < Shared.GetTime())
	end

	function Armory:OnUse(player, elapsedTime, useSuccessTable)

		self:UpdateArmoryWarmUp()
		
		if GetIsUnitActive(self) and not Shared.GetIsRunningPrediction() and not player.buyMenu and self:GetWarmupCompleted() then
		
			if Client.GetLocalPlayer() == player then
			
				Client.SetCursor("ui/Cursor_MarineCommanderDefault.dds", 0, 0)
				
				-- Play looping "active" sound while logged in
				-- Shared.PlayPrivateSound(player, Armory.kResupplySound, player, 1.0, Vector(0, 0, 0))
				
				MouseTracker_SetIsVisible(true, "ui/Cursor_MenuDefault.dds", true)
				
				-- tell the player to show the lua menu
				player:BuyMenu(self)
				
			end
			
		end
		
	end

	function Armory:SetOpacity(amount, identifier)

		for i = 0, self:GetNumChildren() - 1 do
		
			local child = self:GetChildAtIndex(i)
			if HasMixin(child, "Model") then
				child:SetOpacity(amount, identifier)
			end
		
		end
		
	end

	function Armory:UpdateArmoryWarmUp()

		if self.clientConstructionComplete ~= self.constructionComplete and self.constructionComplete then
			self.clientConstructionComplete = self.constructionComplete
			self.timeConstructionCompleted = Shared.GetTime()
		end
		
	end

	local kUpVector = Vector(0, 1, 0)

	function Armory:OnUpdateRender()

		PROFILE("Armory:OnUpdateRender")

		local player = Client.GetLocalPlayer()
		local showHealthIndicator = false
		
		if player then    
			showHealthIndicator = GetIsUnitActive(self) and GetAreFriends(self, player) and (player:GetHealth()/player:GetMaxHealth()) ~= 1 and player:GetIsAlive() and not player:isa("Commander") 
		end

		if not self.healthIndicator then
		
			self.healthIndicator = Client.CreateRenderModel(RenderScene.Zone_Default)  
			self.healthIndicator:SetModel(kHealthIndicatorModelName)
			
		end
		
		self.healthIndicator:SetIsVisible(showHealthIndicator)
		
		-- rotate model if visible
		if showHealthIndicator then
		
			local time = Shared.GetTime()
			local zAxis = Vector(math.cos(time), 0, math.sin(time))

			local coords = Coords.GetLookIn(self:GetOrigin() + 2.9 * kUpVector, zAxis)
			self.healthIndicator:SetCoords(coords)
		
		end

	end

	function Armory:OnDestroy()
		if self.healthIndicator then
			Client.DestroyRenderModel(self.healthIndicator)
			self.healthIndicator = nil
		end
		ScriptActor.OnDestroy(self)
	end
end

if Server then

	local function OnDeploy(self)

		self.deployed = true
		return false
		
	end

	local kDeployTime = gArmoryDeployTime --3

	function Armory:OnConstructionComplete()
		self:AddTimedCallback(OnDeploy, kDeployTime)
	end

	-- west/east = x/-x
	-- north/south = -z/z

	local indexToUseOrigin =
	{
		-- West
		Vector(Armory.kResupplyUseRange, 0, 0), 
		-- North
		Vector(0, 0, -Armory.kResupplyUseRange),
		-- South
		Vector(0, 0, Armory.kResupplyUseRange),
		-- East
		Vector(-Armory.kResupplyUseRange, 0, 0)
	}

	function Armory:GetTimeToResupplyPlayer(player)

		assert(player ~= nil)
		
		local timeResupplied = self.resuppliedPlayers[player:GetId()]
		
		if timeResupplied ~= nil then
		
			-- Make sure we haven't done this recently
			if Shared.GetTime() < (timeResupplied + Armory.kResupplyInterval) then
				return false
			end
			
		end
		
		return true
		
	end

	function Armory:GetShouldResupplyPlayer(player)

		if not player:GetIsAlive() then
			return false
		end
		
		local isVortexed = self:GetIsVortexed() or ( HasMixin(player, "VortexAble") and player:GetIsVortexed() )
		if isVortexed then
			return false
		end    
		
		local stunned = HasMixin(player, "Stun") and player:GetIsStunned()
		
		if stunned then
			return false
		end
		
		local inNeed = false
		
		-- Don't resupply when already full
		if (player:GetHealth() < player:GetMaxHealth()) then
			inNeed = true
		else

			-- Do any weapons need ammo?
			for i, child in ientitychildren(player, "ClipWeapon") do
			
				if child:GetNeedsAmmo(false) then
					inNeed = true
					break
				end
				
			end
			
		end
		
		if inNeed then
		
			-- Check player facing so players can't fight while getting benefits of armory
			local viewVec = player:GetViewAngles():GetCoords().zAxis

			local toArmoryVec = self:GetOrigin() - player:GetOrigin()
			
			if(GetNormalizedVector(viewVec):DotProduct(GetNormalizedVector(toArmoryVec)) > .75) then
			
				if self:GetTimeToResupplyPlayer(player) then
			
					return true
					
				end
				
			end
			
		end
		
		return false
		
	end

	function Armory:ResupplyPlayer(player)
		
		local resuppliedPlayer = false
		
		-- Heal player first
		if (player:GetHealth() < player:GetMaxHealth()) then

			-- third param true = ignore armor
			player:AddHealth(Armory.kHealAmount, false, true)

			self:TriggerEffects("armory_health", {effecthostcoords = Coords.GetTranslation(player:GetOrigin())})
			
			resuppliedPlayer = true
			--[[
			if HasMixin(player, "ParasiteAble") and player:GetIsParasited() then
			
				player:RemoveParasite()
				
			end
			--]]
			
			if player:isa("Marine") and player.poisoned then
			
				player.poisoned = false
				
			end
			
		end

		-- Give ammo to all their weapons, one clip at a time, starting from primary
		local weapons = player:GetHUDOrderedWeaponList()
		
		for index, weapon in ipairs(weapons) do
		
			if weapon:isa("ClipWeapon") then
			
				if weapon:GiveAmmo(1, false) then
				
					self:TriggerEffects("armory_ammo", {effecthostcoords = Coords.GetTranslation(player:GetOrigin())})
					
					resuppliedPlayer = true
					
					break
					
				end 
					   
			end
			
		end
			
		if resuppliedPlayer then
		
			-- Insert/update entry in table
			self.resuppliedPlayers[player:GetId()] = Shared.GetTime()
			
			-- Play effect
			--self:PlayArmoryScan(player:GetId())

		end

	end

	function Armory:ResupplyPlayers()

		local playersInRange = GetEntitiesForTeamWithinRange("Marine", self:GetTeamNumber(), self:GetOrigin(), Armory.kResupplyUseRange)
		for index, player in ipairs(playersInRange) do
		
			if self:GetShouldResupplyPlayer(player) then
				self:ResupplyPlayer(player)
			end
				
		end

	end

	function Armory:UpdateResearch()

		local researchId = self:GetResearchingId()

		if researchId == kTechId.AdvancedArmoryUpgrade then
		
			local techTree = self:GetTeam():GetTechTree()    
			local researchNode = techTree:GetTechNode(kTechId.AdvancedArmory)    
			researchNode:SetResearchProgress(self.researchProgress)
			techTree:SetTechNodeChanged(researchNode, string.format("researchProgress = %.2f", self.researchProgress)) 
			
		end

	end

	local function AddChildModel(self)

		local scriptActor = CreateEntity(ArmoryAddon.kMapName, nil, self:GetTeamNumber())
		scriptActor:SetParent(self)
		scriptActor:SetAttachPoint(Armory.kAttachPoint)
		
		return scriptActor
		
	end

	function Armory:OnResearch(researchId)

		if researchId == kTechId.AdvancedArmoryUpgrade then

			-- Create visual add-on
			local advancedArmoryModule = AddChildModel(self)
			
		end
		
	end

	function Armory:OnResearchCancel(researchId)

		if researchId == kTechId.AdvancedArmoryUpgrade then
		
			local team = self:GetTeam()
			
			if team then
			
				local techTree = team:GetTechTree()
				local researchNode = techTree:GetTechNode(kTechId.AdvancedArmory)
				if researchNode then
				
					researchNode:ClearResearching()
					techTree:SetTechNodeChanged(researchNode, string.format("researchProgress = %.2f", 0))   
			 
				end
				
				for i = 0, self:GetNumChildren() - 1 do
				
					local child = self:GetChildAtIndex(i)
					if child:isa("ArmoryAddon") then
						DestroyEntity(child)
						break
					end
					
				end  

			end  
		
		end

	end

	-- Called when research or upgrade complete
	function Armory:OnResearchComplete(researchId)

		if researchId == kTechId.AdvancedArmoryUpgrade then
		
			self:SetTechId(kTechId.AdvancedArmory)
			
			local techTree = self:GetTeam():GetTechTree()
			local researchNode = techTree:GetTechNode(kTechId.AdvancedWeaponry)
			
			if researchNode then     
	   
				researchNode:SetResearchProgress(1.0)
				techTree:SetTechNodeChanged(researchNode, string.format("researchProgress = %.2f", self.researchProgress))
				researchNode:SetResearched(true)
				techTree:QueueOnResearchComplete(kTechId.AdvancedWeaponry, self)
				
			end
			
		end
		
	end

	function Armory:UpdateLoggedIn()

    local players = GetEntitiesForTeamWithinRange("Marine", self:GetTeamNumber(), self:GetOrigin(), 2 * Armory.kResupplyUseRange)
    local armoryCoords = self:GetAngles():GetCoords()
    
    for i = 1, 4 do
    
        local newState = false
        
        if GetIsUnitActive(self) then
        
            local worldUseOrigin = self:GetModelOrigin() + armoryCoords:TransformVector(indexToUseOrigin[i])
        
            for playerIndex, player in ipairs(players) do
            
                -- See if valid player is nearby
                local isPlayerVortexed = HasMixin(player, "VortexAble") and player:GetIsVortexed()
                if not isPlayerVortexed and player:GetIsAlive() and (player:GetModelOrigin() - worldUseOrigin):GetLength() < Armory.kResupplyUseRange then
                
                    newState = true
                    break
                    
                end
                
            end
            
        end
        
        if newState ~= self.loggedInArray[i] then
        
            if newState then
                self:TriggerEffects("armory_open")
            else
                self:TriggerEffects("armory_close")
            end
            
            self.loggedInArray[i] = newState
            
        end
        
    end
    
    -- Copy data to network variables (arrays not supported)
    self.loggedInWest = self.loggedInArray[1]
    self.loggedInNorth = self.loggedInArray[2]
    self.loggedInSouth = self.loggedInArray[3]
    self.loggedInEast = self.loggedInArray[4]

	end

end

--Shared.LinkClassToMap("Armory", Armory.kMapName, networkVars)

Shared.LinkClassToMap("Armory", Armory.kMapName, networkVars)
Shared.LinkClassToMap("ArmoryAddon", ArmoryAddon.kMapName, addonNetworkVars)
Shared.LinkClassToMap("AdvancedArmory", AdvancedArmory.kMapName, {})