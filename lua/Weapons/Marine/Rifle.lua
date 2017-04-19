-- ======= Copyright (c) 2003-2011, Unknown Worlds Entertainment, Inc. All rights reserved. =======
--
-- lua\Weapons\Rifle.lua
--
--    Created by:   Charlie Cleveland (charlie@unknownworlds.com) and
--                  Max McGuire (max@unknownworlds.com)
--
-- ========= For more information, visit us at http://www.unknownworlds.com =====================

Script.Load("lua/Weapons/Marine/ClipWeapon.lua")
Script.Load("lua/PickupableWeaponMixin.lua")
Script.Load("lua/LiveMixin.lua")
Script.Load("lua/EntityChangeMixin.lua")
Script.Load("lua/Weapons/ClientWeaponEffectsMixin.lua")
Script.Load("lua/RifleVariantMixin.lua")

class 'Rifle' (ClipWeapon)

Rifle.kMapName = "rifle"

Rifle.kModelName = PrecacheAsset("models/marine/rifle/rifle.model")
Rifle.primaryattackLastRequested = 0
Rifle.secondaryattackLastRequested = 0
local kViewModels = GenerateMarineViewModelPaths("rifle")
local kAnimationGraph = PrecacheAsset("models/marine/rifle/rifle_view.animation_graph")
local kButtRange = 1.1
local kNumberOfVariants = 3

local kPrimaryRange = gRiflePrimaryRange --100
-- 4 degrees in NS1
local kPrimarySpread = gRiflePrimarySpreadDistance --Math.Radians(2.8)
local kPrimaryBulletSize = gRiflePrimaryBulletSize

local kSecondaryRange = gRifleSecondaryRange
local kSecondarySpread = gRifleSecondarySpreadDistance 
local kSecondarySpreadDistance = gRifleSecondarySpreadDistance
local kSecondaryBulletSize = gRifleSecondaryBulletSize

Rifle.kStartOffset = 0 --  0.01
Rifle.kSecondarySpreadVectors = --Sven-Coop !
{
    GetNormalizedVector(Vector(-0.25, 0.01, kSecondarySpreadDistance)),
    GetNormalizedVector(Vector(-0.5, 0.01, kSecondarySpreadDistance)),
    GetNormalizedVector(Vector(0.5, 0.01, kSecondarySpreadDistance)),
    GetNormalizedVector(Vector(-0.25, 0.01, kSecondarySpreadDistance)),
    GetNormalizedVector(Vector(-0.5, 0.01, kSecondarySpreadDistance)),
    GetNormalizedVector(Vector(0.5, 0.01, kSecondarySpreadDistance)),
    GetNormalizedVector(Vector(-0.25, 0.01, kSecondarySpreadDistance)),
    GetNormalizedVector(Vector(-0.5, 0.01, kSecondarySpreadDistance)),
    GetNormalizedVector(Vector(0.5, 0.01, kSecondarySpreadDistance)),
    GetNormalizedVector(Vector(-0.25, 0.01, kSecondarySpreadDistance)),
    --GetNormalizedVector(Vector(-1, 0.01, kSecondarySpreadDistance)),
    --GetNormalizedVector(Vector(1, 0.01, kSecondarySpreadDistance)),
    --GetNormalizedVector(Vector(-1.25, 0.01, kSecondarySpreadDistance)),
    --GetNormalizedVector(Vector(-1.5, 0.02, kSecondarySpreadDistance)),
    --GetNormalizedVector(Vector(1.5, 0.01, kSecondarySpreadDistance)),
    --GetNormalizedVector(Vector(-2, 0.01, kSecondarySpreadDistance)),
    --GetNormalizedVector(Vector(2, 0.01, kSecondarySpreadDistance)),
}

local kSingleShotSounds = { "sound/NS2.fev/marine/rifle/fire_single", "sound/NS2.fev/marine/rifle/fire_single_2", "sound/NS2.fev/marine/rifle/fire_single_3" }
for k, v in ipairs(kSingleShotSounds) do PrecacheAsset(v) end

local kLoopingSounds = { "sound/NS2.fev/marine/rifle/fire_14_sec_loop", "sound/NS2.fev/marine/rifle/fire_loop_2", "sound/NS2.fev/marine/rifle/fire_loop_3",
                         "sound/NS2.fev/marine/rifle/fire_loop_1_upgrade_1", "sound/NS2.fev/marine/rifle/fire_loop_2_upgrade_1", "sound/NS2.fev/marine/rifle/fire_loop_3_upgrade_1",
                         "sound/NS2.fev/marine/rifle/fire_loop_1_upgrade_3", "sound/NS2.fev/marine/rifle/fire_loop_2_upgrade_3", "sound/NS2.fev/marine/rifle/fire_loop_3_upgrade_3" }

for k, v in ipairs(kLoopingSounds) do PrecacheAsset(v) end

local kEndSounds = { "sound/NS2.fev/marine/rifle/end", "sound/NS2.fev/marine/rifle/end_upgrade_1", "sound/NS2.fev/marine/rifle/end_upgrade_3"  }
for k, v in ipairs(kEndSounds) do PrecacheAsset(v) end

local kLoopingShellCinematic = PrecacheAsset("cinematics/marine/rifle/shell_looping.cinematic")
local kLoopingShellCinematicFirstPerson = PrecacheAsset("cinematics/marine/rifle/shell_looping_1p.cinematic")
local kShellEjectAttachPoint = "fxnode_riflecasing"

local kMuzzleCinematics = {
    PrecacheAsset("cinematics/marine/rifle/muzzle_flash.cinematic"),
    PrecacheAsset("cinematics/marine/rifle/muzzle_flash2.cinematic"),
    PrecacheAsset("cinematics/marine/rifle/muzzle_flash3.cinematic"),
}

local networkVars =
{
    soundType = "integer (1 to 9)",
    shooting = "boolean",
    skipDraw = "boolean",
}

AddMixinNetworkVars(LiveMixin, networkVars)
AddMixinNetworkVars(RifleVariantMixin, networkVars)

local kMuzzleEffect = PrecacheAsset("cinematics/marine/rifle/muzzle_flash.cinematic")
local kMuzzleAttachPoint = "fxnode_riflemuzzle"

local function CheckForDestroyedEffects(self)
    if self.muzzleCinematic and not IsValid(self.muzzleCinematic) then
        self.muzzleCinematic = nil
    end
     if self.shellsCinematic and not IsValid(self.shellsCinematic) then
        self.shellsCinematic = nil
    end
end

local function DestroyMuzzleEffect(self)

    if self.muzzleCinematic then
        Client.DestroyCinematic(self.muzzleCinematic)            
    end
    
    self.muzzleCinematic = nil
    self.activeCinematicName = nil

end

local function DestroyShellEffect(self)

    if self.shellsCinematic then
        Client.DestroyCinematic(self.shellsCinematic)            
    end
    
    self.shellsCinematic = nil

end

local function CreateMuzzleEffect(self)

    local player = self:GetParent()

    if player then

        local cinematicName = kMuzzleCinematics[math.ceil(self.soundType / 3)]
        self.activeCinematicName = cinematicName
        self.muzzleCinematic = CreateMuzzleCinematic(self, cinematicName, cinematicName, kMuzzleAttachPoint, nil, Cinematic.Repeat_Endless)
        self.firstPersonLoaded = player:GetIsLocalPlayer() and player:GetIsFirstPerson()
    
    end

end

local function CreateShellCinematic(self)

    local parent = self:GetParent()

    if parent and Client.GetLocalPlayer() == parent then
        self.loadedFirstPersonShellEffect = true
    else
        self.loadedFirstPersonShellEffect = false
    end

    if self.loadedFirstPersonShellEffect then
        self.shellsCinematic = Client.CreateCinematic(RenderScene.Zone_ViewModel)        
        self.shellsCinematic:SetCinematic(kLoopingShellCinematicFirstPerson)
    else
        self.shellsCinematic = Client.CreateCinematic(RenderScene.Zone_Default)
        self.shellsCinematic:SetCinematic(kLoopingShellCinematic)
    end    
    
    self.shellsCinematic:SetRepeatStyle(Cinematic.Repeat_Endless)
    
    if self.loadedFirstPersonShellEffect then    
        self.shellsCinematic:SetParent(parent:GetViewModelEntity())
    else
        self.shellsCinematic:SetParent(self)
    end
    
    self.shellsCinematic:SetCoords(Coords.GetIdentity())
    
    if self.loadedFirstPersonShellEffect then  
        self.shellsCinematic:SetAttachPoint(parent:GetViewModelEntity():GetAttachPointIndex(kShellEjectAttachPoint))
    else    
        self.shellsCinematic:SetAttachPoint(self:GetAttachPointIndex(kShellEjectAttachPoint))
    end    

    self.shellsCinematic:SetIsActive(false)

end

function Rifle:OnCreate()

    ClipWeapon.OnCreate(self)
    
    InitMixin(self, PickupableWeaponMixin)
    InitMixin(self, EntityChangeMixin)
    InitMixin(self, LiveMixin)
    InitMixin(self, RifleVariantMixin)
    
    if Client then
        InitMixin(self, ClientWeaponEffectsMixin)
    elseif Server then
        self.soundVariant = Shared.GetRandomInt(1, kNumberOfVariants)
        self.soundType = self.soundVariant
    end
    
    self.skipDraw = false
    
end

function Rifle:OnDestroy()

    ClipWeapon.OnDestroy(self)
    
    DestroyMuzzleEffect(self)
    DestroyShellEffect(self)
    
end

if Client then

    function Rifle:OnInitialized()
    
        ClipWeapon.OnInitialized(self)
    
    end

end

local function UpdateSoundType(self, player)

    local upgradeLevel = 0
    
    if player.GetWeaponUpgradeLevel then
        upgradeLevel = math.max(0, player:GetWeaponUpgradeLevel() - 1)
    end

    self.soundType = self.soundVariant + upgradeLevel * kNumberOfVariants

end

function Rifle:GetPickupOrigin()
    return self:GetCoords():TransformPoint(Vector(0.08637750148773193, 0.0058140382170677185, -0.13895681500434875))
end

function Rifle:GetPrimaryEffectRate()
	return gRiflePrimaryEffectRate --0.08
end

function Rifle:SetGunLoopParam(viewModel, paramName, rateOfChange)

    local current = viewModel:GetPoseParam(paramName)
    -- 0.5 instead of 1 as full arm_loop is intense.
    local new = Clamp(current + rateOfChange, 0, 0.5)
    viewModel:SetPoseParam(paramName, new)
    
end

function Rifle:UpdateViewModelPoseParameters(viewModel)

    local attacking = self:GetPrimaryAttacking()
    local sign = (attacking and 1) or 0
    
    self:SetGunLoopParam(viewModel, "arm_loop", sign)
    
end

function Rifle:OnUpdateAnimationInput(modelMixin)

    PROFILE("Rifle:OnUpdateAnimationInput")
    
    ClipWeapon.OnUpdateAnimationInput(self, modelMixin)
    
    modelMixin:SetAnimationInput("gl", false)
    modelMixin:SetAnimationInput("reload_speed", 1)
    modelMixin:SetAnimationInput("skip_draw", self.skipDraw)

end

function Rifle:GetAmmoPackMapName()
    return RifleAmmo.kMapName
end

function Rifle:OnHolster(player)
    
    CheckForDestroyedEffects(self)
    DestroyMuzzleEffect(self)
    DestroyShellEffect(self)
    ClipWeapon.OnHolster(self, player)
    self.skipDraw = false
    
end

function Rifle:OnHolsterClient()

    CheckForDestroyedEffects(self) 
    DestroyMuzzleEffect(self)
    DestroyShellEffect(self)
    ClipWeapon.OnHolsterClient(self)
    
end

function Rifle:GetAnimationGraphName()
    return RifleVariantMixin.kRifleAnimationGraph
end

function Rifle:GetViewModelName(sex, variant)
    return kViewModels[sex][variant]
end

function Rifle:GetDeathIconIndex()

    if self:GetSecondaryAttacking() then
        return kDeathMessageIcon.RifleButt
    end
    return kDeathMessageIcon.Rifle
    
end

function Rifle:GetHUDSlot()
    return kPrimaryWeaponSlot
end

function Rifle:GetClipSize()
    return gRifleClipSize
end

function Rifle:GetSpread()
    return kPrimarySpread
end

function Rifle:GetPrimaryMinFireDelay()
    return gRiflePrimaryFireRate    
end

function Rifle:GetSecondryMinFireDelay()
    return gRifleSecondaryFireRate    
end

function Rifle:GetSecondaryAttackLastFrame()
	return 
end

function Rifle:GetSecondaryEffectRate()
	return gRifleSecondaryEffectRate --0.45 --0.08
end

function Rifle:GetTriggerSecondaryEffects()
	return not self:GetIsReloading() and self.shooting
end

function Rifle:GetBulletSize()
	return kPrimaryBulletSize or kSecondaryBulletSize
end

function Rifle:GetBulletDamage(target, endPoint)
    return gRiflePrimaryDamagePerShot --kRifleDamage
end

function Rifle:GetRange()
    return gRiflePrimaryRange--kPrimaryRange
end

function Rifle:GetSecondaryRange()
    return gRifleSecondaryRange--kSecondaryRange
end

function Rifle:GetWeight()
    return kRifleWeight
end

function Rifle:GetBulletsPerShotPrimary()
	return gRiflePrimaryBulletsPerShot
end

function Rifle:GetSecondaryDamagePerShot(target, endPoint)
	return gRifleSecondaryDamagePerShot
end

function Rifle:GetBulletsPerShotSecondary()
	return gRifleSecondaryBulletsPerShot
end

function Rifle:GetSecondaryCanInterruptReload()
    return false --true
end

function Rifle:GetIdleAnimations(index)
    local animations = {"idle", "idle_brush", "idle_lower"}
    return animations[index]
end
/*
function Rifle:PerformMeleeAttack(player)

    player:TriggerEffects("rifle_alt_attack")
    
    AttackMeleeCapsule(self, player, kRifleMeleeDamage, kButtRange, nil, true)
    
end

*/

function Rifle:OnPrimaryAttack(player)
local attackAllowed = (not self:GetIsReloading() or self:GetSecondaryCanInterruptReload()) and (not self:GetSecondaryAttackRequiresPress() or not player:GetSecondaryAttackLastFrame()) --player:GetPrimaryAttackLastFrame())
    
    if attackAllowed and self.GetPrimaryMinFireDelay and self.GetSecondaryMinFireDelay then
		--attackAllowed = (Shared.GetTime() - self.secondaryattackLastRequested()) >= self.GetSecondaryMinFireDelay()  --self:GetPrimaryMinFireDelay()
		SecattackAllowed = (Shared.GetTime() - self.secondaryattackLastRequested) >= self:GetSecondaryMinFireDelay()
		PrimattackAllowed = (Shared.GetTime() - self.primaryattackLastRequested) >= self:GetPrimaryMinFireDelay()
        
        if not PrimattackAllowed or not SecattackAllowed and self.OnMaxFireRateExceeded then
            --self:OnMaxFireRateExceeded()
        end
		
		if self:GetIsDeployed() and (SecattackAllowed or PrimattackAllowed) and not self.primaryAttacking  then
		
			self.primaryAttacking = true
			self.primaryattackLastRequested = Shared.GetTime()
			CancelReload(self)
			self:PrimaryFire(player)
			self.clip = self.clip - gRiflePrimaryBulletsPerShot
			
		else
			self:OnPrimaryAttackEnd(player)
		end
	end
	attackAllowed = attackAllowed and (PrimattackAllowed and SecattackAllowed)
	
    return self:GetIsDeployed() and not sprintedRecently and attackAllowed

end
/*
function Rifle:OnTag(tagName)

    PROFILE("Rifle:OnTag")

    ClipWeapon.OnTag(self, tagName)
    
    if tagName == "hit" then
    
        --self.shooting = false
    
        local player = self:GetParent()
        if player then
            --self:PerformMeleeAttack(player)
            self:OnSecondaryAttack(player)
        end
        
    end
    
    if tagName == "deploy_end" then
        self.skipDraw = false
    end

end
*/

function Rifle:OnSecondaryAttack(player)
    local attackAllowed = (not self:GetIsReloading() or self:GetSecondaryCanInterruptReload()) and (not self:GetSecondaryAttackRequiresPress() or not player:GetSecondaryAttackLastFrame()) --player:GetPrimaryAttackLastFrame())
    
    if attackAllowed and self.GetPrimaryMinFireDelay and self.GetSecondaryMinFireDelay then
		--attackAllowed = (Shared.GetTime() - self.secondaryattackLastRequested()) >= self.GetSecondaryMinFireDelay()  --self:GetPrimaryMinFireDelay()
		PrimattackAllowed = (Shared.GetTime() - self.primaryattackLastRequested) >= self:GetPrimaryMinFireDelay()
		SecattackAllowed = (Shared.GetTime() - self.secondaryattackLastRequested) >= self:GetSecondaryMinFireDelay()
        
        if not PrimattackAllowed or not SecattackAllowed and self.OnMaxFireRateExceeded then
            --self:OnMaxFireRateExceeded()
        end
		
		if self:GetIsDeployed() and  (SecattackAllowed or PrimattackAllowed) and not self.primaryAttacking  then
		
			self.secondaryAttacking = true
			self.secondaryattackLastRequested = Shared.GetTime()
			CancelReload(self)
			self:FireSecondary(player)
			self.clip = self.clip - gRifleSecondaryBulletsPerShot
			
		else
			self:OnSecondaryAttackEnd(player)
		end
	end
	
	attackAllowed = attackAllowed and (PrimattackAllowed and SecattackAllowed)
    return self:GetIsDeployed() and not sprintedRecently and attackAllowed

end


function Rifle:FireSecondary(player)

	--if self.secondaryattackLastRequested + gRifleSecondaryAttackSpeed <= Shared.GetTime() then return end
	local SecviewAngles = player:GetViewAngles()
    viewAngles.roll = NetworkRandom() * math.pi * 2

    local SecshootCoords = viewAngles:GetCoords()

    -- Filter ourself out of the trace so that we don't hit ourselves.
    local Secfilter = EntityFilterTwo(player, self)
    local Secrange = self:GetRange()
    
    if GetIsVortexed(player) then
        Secrange = gRifleSecondaryRangeWhileVortexed
    end
    
    local SecnumberBullets = gRifleSecondaryBulletsPerShot
    local SecstartPoint = player:GetEyePos()
    
    --self:TriggerEffects("Rifle_attack_sound")
    --self:TriggerEffects("Rifle_attack")
    
    self:TriggerEffects("shotgun_attack_sound")
    self:TriggerEffects("shotgun_attack")
    for bullet = 1, math.min(numberBullets, #self.kSecondarySpreadVectors) do
    
        if not self.kSecondarySpreadVectors[bullet] then
            break
        end    
    
        local SecspreadDirection = SecshootCoords:TransformVector(self.kSecondarySpreadVectors[bullet])

        local SecendPoint = SecstartPoint + SecspreadDirection * Secrange
        startPoint = player:GetEyePos() + SecshootCoords.xAxis * self.kSecondarySpreadVectors[bullet].x * self.kStartOffset + SecshootCoords.yAxis * self.kSecondarySpreadVectors[bullet].y * self.kStartOffset
        
        local Sectargets, Sectrace, SechitPoints = GetBulletTargets(startPoint, SecendPoint, SecspreadDirection, gRifleSecondaryBulletSize, Secfilter)
        
        --local damage = gRifleSecondaryDamagePerShot

        HandleHitregAnalysis(player, SecstartPoint, SecendPoint, Sectrace)        
            
        local Secdirection = (trace.endPoint - startPoint):GetUnit()
        local SechitOffset = Secdirection * kHitEffectOffset
        local SecimpactPoint = trace.endPoint - SechitOffset
        local SeceffectFrequency = self:GetTracerEffectFrequency()
        local SecshowTracer = bullet % effectFrequency == 0
        
        local SecnumTargets = #Sectargets
        
        if numTargets == 0 then
            self:ApplyBulletGameplayEffects(player, nil, SecimpactPoint, Secdirection, 0, trace.surface, showTracer)
        end
        
        if Client and showTracer then
            TriggerFirstPersonTracer(self, SecimpactPoint)
        end

        for i = 1, SecnumTargets do

            local Sectarget = Sectargets[i]
            local SechitPoint = SechitPoints[i]

            self:ApplyBulletGameplayEffects(player, Sectarget, SechitPoint - hitOffset, direction, gRifleSecondaryDamagePerShot, "", showTracer and i == numTargets)
            player.secondaryAttackLastFrame = Shared.GetTime()
            local client = Server and player:GetClient() or Client
            if not Shared.GetIsRunningPrediction() and client.hitRegEnabled then
                RegisterHitEvent(player, Secbullet, SecstartPoint, Sectrace, gRifleSecondaryDamagePerShot)
            end
        
        end
        
    end

end


if Client then

    function Rifle:OnClientPrimaryAttackStart()
        
        CheckForDestroyedEffects(self)
        
        -- TODO re-enable the single shot, see why it was removed at all :/
        StartSoundEffectAtOrigin(kSingleShotSounds[math.ceil(self.soundType / 3)], self:GetOrigin())
        
        Shared.PlaySound(self, kLoopingSounds[self.soundType])
        self.clientSoundTypePlaying = self.soundType
        
        local player = self:GetParent()
        
        if not self.muzzleCinematic then            
            CreateMuzzleEffect(self)                
        elseif player then
        
            local cinematicName = kMuzzleCinematics[math.ceil(self.soundType / 3)]
            local useFirstPerson = player:GetIsLocalPlayer() and player:GetIsFirstPerson()
            
            if cinematicName ~= self.activeCinematicName or self.firstPersonLoaded ~= useFirstPerson then
            
                DestroyMuzzleEffect(self)
                CreateMuzzleEffect(self)
                
            end
            
        end
            
        -- CreateMuzzleCinematic() can return nil in case there is no parent or the parent is invisible (for alien commander for example)
        if self.muzzleCinematic then
            self.muzzleCinematic:SetIsVisible(true)
        end
        
        if player then
        
            local useFirstPerson = player == Client.GetLocalPlayer()
            
            if useFirstPerson ~= self.loadedFirstPersonShellEffect then
                DestroyShellEffect(self)
            end
        
            if not self.shellsCinematic then
                CreateShellCinematic(self)
            end
        
            self.shellsCinematic:SetIsActive(true)

        end
        
    end
    
    -- needed for first person muzzle effect since it is attached to the view model entity: view model entity gets cleaned up when the player changes (for example becoming a commander and logging out again)
    -- this results in viewmodel getting destroyed / recreated -> cinematic object gets destroyed which would result in an invalid handle.
    function Rifle:OnParentChanged(oldParent, newParent)
        
        ClipWeapon.OnParentChanged(self, oldParent, newParent)
        
        CheckForDestroyedEffects(self)
        DestroyMuzzleEffect(self)
        DestroyShellEffect(self)
        
    end
    
    function Rifle:OnClientPrimaryAttackEnd()
    
        CheckForDestroyedEffects(self)
    
        -- Just assume the looping sound is playing.
        Shared.StopSound(self, kLoopingSounds[self.soundType])
        Shared.PlaySound(self, kEndSounds[math.ceil(self.soundType / 3)])
        
        if self.muzzleCinematic then
            self.muzzleCinematic:SetIsVisible(false)
        end
        
        if self.shellsCinematic then
            self.shellsCinematic:SetIsActive(false)
        end
        
    end
    
    function Rifle:OnClientPrimaryAttacking(deltaTime)

        -- Update weapon sounds if the weapon upgrade level has changed
        if self.clientSoundTypePlaying and self.clientSoundTypePlaying ~= self.soundType then

            Shared.StopSound(self, kLoopingSounds[self.clientSoundTypePlaying])
            
            Shared.PlaySound(self, kLoopingSounds[self.soundType])
            self.clientSoundTypePlaying = self.soundType
            
        end
        
    end
    
    
    function Rifle:GetTriggerPrimaryEffects()
        return not self:GetIsReloading() and self.shooting
    end
    
    function Rifle:GetBarrelPoint()
    
        local player = self:GetParent()
        if player then
        
            local origin = player:GetEyePos()
            local viewCoords= player:GetViewCoords()
            
            return origin + viewCoords.zAxis * 0.4 + viewCoords.xAxis * -0.15 + viewCoords.yAxis * -0.22
            
        end
        
        return self:GetOrigin()
        
    end
    
    function Rifle:GetUIDisplaySettings()
        return { xSize = 256, ySize = 417, script = "lua/GUIRifleDisplay.lua", variant = self:GetRifleVariant() }
    end
    
end

function Rifle:ModifyDamageTaken(damageTable, attacker, doer, damageType)

    if damageType ~= kDamageType.Corrode then
        damageTable.damage = 0
    end
    
end

function Rifle:GetCanTakeDamageOverride()
    return self:GetParent() == nil
end

if Server then

    function Rifle:OnKill()
        DestroyEntity(self)
    end
    
    function Rifle:GetSendDeathMessageOverride()
        return false
    end 
    
end

function Rifle:UseLandIntensity()
    return true
end

Shared.LinkClassToMap("Rifle", Rifle.kMapName, networkVars)