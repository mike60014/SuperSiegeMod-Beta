



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



local function PickupWeapon(self, weapon, wasAutoPickup)
    
    -- some weapons completely replace other weapons (welder > axe).
    local replacement = weapon.GetReplacementWeaponMapName and weapon:GetReplacementWeaponMapName()
    local obsoleteWep = replacement and self:GetWeapon(replacement)
    if obsoleteWep then
        self:RemoveWeapon(obsoleteWep)
        DestroyEntity(obsoleteWep)
    end
    
    -- find the weapon that is about to be dropped to make room for this one
    local slot = weapon:GetHUDSlot()
    local oldWep = self:GetWeaponInHUDSlot(slot)
    
    -- perform the actual weapon pickup (also drops weapon in the slot)
    self:AddWeapon(weapon, not wasAutoPickup or slot == 1 or obsoleteWep ~= nil)
    StartSoundEffectAtOrigin(Marine.kGunPickupSound, self:GetOrigin())
    
    if not wasAutoPickup then
        self:SetHUDSlotActive(weapon:GetHUDSlot())
    end
    
    self.timeOfLastPickUpWeapon = Shared.GetTime()
    self.lastDroppedWeapon = oldWep
    
end


local origcreate = Marine.OnCreate
function Marine:OnCreate()
  origcreate(self)
 local open = GetSiegeDoorOpen()
 //Print("siege door is open %s", open)
       if open == false then
         if GetIsInSiege(self)
           then self:Kill()  
            end
        end
end
function Marine:OnLocationChange(locationName)
 local open = GetSiegeDoorOpen()
 //Print("siege door is open %s", open)
       if open == false then
         if string.find(locationName, "siege") or string.find(locationName, "Siege") 
           then self:Kill()  
            end
        end
end


function Marine:GetHasLayStructure()
        local weapon = self:GetWeaponInHUDSlot(5)
        local builder = false
    if (weapon) then
            builder = true
    end
    
    return builder
end
function Marine:GetCanBeVortexed()
    return false
end

if Server then
/*
local origcweapons = Marine.InitWeapons


function Marine:InitWeapons()

origcweapons(self)

 if not GetGameStarted() or self:GetDarwinMode() then
    -- Print("Giving item")
     self:GiveItem(JediConcGrenadeThrower.kMapName, true)
 end

end
*/
function Marine:GiveLayStructure(techid, mapname)
  --  if not self:GetHasLayStructure() then
           local laystructure = self:GiveItem(LayStructures.kMapName)
           self:SetActiveWeapon(LayStructures.kMapName)
           laystructure:SetTechId(techid)
           laystructure:SetMapName(mapname)
  -- else
   --  self:TellMarine(self)
  -- end
end

function Marine:GiveExo(spawnPoint)
    local random = math.random(1,2)
    if random == 1 then 
        local exo = self:Replace(ExoSiege.kMapName, self:GetTeamNumber(), false, spawnPoint, { layout = "MinigunMinigun" })
    return exo
    else
        local exo = self:Replace(ExoSiege.kMapName, self:GetTeamNumber(), false, spawnPoint, { layout = "RailgunRailgun" })
    return exo
    end

    
end

function Marine:GiveDualExo(spawnPoint)

    local exo = self:Replace(ExoSiege.kMapName, self:GetTeamNumber(), false, spawnPoint, { layout = "MinigunMinigun" })
    return exo
    
end
function Marine:GiveDualWelder(spawnPoint)

    local exo = self:Replace(ExoSiege.kMapName, self:GetTeamNumber(), false, spawnPoint, { layout = "WelderWelder" })
    return exo
    
end
function Marine:GiveDualFlamer(spawnPoint)

    local exo = self:Replace(ExoSiege.kMapName, self:GetTeamNumber(), false, spawnPoint, { layout = "FlamerFlamer" })
    return exo
    
end
function Marine:GiveClawRailgunExo(spawnPoint)

    local exo = self:Replace(ExoSiege.kMapName, self:GetTeamNumber(), false, spawnPoint, { layout = "ClawRailgun" })
    return exo
    
end

function Marine:GiveDualRailgunExo(spawnPoint)

    local exo = self:Replace(ExoSiege.kMapName, self:GetTeamNumber(), false, spawnPoint, { layout = "RailgunRailgun" })
    return exo
    
end

local function BuyWelderExo(self)

    local maxAttempts = 100
    for index = 1, maxAttempts do
    
        -- Find open area nearby to place the big guy.
        local capsuleHeight, capsuleRadius = self:GetTraceCapsule()
        local extents = Vector(Exo.kXZExtents, Exo.kYExtents, Exo.kXZExtents)

        local spawnPoint        
        local checkPoint = self:GetOrigin() + Vector(0, 0.02, 0)
        
        if GetHasRoomForCapsule(extents, checkPoint + Vector(0, extents.y, 0), CollisionRep.Move, PhysicsMask.Evolve, self) then
            spawnPoint = checkPoint
        else
            spawnPoint = GetRandomSpawnForCapsule(extents.y, extents.x, checkPoint, 0.5, 5, EntityFilterOne(self))
        end    
            

        if spawnPoint then
        
            self:AddResources(-GetCostForTech(techId))
            
                self:GiveDualWelder(spawnPoint)
            return
            
        end
        
    end
    
    Print("Error: Could not find a spawn point to place the Exo")
    
end
local function BuyFlamerExo(self)

    local maxAttempts = 100
    for index = 1, maxAttempts do
    
        -- Find open area nearby to place the big guy.
        local capsuleHeight, capsuleRadius = self:GetTraceCapsule()
        local extents = Vector(Exo.kXZExtents, Exo.kYExtents, Exo.kXZExtents)

        local spawnPoint        
        local checkPoint = self:GetOrigin() + Vector(0, 0.02, 0)
        
        if GetHasRoomForCapsule(extents, checkPoint + Vector(0, extents.y, 0), CollisionRep.Move, PhysicsMask.Evolve, self) then
            spawnPoint = checkPoint
        else
            spawnPoint = GetRandomSpawnForCapsule(extents.y, extents.x, checkPoint, 0.5, 5, EntityFilterOne(self))
        end    
            

        if spawnPoint then
        
            self:AddResources(-GetCostForTech(techId))
            
                self:GiveDualFlamer(spawnPoint)
            return
            
        end
        
    end
    
    Print("Error: Could not find a spawn point to place the Exo")
    
end
local origattemptbuy = Marine.AttemptToBuy
function Marine:AttemptToBuy(techIds)

  local techId = techIds[1]
    
    local hostStructure = GetHostStructureFor(self, techId)

    if hostStructure then
    
        local mapName = LookupTechData(techId, kTechDataMapName)
        
        if mapName then
        
            Shared.PlayPrivateSound(self, Marine.kSpendResourcesSoundName, nil, 1.0, self:GetOrigin())
            
            if self:GetTeam() and self:GetTeam().OnBought then
                self:GetTeam():OnBought(techId)
            end
            
            if techId == kTechId.DualWelderExosuit then
                 BuyWelderExo(self)
            elseif techId == kTechId.DualFlamerExosuit then
                 BuyFlamerExo(self)
               else
                if hostStructure:isa("Armory") then self:AddResources(-GetCostForTech(techId)) end
                origattemptbuy(self, techIds)
            end
       end
   end
    

end

elseif Client then



local orig_Marine_UpdateGhostModel = Marine.UpdateGhostModel
function Marine:UpdateGhostModel()

orig_Marine_UpdateGhostModel(self)

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
        elseif weapon:isa("LayMines") then
        self.currentTechId = kTechId.Mine
        self.ghostStructureCoords = weapon:GetGhostModelCoords()
        self.ghostStructureValid = weapon:GetIsPlacementValid()
        self.showGhostModel = weapon:GetShowGhostModel()
         end
    end




end --function


function Marine:AddGhostGuide(origin, radius)

return

end

end -- client