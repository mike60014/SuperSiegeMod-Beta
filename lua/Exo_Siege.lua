Script.Load("lua/StunMixin.lua")
Script.Load("lua/PhaseGateUserMixin.lua")
Script.Load("lua/Mixins/LadderMoveMixin.lua")
Script.Load("lua/Additions/ExoWelder.lua")

class 'ExoSiege' (Exo)
ExoSiege.kMapName = "exosiege"

local networkVars = {     isLockedEjecting = "private boolean", }
AddMixinNetworkVars(StunMixin, networkVars)
AddMixinNetworkVars(PhaseGateUserMixin, networkVars)
AddMixinNetworkVars(LadderMoveMixin, networkVars)

local kDualWelderModelName = PrecacheAsset("models/marine/exosuit/exosuit_rr.model")
local kDualWelderAnimationGraph = PrecacheAsset("models/marine/exosuit/exosuit_rr.animation_graph")

local kHoloMarineMaterialname = PrecacheAsset("cinematics/vfx_materials/marine_ip_spawn.material")

local kAtomReconstructionTime = 3
local kGetStunnedCooldown = 3
local kThrusterUpwardsAcceleration = 2
local kThrusterHorizontalAcceleration = 23 
local kHorizontalThrusterAddSpeed = 2.5 -- added to max speed when using thrusters
local kWalkMaxSpeed = 3.7
local kMaxSpeed = 5.75
local kViewOffsetHeight = 2.3
local kAcceleration = 20
local kSmashEggRange = 1.5
Exo.kXZExtents = 0.55
Exo.kYExtents = 1.2
local kCrouchShrinkAmount = gAllExoCrouchShrinkAmount
local kExtentsCrouchShrinkAmount = gAllExoExtentsCrouchShrinkAmount
local kThrustersCooldownTime = gAllExoThrustersCooldownTime
local kThrusterDuration = gAllExoThrusterDuration
local kThrusterMinimumFuel = gAllExoThrusterMinimumFuel
kHealthWarningTrigger = gExoHealthWarningTrigger
kHealthCriticalTrigger = gExoHealthCriticalTrigger
local kExoEjectDuration = gAllExoEjectDuration
local kExoDeployDuration = gAllExoDeployDuration


local function DestroySpinEffect(self) 
    if self.fakeMarineModel then    
        self.fakeMarineModel:SetIsVisible(false)
    end

end
local function CreateSpinEffect(self)


    if not self.fakeMarineModel and not self.fakeMarineMaterial then
    
        self.fakeMarineModel = Client.CreateRenderModel(RenderScene.Zone_Default)
        self.fakeMarineModel:SetModel(Shared.GetModelIndex(kDualWelderModelName))
        
        local coords = self:GetCoords()
        coords.origin = coords.origin + Vector(0, 0.4, 0)
        
        self.fakeMarineModel:SetCoords(coords)
        self.fakeMarineModel:InstanceMaterials()
        self.fakeMarineModel:SetMaterialParameter("hiddenAmount", 1.0)
        
        self.fakeMarineMaterial = AddMaterial(self.fakeMarineModel, kHoloMarineMaterialname)
    
    end
    

        self.timeSpinStarted =  Shared.GetTime()

    
    local spawnProgress = Clamp((Shared.GetTime() - self.timeSpinStarted) / 3, 0, 1)
    self.fakeMarineModel:SetIsVisible(true)
    self.fakeMarineMaterial:SetParameter("spawnProgress", spawnProgress+0.2)    -- Add a little so it always fills up

end

function ExoSiege:OnCreate()
    Exo.OnCreate(self)
    InitMixin(self, PhaseGateUserMixin)
    InitMixin(self, LadderMoveMixin)
    self.isLockedEjecting = false
   

end
local origmodel = Exo.InitExoModel

function ExoSiege:InitExoModel()

    local hasWelders = false
    local modelName = kDualWelderModelName
    local graphName = kDualWelderAnimationGraph
    
  if self.layout == "WelderWelder" or self.layout == "FlamerFlamer" then
         modelName = kDualWelderModelName
        graphName = kDualWelderAnimationGraph
        self.hasDualGuns = true
        hasWelders = true
        self:SetModel(modelName, graphName)
    end
    
    
    if hasWelders then 
    else
    origmodel(self)
    end

     
  

  
end

function ExoSiege:InitWeapons()
    local weaponHolder = self:GetWeapon(ExoWeaponHolder.kMapName)
    if not weaponHolder then
        weaponHolder = self:GiveItem(ExoWeaponHolder.kMapName, false)   
    end    
    
  
        if self.layout == "WelderWelder" then
        weaponHolder:SetWelderWeapons()
        self:SetHUDSlotActive(1)
        return
        elseif self.layout == "FlamerFlamer" then
        weaponHolder:SetFlamerWeapons()
        self:SetHUDSlotActive(1)
        return
        end
        
        

        Exo.InitWeapons(self)

    
end
local function HealSelf(self)


  local toheal = true
  /*
                for _, proto in ipairs(GetEntitiesForTeamWithinRange("PrototypeLab", 1, self:GetOrigin(), 4)) do
                    
                    if GetIsUnitActive(proto) then
                        toheal = true
                        break
                    end
                    
                end
           */
          --  Print("toheal is %s", toheal)
    if toheal then
    self:SetArmor(self:GetArmor() + kNanoArmorHealPerSecond, true) 
    end
    
end
function ExoSiege:GetCanControl()
    return not self.isLockedEjecting and not self.isMoveBlocked and self:GetIsAlive() and  not self.countingDown and not self.concedeSequenceActive
end
local oninit = Exo.OnInitialized
function ExoSiege:OnInitialized()

oninit(self)

    InitMixin(self, StunMixin)
   self:SetTechId(kTechId.Exo)
   self:AddTimedCallback(function() HealSelf(self) return true end, 1) 
end
        function ExoSiege:GetTechId()
         return kTechId.Exo
    end

function ExoSiege:GetIsStunAllowed()
    return not self.timeLastStun or self.timeLastStun + 8 < Shared.GetTime() 
end

function ExoSiege:OnGetMapBlipInfo()
    local success = false
    local blipType = kMinimapBlipType.Undefined
    local blipTeam = -1
    local isAttacked = HasMixin(self, "Combat") and self:GetIsInCombat()
    blipType = kMinimapBlipType.Exo
     blipTeam = self:GetTeamNumber()
    if blipType ~= 0 then
        success = true
    end
    
    return success, blipType, blipTeam, isAttacked, false --isParasited
end


function ExoSiege:OnStun()
         if Server then
                local stunwall = CreateEntity(StunWall.kMapName, self:GetOrigin(), 2)    
                StartSoundEffectForPlayer(AlienCommander.kBoneWallSpawnSound, self)
        end
end
function ExoSiege:OnDestroy()

    Exo.OnDestroy(self)
    
    -- Put the player back in queue if there was one hoping to spawn at this now destroyed IP.
    if Client then
    
        DestroySpinEffect(self)
        
        if self.fakeMarineModel then
        
            Client.DestroyRenderModel(self.fakeMarineModel)
            self.fakeMarineModel = nil
            self.fakeMarineMaterial = nil
            
        end
        
    end
    
end
  if Client then
    function ExoSiege:OnUpdate(deltaTime)
          Exo.OnUpdate(self,deltaTime)
          
        local shouldSpin = self.isLockedEjecting
        if shouldSpin then
            CreateSpinEffect(self)
        else
            DestroySpinEffect(self)
        end
        
    end
  end

function ExoSiege:EjectExo()

    if self:GetCanEject() then
         
        if Server then
            self:PerformEject()
        end
    
    end

end


if Server then

    function ExoSiege:PerformEject()
	if kExoEjectDuration >= 1.00 then
		self:SetCameraDistance(3)
		if Client then CreateSpinEffect(self) end
		self.isLockedEjecting = true
		--self:AddTimedCallback(function() DestroySpinEffect(self) self.isLockedEjecting = false self:SetCameraDistance(0) Exo.EjectExo(self)  end, kExoEjectDuration)
		self:AddTimedCallback(function() DestroySpinEffect(self) self.isLockedEjecting = false self:SetCameraDistance(0) Exo.PerformEject(self)  end, kExoEjectDuration)
	elseif kExoEjectDuration < 0.99 then
		--self:AddTimedCallback(function() DestroySpinEffect(self) self.isLockedEjecting = false self:SetCameraDistance(0) Exo.EjectExo(self)  end, kExoEjectDuration)
		self:AddTimedCallback(function() DestroySpinEffect(self) self.isLockedEjecting = false self:SetCameraDistance(0) Exo.PerformEject(self)  end, kExoEjectDuration)
	end
end
end



Shared.LinkClassToMap("ExoSiege", ExoSiege.kMapName, networkVars)