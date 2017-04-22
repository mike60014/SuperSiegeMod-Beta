-- ======= Copyright (c) 2003-2011, Unknown Worlds Entertainment, Inc. All rights reserved. =======
--
-- lua\Fade.lua
--
--    Created by:   Charlie Cleveland (charlie@unknownworlds.com) and
--                  Max McGuire (max@unknownworlds.com)
--
-- Role: Surgical striker, harassment
--
-- The Fade should be a fragile, deadly-sharp knife. Wielded properly, it's force is undeniable. But
-- used clumsily or without care will only hurt the user. Make sure Fade isn't better than the Skulk
-- in every way (notably, vs. Structures). To harass, he must be able to stay out in the field
-- without continually healing at base, and needs to be able to use blink often.
--
-- ========= For more information, visit us at http://www.unknownworlds.com =====================

Script.Load("lua/Utility.lua")
Script.Load("lua/Weapons/Alien/SwipeBlink.lua")
Script.Load("lua/Weapons/Alien/StabBlink.lua")
Script.Load("lua/Weapons/Alien/Metabolize.lua")
Script.Load("lua/Weapons/Alien/Vortex.lua")
Script.Load("lua/Weapons/Alien/ReadyRoomBlink.lua")
Script.Load("lua/Alien.lua")
Script.Load("lua/Mixins/BaseMoveMixin.lua")
Script.Load("lua/Mixins/GroundMoveMixin.lua")
Script.Load("lua/CelerityMixin.lua")
Script.Load("lua/Mixins/JumpMoveMixin.lua")
Script.Load("lua/Mixins/CrouchMoveMixin.lua")
Script.Load("lua/Mixins/CameraHolderMixin.lua")
Script.Load("lua/DissolveMixin.lua")
Script.Load("lua/TunnelUserMixin.lua")
Script.Load("lua/BabblerClingMixin.lua")
Script.Load("lua/RailgunTargetMixin.lua")
Script.Load("lua/IdleMixin.lua")
Script.Load("lua/FadeVariantMixin.lua")
Script.Load("lua/Weapons/PredictedProjectile.lua")
Script.Load("lua/Weapons/Alien/AcidRocket.lua")
--Script.Load("lua/PhaseGateUserMixin.lua")

class 'Fade' (Alien)

Fade.kMapName = "fade"

Fade.kModelName = PrecacheAsset("models/alien/fade/fade.model")
local kViewModelName = PrecacheAsset("models/alien/fade/fade_view.model")
local kFadeAnimationGraph = PrecacheAsset("models/alien/fade/fade.animation_graph")
local kBallFlagAttachPoint = "babbler_attach4"

PrecacheAsset("models/alien/fade/fade.surface_shader")

local kViewOffsetHeight = 1.7
Fade.XZExtents = gFadeXZExtents
Fade.YExtents = gFadeYExtents
Fade.kHealth = kFadeHealth
Fade.kArmor = kFadeArmor
-- ~350 pounds.

local kMass = gFadeMass
local kJumpHeight = gFadeJumpHeight
local kFadeScanDuration = gFadeScanDuration
local kShadowStepCooldown = gFadeShadowStepCooldown
local kShadowStepForce = gFadeShadowStepForce
local kShadowStepSpeed = gFadeShadowStepSpeed
local kMaxSpeed = gFadeMaxSpeed
local kBlinkSpeed = gFadeBlinkSpeed
local kBlinkAcceleration = gFadeBlinkAcceleration
local kBlinkAddAcceleration = gFadeBlinkAddAcceleration
local kMetabolizeAnimationDelay = gFadeMetabolizeAnimationDelay
local kMinEnterEtherealTime = gFadeMinEnterEtherealTime
local kFadeGravityMod = gFadeJumpHeight
local kFadeHealth = gFadeHealth

if Server then
    Script.Load("lua/Fade_Server.lua")
elseif Client then    
    Script.Load("lua/Fade_Client.lua")
end

local networkVars =
{
    isScanned = "boolean",
    shadowStepping = "boolean",
    timeShadowStep = "private compensated time",
    shadowStepDirection = "private vector",
    shadowStepSpeed = "private compensated interpolated float",
    
    etherealStartTime = "private time",
    etherealEndTime = "private time",
    
    -- True when we're moving quickly "through the ether"
    ethereal = "boolean",
    
    landedAfterBlink = "private compensated boolean",  
    
    timeMetabolize = "private compensated time",
    
    timeOfLastPhase = "time",
    hasEtherealGate = "boolean"
    
}

AddMixinNetworkVars(BaseMoveMixin, networkVars)
AddMixinNetworkVars(GroundMoveMixin, networkVars)
AddMixinNetworkVars(JumpMoveMixin, networkVars)
AddMixinNetworkVars(CrouchMoveMixin, networkVars)
AddMixinNetworkVars(CelerityMixin, networkVars)
AddMixinNetworkVars(CameraHolderMixin, networkVars)
AddMixinNetworkVars(DissolveMixin, networkVars)
AddMixinNetworkVars(TunnelUserMixin, networkVars)
AddMixinNetworkVars(BabblerClingMixin, networkVars)
AddMixinNetworkVars(IdleMixin, networkVars)
--AddMixinNetworkVars(PhaseGateUserMixin, networkVars)


function Fade:OnCreate()

    InitMixin(self, BaseMoveMixin, { kGravity = Player.kGravity * kFadeGravityMod })
    InitMixin(self, GroundMoveMixin)
    InitMixin(self, JumpMoveMixin)
    InitMixin(self, CrouchMoveMixin)
    InitMixin(self, CelerityMixin)
    InitMixin(self, CameraHolderMixin, { kFov = kFadeFov })
	InitMixin(self, PredictedProjectileShooterMixin)
	--InitMixin(self, PhaseGateUserMixin)
    
    Alien.OnCreate(self)
    
    InitMixin(self, DissolveMixin)
    InitMixin(self, TunnelUserMixin)
    InitMixin(self, BabblerClingMixin)
    InitMixin(self, FadeVariantMixin)

    if Client then
        InitMixin(self, RailgunTargetMixin)
    end
    
    self.shadowStepDirection = Vector()
    
    if Server then
    
        self.timeLastScan = 0
        self.isBlinking = false
        self.timeShadowStep = 0
        self.shadowStepping = false
        
    end
    
    self.etherealStartTime = 0
    self.etherealEndTime = 0
    self.ethereal = false
    self.landedAfterBlink = true
	
    
end


function Fade:OnInitialized()

    Alien.OnInitialized(self)
    
    self:SetModel(Fade.kModelName, kFadeAnimationGraph)
    
    if Client then
    
        self.blinkDissolve = 0
        
        self:AddHelpWidget("GUIFadeBlinkHelp", 2)
        self:AddHelpWidget("GUITunnelEntranceHelp", 1)
        
    end
    
    InitMixin(self, IdleMixin)
    
end

function Fade:GetShowElectrifyEffect()
    return self.hasEtherealGate or self.electrified
end

function Fade:ModifyJump(input, velocity, jumpVelocity)
    jumpVelocity:Scale(kFadeGravityMod)
end

function Fade:OnDestroy()

    Alien.OnDestroy(self)
    
    if Client then
        self:DestroyTrailCinematic()
    end
    
end

function Fade:GetControllerPhysicsGroup()

    if self.isHallucination then
        return PhysicsGroup.SmallStructuresGroup
    end

    return PhysicsGroup.BigPlayerControllersGroup  
  
end

function Fade:GetInfestationBonus()
    return kFadeInfestationSpeedBonus
end

function Fade:GetCarapaceSpeedReduction()
    return kFadeCarapaceSpeedReduction
end

function Fade:MovementModifierChanged(newMovementModifierState, input)

    if newMovementModifierState and self:GetActiveWeapon() ~= nil then
        local weaponMapName = self:GetActiveWeapon():GetMapName()
        local metabweapon = self:GetWeapon(Metabolize.kMapName)
        if metabweapon and not metabweapon:GetHasAttackDelay() and self:GetEnergy() >= metabweapon:GetEnergyCost() then
            self:SetActiveWeapon(Metabolize.kMapName)
            self:PrimaryAttack()
            if weaponMapName ~= Metabolize.kMapName then
                self.previousweapon = weaponMapName
            end
        end
    end
    
end

function Fade:ModifyCrouchAnimation(crouchAmount)    
    return Clamp(crouchAmount * (1 - ( (self:GetVelocityLength() - kMaxSpeed) / (kMaxSpeed * 0.5))), 0, 1)
end

function Fade:GetHeadAttachpointName()
    return "fade_tongue2"
end

-- Prevents reseting of celerity.
function Fade:OnSecondaryAttack()
end

function Fade:GetBaseArmor()
    return Fade.kArmor
end

function Fade:GetBaseHealth()
    return Fade.kHealth
end

function Fade:GetHealthPerBioMass()
    return kFadeHealthPerBioMass
end

function Fade:GetArmorFullyUpgradedAmount()
    return kFadeArmorFullyUpgradedAmount
end

function Fade:GetMaxViewOffsetHeight()
    return kViewOffsetHeight
end

function Fade:GetViewModelName()
    return self:GetVariantViewModel(self:GetVariant())
end

function Fade:GetCanStep()
    return not self:GetIsBlinking()
end

function Fade:ModifyGravityForce(gravityTable)

    if self:GetIsBlinking() or self:GetIsOnGround() then
        gravityTable.gravity = 0
    end

end

function Fade:GetPerformsVerticalMove()
    return self:GetIsBlinking()
end

function Fade:GetAcceleration()
    return gFadeAccerlation --11
end

function Fade:GetGroundFriction()
    return gFadeGroundFriction --9
end  

function Fade:GetAirControl()
    return gFadeAirControl --40
end   

function Fade:GetAirFriction()
    return (self:GetIsBlinking() or self:GetRecentlyShadowStepped()) and 0 or (0.17  - (GetHasCelerityUpgrade(self) and GetSpurLevel(self:GetTeamNumber()) or 0) * 0.01)
end 

function Fade:ModifyVelocity(input, velocity, deltaTime)

    if self:GetIsBlinking() then
    
        local wishDir = self:GetViewCoords().zAxis
        local maxSpeedTable = { maxSpeed = kBlinkSpeed }
        self:ModifyMaxSpeed(maxSpeedTable, input)  
        local prevSpeed = velocity:GetLength()
        local maxSpeed = math.max(prevSpeed, maxSpeedTable.maxSpeed)
        local maxSpeed = math.min(25, maxSpeed)    
        
        velocity:Add(wishDir * kBlinkAcceleration * deltaTime)
        
        if velocity:GetLength() > maxSpeed then

            velocity:Normalize()
            velocity:Scale(maxSpeed)
            
        end 
        
        -- additional acceleration when holding down blink to exceed max speed
        velocity:Add(wishDir * kBlinkAddAcceleration * deltaTime)
        
    end

end

function Fade:GetIsStabbing()

    local stabWeapon = self:GetWeapon(StabBlink.kMapName)
    return stabWeapon and stabWeapon:GetIsStabbing()    

end

function Fade:GetCanJump()
    return self:GetIsOnGround() and not self:GetIsBlinking() and not self:GetIsStabbing()
end

function Fade:GetIsShadowStepping()
    return false
end

function Fade:GetMaxSpeed(possible)

    if possible then
        return kMaxSpeed
    end
    
    if self:GetIsBlinking() then
        return kBlinkSpeed
    end
    
	if self:GetIsOnFire() then kMaxSpeed = kMaxSpeed * 1.20 end
    -- Take into account crouching. someday
    return kMaxSpeed
    
end

function Fade:GetMass()
    return kMass
end

function Fade:GetJumpHeight()
    return kJumpHeight
end

function Fade:GetIsBlinking()
    return self.ethereal and self:GetIsAlive()
end

function Fade:GetRecentlyBlinked(player)
    return Shared.GetTime() - self.etherealEndTime < kMinEnterEtherealTime
end

function Fade:GetHasShadowStepAbility()
    return self:GetHasOneHive()
end

function Fade:GetHasShadowStepCooldown()
    return self.timeShadowStep + kShadowStepCooldown > Shared.GetTime()
end

function Fade:GetRecentlyShadowStepped()
    return self.timeShadowStep + kShadowStepCooldown * 2 > Shared.GetTime()
end

function Fade:GetMovementSpecialTechId()
    if self:GetCanMetabolizeHealth() then
        return kTechId.MetabolizeHealth
    else
        return kTechId.MetabolizeEnergy
    end
end

function Fade:GetHasMovementSpecial()
    return self:GetHasOneHive()
end

function Fade:GetRebirthLength()
	return gFadeRebirthLength
end
function Fade:GetRedemptionCoolDown()
	return gFadeRedemptionCooldown
end

function Fade:GetMovementSpecialEnergyCost()
    return kMetabolizeEnergyCost
end

function Fade:GetCollisionSlowdownFraction()
    return 0.05
end

function Fade:TriggerShadowStep(direction)

    if not self:GetHasMovementSpecial() then
        return
    end

    if direction:GetLength() == 0 then
        direction.z = 1
    end
    --[[
    if direction.z == 1 then
        direction.x = 0
    end
    --]]
    local movementDirection = self:GetViewCoords():TransformVector(direction)    
    movementDirection:Normalize()

    if not self:GetIsBlinking() and not self:GetHasShadowStepCooldown() and self:GetEnergy() > kFadeShadowStepCost then
    
        local celerityAddSpeed = (GetHasCelerityUpgrade(self) and GetSpurLevel(self:GetTeamNumber()) or 0) * 0.7
    
        -- add small force in the direction we are stepping
        local currentSpeed = movementDirection:DotProduct(self:GetVelocity())
        local shadowStepStrength = math.max(currentSpeed, 11 + celerityAddSpeed) + 0.5
        self:SetVelocity(movementDirection * shadowStepStrength * self:GetSlowSpeedModifier())
        
        self.timeShadowStep = Shared.GetTime()
        self.shadowStepSpeed = kShadowStepSpeed
        self.shadowStepping = true
        self.shadowStepDirection = Vector(movementDirection)
        
        self:TriggerEffects("shadow_step", { effecthostcoords = Coords.GetLookIn(self:GetOrigin(), movementDirection) })
        
        self:DeductAbilityEnergy(kFadeShadowStepCost)
        self:TriggerUncloak()
        
    end
    
end

function Fade:GetHasMetabolizeAnimationDelay()
    return self.timeMetabolize + kMetabolizeAnimationDelay > Shared.GetTime()
end

function Fade:GetCanMetabolizeHealth()
    return self:GetHasTwoHives()
end

function Fade:OverrideInput(input)

    Alien.OverrideInput(self, input)
    
    if self:GetIsBlinking() then
    
        input.move.z = 1
        input.move.x = 0
        
    end
    
    return input
    
end

function Fade:OnProcessMove(input)

    Alien.OnProcessMove(self, input)
    
    if Server then
    
        if self.isScanned and self.timeLastScan + kFadeScanDuration < Shared.GetTime() then
            self.isScanned = false
        end

    end
    
    -- move without manipulating velocity
    if self:GetIsShadowStepping() then
    
        self.shadowStepSpeed = math.max(0, self.shadowStepSpeed - input.time * 90)
        local completedMove, hitEntities, averageSurfaceNormal = self:PerformMovement(self.shadowStepDirection * self.shadowStepSpeed * input.time, 3)
        local breakShadowStep = false
        
        --stop when colliding with an enemy player
        if hitEntities then
        
            for _, entity in ipairs(hitEntities) do
            
                if entity:isa("Player") and GetAreEnemies(self, entity) then
                
                    breakShadowStep = true
                    break
                    
                end
            
            end
            
        end
        
        local enemyTeamNumber = GetEnemyTeamNumber(self:GetTeamNumber())
        
        local function FilterFriendAndDead(entity)
            return HasMixin(entity, "Team") and entity:GetTeamNumber() == enemyTeamNumber and HasMixin(entity, "Live") and entity:GetIsAlive()
        end        
        
        -- trigger break when enemy player is nearby
        if not breakShadowStep and self.shadowStepSpeed < 35 then
            breakShadowStep = #Shared.GetEntitiesWithTagInRange("class:Player", self:GetOrigin(), 1.8, FilterFriendAndDead) > 0
        end
        
        if breakShadowStep then
        
            self.shadowStepping = false
            self.shadowStepSpeed = 0
            local velocity = self:GetVelocity()
            velocity.x = 0
            velocity.z = 0
            self:SetVelocity(velocity)
            
        end
        
    end
        
    if not self:GetHasMetabolizeAnimationDelay() and self.previousweapon ~= nil then
        self:SetActiveWeapon(self.previousweapon)
        self.previousweapon = nil
    end
    
end

function Fade:GetBlinkAllowed()

    local weapons = self:GetWeapons()
    for i = 1, #weapons do
    
        if not weapons[i]:GetBlinkAllowed() then
            return false
        end
        
    end

    return true

end

function Fade:OnScan()

    if Server then
    
        self.timeLastScan = Shared.GetTime()
        self.isScanned = true
        
    end
    
end

function Fade:GetStepHeight()

    if self:GetIsBlinking() then
        return 2
    end
    
    return Player.GetStepHeight()
    
end

function Fade:SetDetected(state)

    if Server then
    
        if state then
        
            self.timeLastScan = Shared.GetTime()
            self.isScanned = true
            
        else
            self.isScanned = false
        end
        
    end
    
end

function Fade:OnUpdateAnimationInput(modelMixin)

    if not self:GetHasMetabolizeAnimationDelay() then
        Alien.OnUpdateAnimationInput(self, modelMixin)

        if self.timeOfLastPhase + 0.5 > Shared.GetTime() then
            modelMixin:SetAnimationInput("move", "teleport")
        end
    else
        local weapon = self:GetActiveWeapon()
        if weapon ~= nil and weapon.OnUpdateAnimationInput and weapon:GetMapName() == Metabolize.kMapName then
            weapon:OnUpdateAnimationInput(modelMixin)
        end
    end

end

function Fade:TriggerBlink()
    self.ethereal = true
    self.landedAfterBlink = false
end

function Fade:OnBlinkEnd()
    self.ethereal = false
end

function Fade:PostUpdateMove(input, runningPrediction)

    if self.shadowStepSpeed == 0 then
        self.shadowStepping = false
    end

end
--[[
function Fade:ModifyAttackSpeed(attackSpeedTable)
    attackSpeedTable.attackSpeed = attackSpeedTable.attackSpeed * 1.06
end
--]]
function Fade:GetEngagementPointOverride()
    return self:GetOrigin() + Vector(0, 0.8, 0)
end

--[[
function Fade:ModifyHeal(healTable)
    Alien.ModifyHeal(self, healTable)
    healTable.health = healTable.health * 1.7
end
--]]

function Fade:OverrideVelocityGoal(velocityGoal)
    
    if not self:GetIsOnGround() and self:GetCrouching() then
        velocityGoal:Scale(0)
    end
    
end
--[[
function Fade:HandleButtons(input)

    Alien.HandleButtons(self, input)
    
    if self:GetIsBlinking() then 
        input.commands = bit.bor(input.commands, Move.Crouch)    
    end

end
--]]
function Fade:OnGroundChanged(onGround, impactForce, normal, velocity)

    Alien.OnGroundChanged(self, onGround, impactForce, normal, velocity)

    if onGround then
        self.landedAfterBlink = true
    end
    
end

function Fade:GetMovementSpecialCooldown()
    local cooldown = 0
    local timeLeft = (Shared.GetTime() - self.timeMetabolize)
    
    local metabolizeWeapon = self:GetWeapon(Metabolize.kMapName)
    local metaDelay = metabolizeWeapon and metabolizeWeapon:GetAttackDelay() or 0
    if timeLeft < metaDelay then
        return Clamp(timeLeft / metaDelay, 0, 1)
    end
    
    return cooldown
end

Shared.LinkClassToMap("Fade", Fade.kMapName, networkVars, true)