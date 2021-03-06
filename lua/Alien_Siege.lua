local networkVars = {lastredeemorrebirthtime = "time", canredeemorrebirth = "boolean",  primaled = "boolean",  primaledID = "entityid",} 
local orig_Alien_OnCreate = Alien.OnCreate

Alien.kEnergyRecuperationRate = kAlienEnergyRecuperationRate
Alien.kWalkBackwardSpeedScalar = kAlienWalkBackwardSpeedScalar
Alien.kEnergyAdrenalineRecuperationRate = kAlienEnergyAdrenalineRecuperationRate



Babbler.kMass = gBabblerMass
Babbler.kRadius = gBabblerRadius
Babbler.kLinearDamping = gBabblerLinearDamping
Babbler.kRestitution = gBabblerRestitution
Babbler.kFov = gBabblerFov
kBabblerHealth = gBabblerHealth
kTargetSearchRange = gBabblerTargetSearchRange
kAttackRate = gBabblerAttackRate
kLifeTime = gBabblerLifeTime
kUpdateMoveInterval = gBabblerUpdateMoveInterval
kUpdateAttackInterval = gBabblerUpdateAttackInterval
kMinJumpDistance = gBabblerMinJumpDistance
kBabblerRunSpeed = gBabblerRunSpeed    --7
kVerticalJumpForce = gBabblerVerticalJumpForce
kMaxJumpForce = gBabblerMaxJumpForce
kMinJumpForce = gBabblerMinJumpForce
kTurnSpeed = gBabblerTurnSpeed
kBabblerClingDuration = gBabblerClingDuration

local knewMaxHealthMultipler = gAlienBiomassAddHealthMultipler --1.10


function Alien:SlapPlayer()
 self:SetVelocity(  self:GetVelocity() + Vector(math.random(100,900),math.random(100,900),math.random(100,900)  ) )
end

function Alien:OnCreate()
    orig_Alien_OnCreate(self)
	self:UpdateWeapons()
	self.lastredeemorrebirthtime = 0
	self.canredeemorrebirth = true
	self.primaled = false
	self.primaledID = Entity.invalidI 
	self.primalGiveTime = 0

end

function Alien:UpdateWeapons()
     --local lasttime = 1
     if Server then
        self:AddTimedCallback(function() UpdateAvailability(self, self:GetTierOneTechId(), self:GetTierTwoTechId(), self:GetTierThreeTechId(), self:GetTierFourTechId(), self:GetTierFiveTechId()) end, 0.6) 
     end
end

local orig_Alien_OnInitialized = Alien.OnInitialized
function Alien:OnInitialized()
    orig_Alien_OnInitialized(self)
     if not self:isa("Embryo") then
      self:AddTimedCallback(Alien.UpdateHealthAmountManual, .5) 
      self:AddTimedCallback(Alien.UpdateArmorAmountManual, .5) 
   end
     self:AddTimedCallback(Alien.CheckRedemptionTimer, .5) 

end

local function CheckPrimalScream(self)
	self.primaled = self.primalGiveTime - Shared.GetTime() > 0
	return self.primaled
end

if Server then
function Alien:GetTierFourTechId()
    return kTechId.None
end

function Alien:GetTierFiveTechId()
    return kTechId.None
end

function Alien:PrimalScream(duration)
	if not self.primaled then
		self:AddTimedCallback(CheckPrimalScream, duration)
	end
	self.primaled = true
	self.primalGiveTime = Shared.GetTime() + duration
end

end

function Alien:GetHasPrimalScream()
    return self.primaled
end

function Alien:CancelPrimal()

    if self.primalGiveTime > Shared.GetTime() or self:GetIsOnFire() then 
        self.primalGiveTime = Shared.GetTime()
        self.primaledID = Entity.invalidI
    end
    
end
--Hmm? Overwrite? My palms are open, not clenched.. Idk about my asshole, though.
function Alien:OnUpdateAnimationInput(modelMixin)

    Player.OnUpdateAnimationInput(self, modelMixin)
    
    local attackSpeed = self:GetIsEnzymed() and kEnzymeAttackSpeed or 1
    attackSpeed = attackSpeed * ( self.electrified and kElectrifiedAttackSpeed or 1 )
    attackSpeed = attackSpeed + ( self:GetHasPrimalScream() and kPrimalScreamROFIncrease or 0)
    if self.ModifyAttackSpeed then
    
        local attackSpeedTable = { attackSpeed = attackSpeed }
        self:ModifyAttackSpeed(attackSpeedTable)
        attackSpeed = attackSpeedTable.attackSpeed
        
    end
    
    modelMixin:SetAnimationInput("attack_speed", attackSpeed)
    
end

function Alien:CheckRedemptionTimer()
    if  GetHasRedemptionUpgrade(self) then 
        if Server then
        self:AddTimedCallback(Alien.RedemptionTimer, 3) 
        end
       end
       return false
end

function Alien:GetRebirthLength()
return 0
end

function Alien:GetRedemptionCoolDown()
return 0
end

/*
function Alien:UpdateArmorAmount(carapaceLevel)
return
end
function Alien:UpdateHealthAmount(bioMassLevel, maxLevel)
return
end
*/


function Alien:UpdateArmorAmount(carapaceLevel)
    local teamInfo = GetTeamInfoEntity(2)
	if teamInfo then
	if GetHasCarapaceUpgrade(self) then
		local bioMassLevel = teamInfo:GetBioMassLevel()
		local bioMassPlusPercent = self:GetHealthPerBioMass() * bioMassLevel
		local newMaxHealth = self:GetBaseHealth() + (bioMassPlusPercent * self:GetBaseHealth())
		local level = carapaceLevel or 0
		local AddArmorFromHP = ((level * gCarapaceArmorPerLevelPercent) * newMaxHealth) + self:GetBaseArmor()
		local newMaxArmor = Clamp(AddArmorFromHP , self:GetBaseArmor(), self:GetArmorFullyUpgradedAmount())
		self.maxArmor = newMaxArmor
		--self:SetMaxArmor(newMaxArmor)
		self:AdjustMaxArmor(newMaxArmor)
		--self:AddArmor(newMaxArmor - self:GetBaseArmor(), false, false, self)
	elseif not GetHasCarapaceUpgrade(self) then
	
		--self:SetMaxArmor(self:GetBaseArmor())
		self:AdjustMaxArmor(self:GetBaseArmor())
	
    end
	end
	return false
end

function Alien:UpdateHealthAmount(bioMassLevel, maxLevel)
    local teamInfo = GetTeamInfoEntity(2)
	if teamInfo then
	if self:GetHasUpgrade(kTechId.ThickenedSkin) then 
		local bioMassLevel = teamInfo:GetBioMassLevel() or 0
		local bioMassPlusPercent = self:GetHealthPerBioMass() * bioMassLevel
		local newMaxHealth = self:GetBaseHealth() + (bioMassPlusPercent * self:GetBaseHealth())
		self.maxHealth = newMaxHealth
		--self:SetMaxHealth(newMaxHealth)
		self:AdjustMaxHealth(newMaxHealth)
		self:AddHealth(newMaxHealth - self:GetBaseHealth(), playSound, noArmor, hideEffect, healer)
	else
		local newMaxHealth = self:GetBaseHealth()
		self.maxHealth = newMaxHealth
		--self:SetMaxHealth(newMaxHealth)
		self:AdjustMaxHealth(newMaxHealth)
	end
    end
   return false
end

function Alien:UpdateHealthAmountManual(bioMassLevel, maxLevel)
    local teamInfo = GetTeamInfoEntity(2)
	if teamInfo then
	if self:GetHasUpgrade(kTechId.ThickenedSkin) then 
		local bioMassLevel = teamInfo:GetBioMassLevel() or 0
		local bioMassPlusPercent = self:GetHealthPerBioMass() * bioMassLevel
		local newMaxHealth = self:GetBaseHealth() + (bioMassPlusPercent * self:GetBaseHealth())
		self.maxHealth = newMaxHealth
		--self:SetMaxHealth(newMaxHealth)
		self:AdjustMaxHealth(newMaxHealth)
		--self:SetHealth(newMaxHealth)
	else
		local newMaxHealth = self:GetBaseHealth()
		self.maxHealth = newMaxHealth
		--self:SetMaxHealth(newMaxHealth)
		self:AdjustMaxHealth(newMaxHealth)
    end
	end
   return false
end

function Alien:UpdateArmorAmountManual(carapaceLevel)
    local teamInfo = GetTeamInfoEntity(2)
	if teamInfo then
	if GetHasCarapaceUpgrade(self) then
		local bioMassLevel = teamInfo:GetBioMassLevel()
		local bioMassPlusPercent = self:GetHealthPerBioMass() * bioMassLevel
		local newMaxHealth = self:GetBaseHealth() + (bioMassPlusPercent * self:GetBaseHealth())
		local level = carapaceLevel or 0
		local AddArmorFromHP = ((level * gCarapaceArmorPerLevelPercent) * newMaxHealth) + self:GetBaseArmor()
		local newMaxArmor = Clamp(AddArmorFromHP , self:GetBaseArmor(), self:GetArmorFullyUpgradedAmount())
		self.maxArmor = newMaxArmor
		--self:SetMaxArmor(newMaxArmor)
		self:AdjustMaxArmor(newMaxArmor)
		--self:SetArmor(newMaxArmor, false)
	elseif not GetHasCarapaceUpgrade(self) then
	
		--self:SetMaxArmor(self:GetBaseArmor())
		self:AdjustMaxArmor(self:GetBaseArmor())
	
    end
	end
	return false
end


if Server then

function Alien:CreditBuy(techId)

	local eggExtents = LookupTechData(kTechId.Embryo, kTechDataMaxExtents)
	local newLifeFormTechId = techId
	local newAlienExtents = LookupTechData(newLifeFormTechId, kTechDataMaxExtents)
	local physicsMask = PhysicsMask.Evolve
	local cost = LookupTechData(techId, kTechDataCostKey, 0)
	--self:AddResources(cost)
	
	local position = self:GetOrigin()
	local trace = Shared.TraceRay(position, position + Vector(0, -0.5, 0), CollisionRep.Move, PhysicsMask.AllButPCs, EntityFilterOne(self))

	local upgradetable = {}
	local upgrades = Player.lastUpgradeList
	if upgrades and #upgrades > 0 then
		table.insert(upgradetable, upgrades)
	else
		table.insert(upgradetable, techId)
	end

	--table.insert(upgradetable, techId)
	--self:ProcessBuyAction(upgradetable, true)
	
	local newPlayer = self:Replace(Embryo.kMapName)
	position.y = position.y + Embryo.kEvolveSpawnOffset
	newPlayer:SetOrigin(position)

	-- Clear angles, in case we were wall-walking or doing some crazy alien thing
	local angles = Angles(self:GetViewAngles())
	angles.roll = 0.0
	angles.pitch = 0.0
	newPlayer:SetOriginalAngles(angles)
	newPlayer:SetValidSpawnPoint(roomAfter)

	-- Eliminate velocity so that we don't slide or jump as an egg
	newPlayer:SetVelocity(Vector(0, 0, 0))                
	newPlayer:DropToFloor()

	--newPlayer:AddResources(-cost)
	self:AddResources(cost)
	newPlayer:SetGestationData(upgradetable, techId, self:GetHealthFraction(), self:GetArmorScalar())
	
    --self:ProcessBuyAction(upgradetable, true)

	
end


end

function Alien:RefreshTechsManually()
        UpdateAvailability(self, self:GetTierOneTechId(), self:GetTierTwoTechId(), self:GetTierThreeTechId(), self:GetTierFourTechId(), self:GetTierFiveTechId() )
end
 



if Server then

function Alien:RedemptionTimer()
           local threshold =   math.random(kRedemptionEHPThresholdMin,kRedemptionEHPThresholdMax)  / 100
              --Print("threshold is %s", threshold)
              local scalar = self:GetHealthScalar()
               if GetHasRedemptionUpgrade(self) and scalar <= threshold  then
                 self.canredeemorrebirth = Shared.GetTime() > self.lastredeemorrebirthtime  + self:GetRedemptionCoolDown()
                 --Print("scalar is %s threshold is %s", scalar, threshold)
                 if self.canredeemorrebirth then
                 self.canredeemorrebirth = false
                 self:AddTimedCallback(Alien.RedemAlienToHive, math.random(1,4) ) 
                 end      
        end
          return true
end


local function GetRelocationHive(usedhive, origin, teamnumber)
    local hives = GetEntitiesForTeam("Hive", teamnumber)
	local selectedhive
	
    for i, hive in ipairs(hives) do
			selectedhive = hive
	end
	return selectedhive
end

function Alien:TeleportToHive(usedhive)
	local selectedhive = GetRelocationHive(usedhive, self:GetOrigin(), self:GetTeamNumber())
    local success = false
    if selectedhive then 
            local position = table.random(selectedhive.eggSpawnPoints)
                SpawnPlayerAtPoint(self, position)
//               Shared.Message("LOG - %s SuccessFully Redeemed", self:GetClient():GetControllingPlayer():GetUserId() )
                success = true
    end

end

function Alien:TriggerRebirth()


        local position = self:GetOrigin()
        local trace = Shared.TraceRay(position, position + Vector(0, -0.5, 0), CollisionRep.Move, PhysicsMask.AllButPCs, EntityFilterOne(self))
        
            // Check for room
            local eggExtents = LookupTechData(kTechId.Embryo, kTechDataMaxExtents)
            local newLifeFormTechId = self:GetTechId() /// :P
            local upgradeManager = AlienUpgradeManager()
            upgradeManager:Populate(self)
             upgradeManager:AddUpgrade(lifeFormTechId)
            local newAlienExtents = LookupTechData(newLifeFormTechId, kTechDataMaxExtents)
            local physicsMask = PhysicsMask.Evolve
            
            -- Add a bit to the extents when looking for a clear space to spawn.
            local spawnBufferExtents = Vector(0.1, 0.1, 0.1)
            
             local evolveAllowed = self:GetIsOnGround() and GetHasRoomForCapsule(eggExtents + spawnBufferExtents, position + Vector(0, eggExtents.y + Embryo.kEvolveSpawnOffset, 0), CollisionRep.Default, physicsMask, self)

            local roomAfter
            local spawnPoint
       
            // If not on the ground for the buy action, attempt to automatically
            // put the player on the ground in an area with enough room for the new Alien.
            if not evolveAllowed then
            
                for index = 1, 100 do
                
                    spawnPoint = GetRandomSpawnForCapsule(eggExtents.y, math.max(eggExtents.x, eggExtents.z), self:GetModelOrigin(), 0.5, 5, EntityFilterOne(self))
  
                    if spawnPoint then
                        self:SetOrigin(spawnPoint)
                        position = spawnPoint
                        break 
                    end
                    
                end
            end   
            
            if not GetHasRoomForCapsule(newAlienExtents + spawnBufferExtents, self:GetOrigin() + Vector(0, newAlienExtents.y + Embryo.kEvolveSpawnOffset, 0), CollisionRep.Default, PhysicsMask.AllButPCsAndRagdolls, nil, EntityFilterOne(self)) then
           
                for index = 1, 100 do

                    roomAfter = GetRandomSpawnForCapsule(newAlienExtents.y, math.max(newAlienExtents.x, newAlienExtents.z), self:GetModelOrigin(), 0.5, 5, EntityFilterOne(self))
                    
                    if roomAfter then
                        evolveAllowed = true
                        break
                    end

                end
                
            else
                roomAfter = position
                evolveAllowed = true
            end
            
            if evolveAllowed and roomAfter ~= nil then

                local newPlayer = self:Replace(Embryo.kMapName)
                position.y = position.y + Embryo.kEvolveSpawnOffset
                newPlayer:SetOrigin(position)
                // Clear angles, in case we were wall-walking or doing some crazy alien thing
                local angles = Angles(self:GetViewAngles())
                angles.roll = 0.0
                angles.pitch = 0.0
                newPlayer:SetOriginalAngles(angles)
                newPlayer:SetValidSpawnPoint(roomAfter)
                
                // Eliminate velocity so that we don't slide or jump as an egg
                newPlayer:SetVelocity(Vector(0, 0, 0))                
                newPlayer:DropToFloor()
                
               newPlayer:TriggerRebirthCountDown(newPlayer:GetClient():GetControllingPlayer())
               newPlayer:SetGestationData(upgradeManager:GetUpgrades(), newLifeFormTechId, 10, 10) //Skulk to X 
               newPlayer.gestationTime = self:GetRebirthLength()
               
               //Spawn protective boneshield    
                success = true
                
                
            else
				self:TeleportToHive()
				self:TriggerRebirthCountDown(self:GetClient():GetControllingPlayer())
				self:TriggerRedeemCountDown(self:GetClient():GetControllingPlayer())
            end    
            
    
    
    
end

function Alien:GetEligableForRebirth()
return Shared.GetTime() > self.lastredeemorrebirthtime  + self:GetRedemptionCoolDown() 
end

local function SingleHallucination(self, player)
  --Why a cloud ?
                local alien = player
                local newAlienExtents = LookupTechData(alien:GetTechId(), kTechDataMaxExtents)
                local capsuleHeight, capsuleRadius = GetTraceCapsuleFromExtents(newAlienExtents) 
                
                local spawnPoint = GetRandomSpawnForCapsule(newAlienExtents.y, capsuleRadius, alien:GetModelOrigin(), 0.5, 5)
                
                if spawnPoint then

                    local hallucinatedPlayer = CreateEntity(alien:GetMapName(), spawnPoint, self:GetTeamNumber())
                    hallucinatedPlayer.isHallucination = true
                    InitMixin(hallucinatedPlayer, PlayerHallucinationMixin)                
                    InitMixin(hallucinatedPlayer, SoftTargetMixin)                
                    InitMixin(hallucinatedPlayer, OrdersMixin, { kMoveOrderCompleteDistance = kPlayerMoveOrderCompleteDistance }) 

                    hallucinatedPlayer:SetName(alien:GetName())
                    hallucinatedPlayer:SetHallucinatedClientIndex(alien:GetClientIndex())
                end
                    


end

function Alien:OnRedeem(player)

	--self:GiveItem(HallucinationCloud.kMapName)
	SingleHallucination(self, player)
	self:AddScore(1, 0, false)
	self:TriggerRedeemCountDown(player)
	self:TriggerRebirthCountDown(player)
end

function Alien:TriggerRedeemCountDown(player)

end

function Alien:TriggerRebirthCountDown(player)

end

function Alien:RedemAlienToHive()
     if self:GetEligableForRebirth() then
        self:TeleportToHive()
          local client = self:GetClient():GetControllingPlayer()
         if client and self.OnRedeem then self:OnRedeem(client) end
        self.lastredeemorrebirthtime = Shared:GetTime()
     end
        return false
end

local origderp = Alien.CopyPlayerDataFrom

function Alien:CopyPlayerDataFrom(player)
 origderp(self, player)
    if GetHasRebirthUpgrade(self) and self.canredeemorrebirth then
      self:TriggerRebirthCountDown(self:GetClient():GetControllingPlayer())
      self:TriggerRedeemCountDown(self:GetClient():GetControllingPlayer())
     end

end


end //server

function Alien:GetHasLayStructure()
        local weapon = self:GetWeaponInHUDSlot(gCreditStructuredefHUDSlot)
        local builder = false
    if (weapon) then
            builder = true
    end
    
    return builder
end

function Alien:GiveLayStructure(techid, mapname)
  --  if not self:GetHasLayStructure() then
           local laystructure = self:GiveItem(LayStructures.kMapName)
           self:SetActiveWeapon(LayStructures.kMapName)
           laystructure:SetTechId(techid)
           laystructure:SetMapName(mapname)
  -- else
   --  self:TellMarine(self)
  -- end
end

if Client then

local orig_Alien_UpdateClientEffects = Alien.UpdateClientEffects
function Alien:UpdateClientEffects(deltaTime, isLocal)
	orig_Alien_UpdateClientEffects(self, deltaTime, isLocal)
	self:UpdateGhostModel()
end
    
    
--local orig_Alien_UpdateGhostModel = Alien.UpdateGhostModel
function Alien:UpdateGhostModel()

--orig_Alien_UpdateGhostModel(self)

 self.currentTechId = nil
 
    self.ghostStructureCoords = nil
    self.ghostStructureValid = false
    self.showGhostModel = false
    
    local weapon = self:GetActiveWeapon()

    if weapon then
       if weapon:isa("LayStructures") then
        self.currentTechId = weapon:GetDropStructureId()
        self.ghostStructureCoords = weapon:GetGhostModelCoords()
        self.ghostStructureValid = weapon:GetIsPlacementValid()
        self.showGhostModel = weapon:GetShowGhostModel()
         end
    end




end --function

function Alien:GetShowGhostModel()
    return self.showGhostModel
end    

function Alien:GetGhostModelTechId()
    return self.currentTechId
end

function Alien:GetGhostModelCoords()
    return self.ghostStructureCoords
end

function Alien:GetIsPlacementValid()
    return self.ghostStructureValid
end

function Alien:AddGhostGuide(origin, radius)

return

end

Alien.kPrimaledViewMaterialName = "cinematics/vfx_materials/primal_view.material"
Alien.kPrimaledThirdpersonMaterialName = "cinematics/vfx_materials/primal.material"
Shared.PrecacheSurfaceShader("cinematics/vfx_materials/primal_view.surface_shader")
Shared.PrecacheSurfaceShader("cinematics/vfx_materials/primal.surface_shader")


Alien.kOnocideViewMaterialName = "cinematics/vfx_materials/Onocide_view.material"
Alien.kOnocideThirdpersonMaterialName = "cinematics/vfx_materials/Onocide.material"
Shared.PrecacheSurfaceShader("cinematics/vfx_materials/Onocide_view.surface_shader")
Shared.PrecacheSurfaceShader("cinematics/vfx_materials/Onocide.surface_shader")

local kEnzymeEffectInterval = 0.2


function Alien:UpdateOnocideEffect(isLocal)
    local weapon = self:GetWeaponInHUDSlot(kOnocideHUDSlot) --4)
    local boolean = false
      if weapon then
         boolean = weapon.primaryAttacking
      end
      
    if self.OnocideClient ~= boolean then

        if isLocal then
        
            local viewModel= nil        
            if self:GetViewModelEntity() then
                viewModel = self:GetViewModelEntity():GetRenderModel()  
            end
                
            if viewModel then
   
                if boolean then
                    self.primaledViewMaterial = AddMaterial(viewModel, Alien.kOnocideViewMaterialName)
                else
                
                    if RemoveMaterial(viewModel, self.primaledViewMaterial) then
                        self.primaledViewMaterial = nil
                    end
  
                end
            
            end
        
        end
        
        local thirdpersonModel = self:GetRenderModel()
        if thirdpersonModel then
        
            if boolean then
                self.OnocideMaterial = AddMaterial(thirdpersonModel, Alien.kOnocideThirdpersonMaterialName)
            else
            
                if RemoveMaterial(thirdpersonModel, self.OnocideMaterial) then
                    self.OnocideMaterial = nil
                end

            end
        
        end
        
        self.OnocideClient = boolean
        
    end

    // update cinemtics
    if boolean then

        if not self.lastOnocideEffect or self.lastOnocideEffect + kEnzymeEffectInterval < Shared.GetTime() then
        
            self:TriggerEffects("enzymed")
            self.lastOnocideEffect = Shared.GetTime()
        
        end

    end 

end

function Alien:UpdatePrimalEffect(isLocal)
    if self.primaledClient ~= self.primaled then

        if isLocal then
        
            local viewModel= nil        
            if self:GetViewModelEntity() then
                viewModel = self:GetViewModelEntity():GetRenderModel()  
            end
                
            if viewModel then
   
                if self.primaled then
                    self.primaledViewMaterial = AddMaterial(viewModel, Alien.kPrimaledViewMaterialName)
                else
                
                    if RemoveMaterial(viewModel, self.primaledViewMaterial) then
                        self.primaledViewMaterial = nil
                    end
  
                end
            
            end
        
        end
        
        local thirdpersonModel = self:GetRenderModel()
        if thirdpersonModel then
        
            if self.primaled then
                self.primaledMaterial = AddMaterial(thirdpersonModel, Alien.kPrimaledThirdpersonMaterialName)
            else
            
                if RemoveMaterial(thirdpersonModel, self.primaledMaterial) then
                    self.primaledMaterial = nil
                end

            end
        
        end
        
        self.primaledClient = self.primaled
        
    end

    // update cinemtics
    if self.primaled then

        if not self.lastprimaledEffect or self.lastprimaledEffect + kEnzymeEffectInterval < Shared.GetTime() then
        
            self:TriggerEffects("enzymed")
            self.lastprimaledEffect = Shared.GetTime()
        
        end

    end 

end

local origcupdate = Alien.UpdateClientEffects

function Alien:UpdateClientEffects(deltaTime, isLocal)
     self:UpdatePrimalEffect(isLocal)
     if self:isa("Onos") then self:UpdateOnocideEffect(isLocal) end
     origcupdate(self, deltaTime,isLocal)
end

end //client

Shared.LinkClassToMap("Alien", Alien.kMapName, networkVars)

