-- ======= Copyright (c) 2003-2013, Unknown Worlds Entertainment, Inc. All rights reserved. =====
--
-- lua\Skulk.lua
--
--    Created by:   Charlie Cleveland (charlie@unknownworlds.com)
--                  Andreas Urwalek (andi@unknownworlds.com)
--
-- ========= For more information, visit us at http://www.unknownworlds.com =====================

Script.Load("lua/Utility.lua")
Script.Load("lua/Weapons/Alien/BiteLeap.lua")
Script.Load("lua/Weapons/Alien/Parasite.lua")
Script.Load("lua/Weapons/Alien/XenocideLeap.lua")
Script.Load("lua/Weapons/Alien/ReadyRoomLeap.lua")
Script.Load("lua/Alien.lua")
Script.Load("lua/Mixins/BaseMoveMixin.lua")
Script.Load("lua/Mixins/GroundMoveMixin.lua")
Script.Load("lua/Mixins/CrouchMoveMixin.lua")
Script.Load("lua/Mixins/JumpMoveMixin.lua")
Script.Load("lua/CelerityMixin.lua")
Script.Load("lua/Mixins/CameraHolderMixin.lua")
Script.Load("lua/WallMovementMixin.lua")
Script.Load("lua/DissolveMixin.lua")
Script.Load("lua/BabblerClingMixin.lua")
Script.Load("lua/TunnelUserMixin.lua")
Script.Load("lua/RailgunTargetMixin.lua")
Script.Load("lua/IdleMixin.lua")
Script.Load("lua/SkulkVariantMixin.lua")

class 'Skulk' (Alien)

Skulk.kMapName = "skulk"

Skulk.kModelName = PrecacheAsset("models/alien/skulk/skulk.model")
local kViewModelName = PrecacheAsset("models/alien/skulk/skulk_view.model")
local kSkulkAnimationGraph = PrecacheAsset("models/alien/skulk/skulk.animation_graph")

-- Balance, movement, animation
Skulk.kViewOffsetHeight = gSkulkViewOffsetHeight

Skulk.kHealth = gSkulkHealth --kSkulkHealth
Skulk.kArmor = gSkulkArmor --kSkulkArmor

local kDashSound = PrecacheAsset("sound/NS2.fev/alien/skulk/full_speed")

local kLeapForce = gSkulkLeapForce
local kLeapVerticalForce = gSkulkLeapVerticalForce
local kLeapTime = gSkulkLeapTime

Skulk.kMaxSpeed = gSkulkMaxMovementSpeed
Skulk.kSneakSpeedModifier = gSkulkSneakSpeedModifier

local kBallFlagAttachPoint = "babbler_attach2"

local kMass = gSkulkMass -- ~100 pounds
-- How big the spheres are that are casted out to find walls, "feelers".
-- The size is calculated so the "balls" touch each other at the end of their range
local kNormalWallWalkFeelerSize = gSkulkNormalWallWalkFeelerSize
local kNormalWallWalkRange = gSkulkNormalWallWalkRange

-- jump is valid when you are close to a wall but not attached yet at this range
local kJumpWallRange = gSkulkJumpWallRange
local kJumpWallFeelerSize = gSkulkJumpWallFeelerSize

Skulk.kXExtents = gSkulkXExtents
Skulk.kYExtents = gSkulkYExtents
Skulk.kZExtents = gSkulkZExtents

Skulk.kMaxSneakOffset = gSkulkMaxSneakOffset

Skulk.kWallJumpInterval = gSkulkWallJumpInterval
Skulk.kWallJumpForce = gSkulkWallJumpForce
Skulk.kMinWallJumpForce = gSkulkMinWallJumpForce
Skulk.kVerticalWallJumpForce = gSkulkVerticalWallJumpForce

Skulk.kWallJumpMaxSpeed = gSkulkWallJumpMaxSpeed
Skulk.kWallJumpMaxSpeedCelerityBonus = gSkulkWallJumpMaxSpeedCelerityBonus

if Server then
    Script.Load("lua/Skulk_Server.lua", true)
elseif Client then
    Script.Load("lua/Skulk_Client.lua", true)
end

local networkVars =
{
    wallWalking = "compensated boolean",
    timeLastWallWalkCheck = "private compensated time",
    leaping = "compensated boolean",
    timeOfLeap = "private compensated time",
    timeOfLastJumpLand = "private compensated time",
    timeLastWallJump = "private compensated time",
    jumpLandSpeed = "private compensated float",
    dashing = "compensated boolean",    
    timeOfLastPhase = "private time",
    -- sneaking (movement modifier) skulks starts to trail their body behind them
    sneakOffset = "compensated interpolated float (0 to 1 by 0.04)"
}

AddMixinNetworkVars(BaseMoveMixin, networkVars)
AddMixinNetworkVars(GroundMoveMixin, networkVars)
AddMixinNetworkVars(JumpMoveMixin, networkVars)
AddMixinNetworkVars(CrouchMoveMixin, networkVars)
AddMixinNetworkVars(CelerityMixin, networkVars)
AddMixinNetworkVars(CameraHolderMixin, networkVars)
AddMixinNetworkVars(DissolveMixin, networkVars)
AddMixinNetworkVars(BabblerClingMixin, networkVars)
AddMixinNetworkVars(TunnelUserMixin, networkVars)
AddMixinNetworkVars(IdleMixin, networkVars)
AddMixinNetworkVars(SkulkVariantMixin, networkVars)


function Skulk:GetRedemptionCoolDown()
	return 20
end

function Skulk:GetRebirthLength()
	return 2
end


function Skulk:OnCreate()

    InitMixin(self, BaseMoveMixin, { kGravity = Player.kGravity })
    InitMixin(self, GroundMoveMixin)
    InitMixin(self, JumpMoveMixin)
    InitMixin(self, CrouchMoveMixin)
    InitMixin(self, CelerityMixin)
    InitMixin(self, CameraHolderMixin, { kFov = kSkulkFov })
    InitMixin(self, WallMovementMixin)
    InitMixin(self, SkulkVariantMixin)
    
    Alien.OnCreate(self)

    InitMixin(self, DissolveMixin)
    InitMixin(self, BabblerClingMixin)
    InitMixin(self, TunnelUserMixin)
    
    if Client then
        InitMixin(self, RailgunTargetMixin)
        self.timeDashChanged = 0
    end
    
    self.wallWalking = false
    self.wallWalkingNormalGoal = Vector.yAxis
    self.leaping = false
    self.timeLastWallJump = 0
     
    self.sneakOffset = 0
    
end

function Skulk:OnInitialized()

    Alien.OnInitialized(self)
    
    -- Note: This needs to be initialized BEFORE calling SetModel() below
    -- as SetModel() will call GetHeadAngles() through SetPlayerPoseParameters()
    -- which will cause a script error if the Skulk is wall walking BEFORE
    -- the Skulk is initialized on the client.
    self.currentWallWalkingAngles = Angles(0.0, 0.0, 0.0)
    
    self:SetModel(self:GetVariantModel(), kSkulkAnimationGraph)
    
    if Client then
    
        self.currentCameraRoll = 0
        self.goalCameraRoll = 0
        
        self:AddHelpWidget("GUIEvolveHelp", 2)
        self:AddHelpWidget("GUISkulkParasiteHelp", 1)
        self:AddHelpWidget("GUISkulkLeapHelp", 2)
        self:AddHelpWidget("GUIMapHelp", 1)
        self:AddHelpWidget("GUITunnelEntranceHelp", 1)
        
    end

    InitMixin(self, IdleMixin)
    
end

function Skulk:GetCarapaceSpeedReduction()
    return kSkulkCarapaceSpeedReduction
end

function Skulk:OnDestroy()

    Alien.OnDestroy(self)

    if Client then
    
        if self.playingDashSound then
        
            Shared.StopSound(self, kDashSound)
            self.playingDashSound = false
        
        end
    
    end

end

function Skulk:GetBaseArmor()
    return Skulk.kArmor
end

function Skulk:GetCrouchSpeedScalar()
    return gSkulkCrouchSpeedScalar
end

function Skulk:GetBaseHealth()
    return Skulk.kHealth
end

function Skulk:GetHealthPerBioMass()
    return gSkulkHealthPerBioMass
end

function Skulk:GetArmorFullyUpgradedAmount()
    return  --gSkulkArmorFullyUpgradedAmount
end

function Skulk:GetMaxViewOffsetHeight()
    return Skulk.kViewOffsetHeight
end

function Skulk:GetCrouchShrinkAmount()
    return 0
end

function Skulk:GetExtentsCrouchShrinkAmount()
    return 0
end

function Skulk:OnLeap()

    local velocity = self:GetVelocity() * 0.5
    local forwardVec = self:GetViewAngles():GetCoords().zAxis
    local newVelocity = velocity + GetNormalizedVectorXZ(forwardVec) * kLeapForce
    
    -- Add in vertical component.
    newVelocity.y = kLeapVerticalForce * forwardVec.y + kLeapVerticalForce * 0.5 + ConditionalValue(velocity.y < 0, velocity.y, 0)
    
    self:SetVelocity(newVelocity)
    
    self.leaping = true
    self.wallWalking = false
    self:DisableGroundMove(0.2)
    
    self.timeOfLeap = Shared.GetTime()
    
end

function Skulk:GetRecentlyWallJumped()
    return self.timeLastWallJump + Skulk.kWallJumpInterval > Shared.GetTime()
end

function Skulk:GetCanWallJump()

    local wallWalkNormal = self:GetAverageWallWalkingNormal(kJumpWallRange, kJumpWallFeelerSize)
    if wallWalkNormal then
        return wallWalkNormal.y < 0.5
    end
    
    return false

end

function Skulk:GetViewModelName()
    return self:GetVariantViewModel(self:GetVariant())
end

function Skulk:GetCanJump()
    local canWallJump = self:GetCanWallJump()
    return self:GetIsOnGround() or canWallJump
end

function Skulk:GetIsWallWalking()
    return self.wallWalking
end

function Skulk:GetIsLeaping()
    return self.leaping
end

function Skulk:GetIsWallWalkingPossible() 
    return not self:GetRecentlyJumped() and not self:GetCrouching()
end

local function PredictGoal(self, velocity)

    PROFILE("Skulk:PredictGoal")

    local goal = self.wallWalkingNormalGoal
    if velocity:GetLength() > 1 and not self:GetIsGround() then

        local movementDir = GetNormalizedVector(velocity)
        local trace = Shared.TraceCapsule(self:GetOrigin(), movementDir * 2.5, Skulk.kXExtents, 0, CollisionRep.Move, PhysicsMask.Movement, EntityFilterOne(self))

        if trace.fraction < 1 and not trace.entity then
            goal = trace.normal    
        end

    end

    return goal

end

function Skulk:GetPlayFootsteps()
    return self:GetVelocityLength() > .75 and self:GetIsOnGround() and self:GetIsAlive() and not self.movementModiferState
end

function Skulk:GetTriggerLandEffect()
    local xzSpeed = self:GetVelocity():GetLengthXZ()
    return Alien.GetTriggerLandEffect(self) and (not self.movementModiferState or xzSpeed > 7)
end

-- Update wall-walking from current origin
function Skulk:PreUpdateMove(input, runningPrediction)

    PROFILE("Skulk:PreUpdateMove")
    --[[
    local dashDesired = bit.band(input.commands, Move.MovementModifier) ~= 0 and self:GetVelocity():GetLength() > 4
    if not self.dashing and dashDesired and self:GetEnergy() > 15 then
        self.dashing = true    
    elseif self.dashing and not dashDesired then
        self.dashing = false
    end
    
    if self.dashing then    
        self:DeductAbilityEnergy(input.time * 30)    
    end
    
    if self:GetEnergy() == 0 then
        self.dashing = false
    end
    --]]
    if self:GetCrouching() then
        self.wallWalking = false
    end

    if self.wallWalking then

        -- Most of the time, it returns a fraction of 0, which means
        -- trace started outside the world (and no normal is returned)
        local goal = self:GetAverageWallWalkingNormal(kNormalWallWalkRange, kNormalWallWalkFeelerSize)
        if goal ~= nil then
        
            self.wallWalkingNormalGoal = goal
            self.wallWalking = true

        else
            self.wallWalking = false
        end
    
    end
    
    if not self:GetIsWallWalking() then
        -- When not wall walking, the goal is always directly up (running on ground).
        self.wallWalkingNormalGoal = Vector.yAxis
    end

    if self.leaping and Shared.GetTime() > self.timeOfLeap + kLeapTime then
        self.leaping = false
    end
        
    self.currentWallWalkingAngles = self:GetAnglesFromWallNormal(self.wallWalkingNormalGoal or Vector.yAxis) or self.currentWallWalkingAngles

    -- adjust the sneakOffset so sneaking skulks can look around corners without having to expose themselves too much
    local delta = input.time * math.min(1, self:GetVelocityLength())
    if self.movementModiferState then
        if self.sneakOffset < Skulk.kMaxSneakOffset then
            self.sneakOffset = math.min(Skulk.kMaxSneakOffset, self.sneakOffset + delta)
        end
    else
        if self.sneakOffset > 0 then
            self.sneakOffset = math.max(0, self.sneakOffset - delta)
        end
    end
    
end

function Skulk:GetRollSmoothRate()
    return 5
end

function Skulk:GetPitchSmoothRate()
    return 3
end

function Skulk:GetSlerpSmoothRate()
    return 5
end

function Skulk:GetAngleSmoothRate()
    return 6
end

function Skulk:GetCollisionSlowdownFraction()
    return 0.15
end

function Skulk:GetDesiredAngles(deltaTime)
    return self.currentWallWalkingAngles
end 

function Skulk:GetHeadAngles()

    if self:GetIsWallWalking() then
        -- When wallwalking, the angle of the body and the angle of the head is very different
        return self:GetViewAngles()
    else
        return self:GetViewAngles()
    end

end

function Skulk:GetAngleSmoothingMode()

    if self:GetIsWallWalking() then
        return "quatlerp"
    else
        return "euler"
    end

end

function Skulk:GetIsUsingBodyYaw()
    return not self:GetIsWallWalking()
end

function Skulk:OnJump( modifiedVelocity )

    self.wallWalking = false

    local material = self:GetMaterialBelowPlayer()    
    
    local currentSpeed = modifiedVelocity:GetLengthXZ()
    local maxWallJumpSpeed = self:GetMaxWallJumpSpeed()
            
    if currentSpeed > maxWallJumpSpeed * 0.95 then
        self:TriggerEffects("jump_best", {surface = material})          
    elseif currentSpeed > maxWallJumpSpeed * 0.75 then
        self:TriggerEffects("jump_good", {surface = material})       
    end
    
    self:TriggerEffects("jump", {surface = material})

    
end

function Skulk:OnWorldCollision(normal, impactForce, newVelocity)

    PROFILE("Skulk:OnWorldCollision")

    self.wallWalking = self:GetIsWallWalkingPossible() and normal.y < 0.5
    
end

function Skulk:GetMaxSpeed(possible)

    if possible then return Skulk.kMaxSpeed end
    
    local maxspeed = Skulk.kMaxSpeed
    
    if self.movementModiferState then maxspeed = maxspeed * Skulk.kSneakSpeedModifier end
	if self:GetIsOnFire() then maxspeed = maxspeed * gSkulkOnFireSpeedModifier end
	
    return maxspeed
    
end

function Skulk:ModifyCelerityBonus(celerityBonus)
    
    if self.movementModiferState then
        celerityBonus = celerityBonus * Skulk.kSneakSpeedModifier
    end
    
    return celerityBonus
    
end

function Skulk:GetCelerityBonus()
    
end

function Skulk:GetMass()
    return kMass
end

function Skulk:OverrideUpdateOnGround(onGround)
    return onGround or self:GetIsWallWalking()
end

function Skulk:ModifyGravityForce(gravityTable)

    if self:GetIsWallWalking() and not self:GetCrouching() then
        gravityTable.gravity = 0

    elseif self:GetIsOnGround() then
        gravityTable.gravity = 0
        
    end

end

function Skulk:GetJumpHeight()
    return Skulk.kJumpHeight
end

function Skulk:GetPerformsVerticalMove()
    return self:GetIsWallWalking()
end

function Skulk:GetMaxWallJumpSpeed()
    local celerityMod = (GetHasCelerityUpgrade(self) and GetSpurLevel(self:GetTeamNumber()) or 0) * Skulk.kWallJumpMaxSpeedCelerityBonus/3.0
    return Skulk.kWallJumpMaxSpeed + celerityMod
end

function Skulk:ModifyJump(input, velocity, jumpVelocity)

    if self:GetCanWallJump() then
    
        local direction = input.move.z == -1 and -1 or 1
    
        -- we add the bonus in the direction the move is going
        local viewCoords = self:GetViewAngles():GetCoords()
        self.bonusVec = viewCoords.zAxis * direction
        self.bonusVec.y = 0
        self.bonusVec:Normalize()
        
        jumpVelocity.y = 3 + math.min(1, 1 + viewCoords.zAxis.y) * 2

        local fraction = 1 - Clamp( velocity:GetLengthXZ() / self:GetMaxWallJumpSpeed(), 0, 1)        
        
        local force = math.max(Skulk.kMinWallJumpForce, Skulk.kWallJumpForce * fraction)
          
        self.bonusVec:Scale(force)      

        if not self:GetRecentlyWallJumped() then
        
            self.bonusVec.y = viewCoords.zAxis.y * Skulk.kVerticalWallJumpForce
            jumpVelocity:Add(self.bonusVec)

        end
        
        self.timeLastWallJump = Shared.GetTime()
        
    end
    
end

-- The Skulk movement should factor in the vertical velocity
-- only when wall walking.
function Skulk:GetMoveSpeedIs2D()
    return not self:GetIsWallWalking()
end

function Skulk:GetAcceleration()
    return gSkulkAcceleration
end

function Skulk:GetAirControl()
    return gSkulkAirControl
end

function Skulk:GetGroundTransistionTime()
    return gSkulkGroundTransistionTime
end

function Skulk:GetAirAcceleration()
    return gSkulkAirAcceleration
end

function Skulk:GetAirFriction()
    return 0.055 - (GetHasCelerityUpgrade(self) and GetSpurLevel(self:GetTeamNumber()) or 0) * 0.009
end 

function Skulk:GetGroundFriction()
    return gSkulkGroundFriction
end

function Skulk:GetCanStep()
    return not self:GetIsWallWalking()
end

function Skulk:OnUpdateAnimationInput(modelMixin)

    PROFILE("Skulk:OnUpdateAnimationInput")
    
    Alien.OnUpdateAnimationInput(self, modelMixin)
    
    if self:GetIsLeaping() then
        modelMixin:SetAnimationInput("move", "leap")
    end
    
    modelMixin:SetAnimationInput("onwall", self:GetIsWallWalking() and not self:GetIsJumping())
    
end

local function UpdateDashEffects(self)

    if Client then
    
        local dashing = self:GetVelocity():GetLengthXZ() > 8.7

        if self.clientDashing ~= dashing then
        
            self.timeDashChanged = Shared.GetTime()
            self.clientDashing = dashing
            
        end
        
        local soundAllowed = not GetHasSilenceUpgrade(self) or self.silenceLevel < 3        

        if self:GetIsAlive() and dashing and not self.playingDashSound and (Shared.GetTime() - self.timeDashChanged) > 1 then
        
            local volume = GetHasSilenceUpgrade(self) and 1 - (self.silenceLevel / 3) or 1        
            local localPlayerScalar = Client.GetLocalPlayer() == self and 0.26 or 1        
            volume = volume * localPlayerScalar
        
            Shared.PlaySound(self, kDashSound, volume)
            self.playingDashSound = true
        
        elseif not self:GetIsAlive() or ( not dashing and self.playingDashSound ) then    
        
            Shared.StopSound(self, kDashSound)
            self.playingDashSound = false
        
        end
    
    end

end

function Skulk:OnUpdate(deltaTime)
    
    Alien.OnUpdate(self, deltaTime)
    
    --UpdateDashEffects(self)
    
end

function Skulk:GetMovementSpecialTechId()
    return kTechId.Sneak
end

function Skulk:GetHasMovementSpecial()
    return self.movementModiferState
end

function Skulk:OnProcessMove(input)

    Alien.OnProcessMove(self, input)
    
    --UpdateDashEffects(self)

end

function Skulk:GetIsSmallTarget()
    return true
end

local kSkulkEngageOffset = Vector(0, 0.5, 0)
function Skulk:GetEngagementPointOverride()
    return self:GetOrigin() + kSkulkEngageOffset
end

function Skulk:OnAdjustModelCoords(modelCoords)
    
    -- when sneaking, push the model back along the z-axis so the eyepoint of the model is actually close to the eyes.
    modelCoords.origin = modelCoords.origin - modelCoords.zAxis * self.sneakOffset
    
    return modelCoords
    
end

Shared.LinkClassToMap("Skulk", Skulk.kMapName, networkVars, true)

if Server then
    Event.Hook("Console_skulk_sneak", function(client, dist)
        if Shared.GetTestsEnabled() then
            if dist then
                Skulk.kMaxSneakOffset = tonumber(dist)
            end
            Log("Skulk.kMaxSneakOffset = %s", Skulk.kMaxSneakOffset)
        end
    end)
end -- Server