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
Rifle.primaryattackLastRequested = 0 --Shared.GetTime()
Rifle.secondaryattackLastRequested = 0
local kViewModels = GenerateMarineViewModelPaths("rifle")
local kAnimationGraph = PrecacheAsset("models/marine/rifle/rifle_view.animation_graph")
local kButtRange = 1.1
local kNumberOfVariants = 3
local gRifleRandomSpread = math.random(30,40)


Rifle.kStartOffset = 0 --  0.01
--Print(meth.random())
--DebugPrint(math.random(0,100))

local kPrimaryRange = gRiflePrimaryRange --100
-- 4 degrees in NS1
local kPrimarySpread = gRiflePrimarySpreadDistance --Math.Radians(2.8)
local kPrimaryBulletSize = gRiflePrimaryBulletSize
local kSecondaryBulletSize = gRifleSecondaryBulletSize

local kSecondaryRange = gRifleSecondaryRange

/*
local kSecondarySpread = Math.Radians(gRifleRandomSpread) * gRifleSecondaryPrecisionRatio
local kSecondarySpreadDistance = Math.Radians(gRifleRandomSpread) * gRifleSecondaryPrecisionRatio

Rifle.kSecondarySpreadVectors = --Sven-Coop !
{

    GetNormalizedVector(Vector(-0.01, 0.01, kSecondarySpreadDistance)),
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
*/

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

Rifle.primaryAttacking = false
Rifle.secondaryAttacking = false

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
    
    --self.skipDraw = false
    
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
    modelMixin:SetAnimationInput("reload_speed", 1) --Reload speed?
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
    return kDeathMessageIcon.Rifle
end

function Rifle:GetHUDSlot()
    return kPrimaryWeaponSlot
end

function Rifle:GetClipSize()
    return gRifleClipSize
end

function Rifle:GetSpread()
    return gRiflePrimarySpreadDistance
end

function Rifle:GetPrimaryMinFireDelay()
    return gRiflePrimaryFireRate    
end

function Rifle:GetSecondaryMinFireDelay()
    return gRifleSecondaryFireRate    
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

function Rifle:GetNeedsAmmo(includeClip)
    return (includeClip and (self:GetClip() < self:GetClipSize())) or (self:GetAmmo() < self:GetMaxAmmo())
end

function Rifle:GetSecondaryDamagePerShot(target, endPoint)
	return gRifleSecondaryDamagePerShot
end

function Rifle:GetBulletsPerShotSecondary()
	return gRifleSecondaryBulletsPerShot
end

function Rifle:GetMaxClips()
	return gRifleMaxClips
end

function Rifle:GetMaxAmmo()
	return gRifleMaxAmmo
end

function Rifle:GetTracerEffectFrequency()
    return gRiflePrimaryTracerEffectRate --0.5
end

function Rifle:GetSecondaryCanInterruptReload()
    return false --true
end

function Rifle:OnPrimaryAttackEnd(player)
    self.primaryAttacking = false
    self.secondaryAttacking = false
    self.timeprimaryAttackEnded = Shared.GetTime()
    ClipWeapon.OnPrimaryAttackEnd(self, player)
	self.emptyPoseParam = 0
	
end

function Rifle:OnSecondaryAttackEnd(player)
    self.secondaryAttacking = false
    self.primaryAttacking = false
    self.timesecondaryAttackEnded = Shared.GetTime()
    ClipWeapon.OnSecondaryAttackEnd(self, player)
	self.emptyPoseParam = 0
	

end

local function CancelReload(self)

    if self:GetIsReloading() then
    
        self.reloading = false
        if Client then
            self:TriggerEffects("reload_cancel")
        end
        if Server then
            self:TriggerEffects("reload_cancel")
        end
    end
    --self.emptyPoseParam = 0
end

function Rifle:GetIdleAnimations(index)
    local animations = {"idle", "idle_brush", "idle_lower"}
    return animations[index]
end

function Rifle:OnMaxFireRateExceeded()

end

function Rifle:OnPrimaryAttack(player)
    local attackAllowed = (not self:GetIsReloading() or self:GetPrimaryCanInterruptReload()) and (not self:GetPrimaryAttackRequiresPress() or not player:GetPrimaryAttackLastFrame())
    
	if attackAllowed and (self.clip == 0) then
	
        self:TriggerEffects("reload")
		--self:TriggerEffects("rifle_reload_start")
		self.reloading = true
		--player.Reload()
	
    elseif attackAllowed and self.GetPrimaryMinFireDelay and (self.clip > 0) then
		primaryattackAllowed = (Shared.GetTime() - self.secondaryattackLastRequested) >= self:GetSecondaryMinFireDelay()
		secondaryattackAllowed = (Shared.GetTime() - self.primaryattackLastRequested) >= self:GetPrimaryMinFireDelay()
		
        if not attackAllowed and self.OnMaxFireRateExceeded then
            --self:OnMaxFireRateExceeded()
        else
			if Server then UpdateSoundType(self, player) end
		if self:GetIsDeployed() and primaryattackAllowed and secondaryattackAllowed and not self.secondaryAttacking and not self:GetIsReloading() then
		
			if Server then UpdateSoundType(self, player) end
			self.primaryAttacking = true
			CancelReload(self)
			ClipWeapon.OnPrimaryAttack(self, player)
			self:FirePrimary(player)
			self.primaryattackLastRequested = Shared.GetTime()
			self.clip = self.clip - gRiflePrimaryBulletsPerShot
		else
		end
		end
	end
	self:OnPrimaryAttackEnd(player)
	
	attackAllowed = attackAllowed and primaryattackAllowed and secondaryattackAllowed
    return self:GetIsDeployed() and not sprintedRecently and attackAllowed
end


function Rifle:OnSecondaryAttack(player)
    local attackAllowed = (not self:GetIsReloading() or self:GetPrimaryCanInterruptReload()) and (not self:GetSecondaryAttackRequiresPress() or not player:GetSecondaryAttackLastFrame())
    if attackAllowed and (self.clip < gRifleSecondaryBulletsPerShot) then
	 
        self:TriggerEffects("reload")
		--self:TriggerEffects("rifle_reload_start")
		self.reloading = true
		--player.Reload()
	
    elseif attackAllowed and self.GetSecondaryMinFireDelay and (self.clip > 0) then
		--attackAllowed = (Shared.GetTime() - self.timeAttackFired) >= self:GetSecondaryMinFireDelay()
		primaryattackAllowed = (Shared.GetTime() - self.secondaryattackLastRequested) >= self:GetSecondaryMinFireDelay()
		secondaryattackAllowed = (Shared.GetTime() - self.primaryattackLastRequested) >= self:GetPrimaryMinFireDelay()
        
		if not primaryattackAllowed or not secondaryattackAllowed and self.OnMaxFireRateExceeded then
			--self:OnMaxFireRateExceeded()
		else
			if self:GetIsDeployed() and primaryattackAllowed and secondaryattackAllowed and not self.primaryAttacking and not self:GetIsReloading() then
				--return self:GetIsDeployed() and not sprintedRecently and attackAllowed
				
				if Server then UpdateSoundType(self, player) end
				self.secondaryAttacking = true
				--ClipWeapon.OnPrimaryAttack(self, player)
				CancelReload(self)
				ClipWeapon.OnPrimaryAttack(self, player)
				self:FireSecondary(player)
				self.secondaryattackLastRequested = Shared.GetTime()
				self.clip = self.clip - gRifleSecondaryBulletsPerShot
				
			end
		end
	end
	self:OnSecondaryAttackEnd(player)
	
	attackAllowed = attackAllowed and secondaryattackAllowed and primaryattackAllowed
    return self:GetIsDeployed() and not sprintedRecently and attackAllowed
end

function Rifle:FirePrimary(player)

    local numberBullets = gRiflePrimaryBulletsPerShot

    for bullet = 1, numberBullets do
    /*
        if not self.kSecondarySpreadVectors[bullet] then
            break
        end
		*/    
	--self:TriggerEffects("spikes_attack")
    --self:TriggerEffects("rifle_attack_sound")
    self:TriggerEffects("rifle_attack")
	local viewAngles = player:GetViewAngles()
    viewAngles.roll = NetworkRandom() * math.pi * 2
	local kRifleRandomX = math.random(-10,10) * 0.1 --3.0 thru 3.0
	local kRifleRandomY = math.random(-20,20) * 0.1 --5.0 thru 5.0
	local kRifleRandomSpread = math.random(55,65)
	local kRiflePrimarySpreadDistance = Math.Radians(kRifleRandomSpread)
	local kRiflePrimarySpreadDistanceX = Math.Radians(kRifleRandomX) --20
	local kRiflePrimarySpreadDistanceY = Math.Radians(kRifleRandomY) --20
    local shootCoords = viewAngles:GetCoords()
    local filter = EntityFilterTwo(player, self)
    local range = gRiflePrimaryRange --self:GetRange()
    local startPoint = player:GetEyePos()
    local bulletSize = gRiflePrimaryBulletSize
	local spreadDirection = shootCoords:TransformVector(Vector(kRiflePrimarySpreadDistanceX,kRiflePrimarySpreadDistanceY,kRiflePrimarySpreadDistance))


	local endPoint = startPoint + spreadDirection * range
	startPoint = player:GetEyePos() + shootCoords.xAxis * kRiflePrimarySpreadDistanceX * self.kStartOffset + shootCoords.yAxis * kRiflePrimarySpreadDistanceY * self.kStartOffset
	
	local targets, trace, hitPoints = GetBulletTargets(startPoint, endPoint, spreadDirection, bulletSize, filter)

		    -- Filter ourself out of the trace so that we don't hit ourselves.

		HandleHitregAnalysis(player, startPoint, endPoint, trace)        
		
		local direction = (trace.endPoint - startPoint):GetUnit()
		local hitOffset = direction * kHitEffectOffset
		local impactPoint = trace.endPoint - hitOffset
		local effectFrequency = self:GetTracerEffectFrequency()
		local showTracer = bullet % effectFrequency == 0
	
        local numTargets = #targets
	
		if numTargets == 0 then
			self:ApplyBulletGameplayEffects(player, nil, impactPoint, direction, 0, trace.surface, showTracer)
		end
		
		if Client and showTracer then
			TriggerFirstPersonTracer(self, impactPoint)
		end
		
		for i = 1, numTargets do

			local target = targets[i]
			local hitPoint = hitPoints[i]

			self:ApplyBulletGameplayEffects(player, target, hitPoint - hitOffset, direction, gRiflePrimaryDamagePerShot, "", showTracer and i == numTargets)
			player.primaryAttackLastFrame = Shared.GetTime()
			local client = Server and player:GetClient() or Client
			if not Shared.GetIsRunningPrediction() and client.hitRegEnabled then
				RegisterHitEvent(player, bullet, startPoint, trace, gRiflePrimaryDamagePerShot)
			end
		
		end
        
    end
	
    
    --end

end


function Rifle:FireSecondary(player)

    self:TriggerEffects("Rifle_attack")
    self:TriggerEffects("Rifle_attack_sound")
    --self:TriggerEffects("spikes_attack")
	--if self.secondaryattackLastRequested + gRifleSecondaryAttackSpeed <= Shared.GetTime() then return end
	local viewAngles = player:GetViewAngles()
    viewAngles.roll = NetworkRandom() * math.pi * 2
	
	local kRifleRandomX = math.random(-100,100) * 0.01 --0.0 thru 3.0
	local kRifleRandomY = math.random(-75,75) * 0.01 --0.0 thru 3.0
	local kRifleRandomSpread = math.random(30,40)
	local kRifleSecondarySpreadDistance = Math.Radians(kRifleRandomSpread)
	local kRifleSecondarySpreadDistanceX = Math.Radians(kRifleRandomX) --20
	local kRifleSecondarySpreadDistanceY = Math.Radians(kRifleRandomY) --20

    local shootCoords = viewAngles:GetCoords()

    -- Filter ourself out of the trace so that we don't hit ourselves.
    local filter = EntityFilterTwo(player, self)
    local range = gRifleSecondaryRange
    
    
    local numberBullets = gRifleSecondaryBulletsPerShot
    local startPoint = player:GetEyePos()
    
    
    for bullet = 1, numberBullets do
    /*
        if not self.kSecondarySpreadVectors[bullet] then
            break
        end
		*/
        --local spreadDirection = CalculateSpread(SecshootCoords, gRifleSecondarySpreadDistance * (ConditionalValue(player and player.GetIsInterrupted and player:GetIsInterrupted(), 8, 1)), NetworkRandom)

        local spreadDirection = shootCoords:TransformVector(Vector(kRifleSecondarySpreadDistanceX,kRifleSecondarySpreadDistanceY,kRifleSecondarySpreadDistance)) --self.kSecondarySpreadVectors[bullet])

        local endPoint = startPoint + spreadDirection * range
        --startPoint = player:GetEyePos() + shootCoords.xAxis * self.kSecondarySpreadVectors[bullet].x * self.kStartOffset + shootCoords.yAxis * self.kSecondarySpreadVectors[bullet].y * self.kStartOffset
        startPoint = player:GetEyePos() + shootCoords.xAxis * kRifleSecondarySpreadDistanceX * self.kStartOffset + shootCoords.yAxis * kRifleSecondarySpreadDistanceY * self.kStartOffset
        
        local targets, trace, hitPoints = GetBulletTargets(startPoint, endPoint, spreadDirection, gRifleSecondaryBulletSize, filter)
        
        --local damage = gRifleSecondaryDamagePerShot

        HandleHitregAnalysis(player, startPoint, endPoint, trace)        
        
        local direction = (trace.endPoint - startPoint):GetUnit()
        local hitOffset = direction * kHitEffectOffset
        local impactPoint = trace.endPoint - hitOffset
        local effectFrequency = self:GetTracerEffectFrequency()
        local showTracer = bullet % effectFrequency == 0
        
        local numTargets = #targets
        
        if numTargets == 0 then
            self:ApplyBulletGameplayEffects(player, nil, impactPoint, direction, 0, trace.surface, showTracer)
        end
        
        if Client and showTracer then
            TriggerFirstPersonTracer(self, impactPoint)
        end

        for i = 1, numTargets do

            local target = targets[i]
            local hitPoint = hitPoints[i]

            self:ApplyBulletGameplayEffects(player, target, hitPoint - hitOffset, direction, gRifleSecondaryDamagePerShot, "", showTracer and i == numTargets)
            player.secondaryAttackLastFrame = Shared.GetTime()
            local client = Server and player:GetClient() or Client
            if not Shared.GetIsRunningPrediction() and client.hitRegEnabled then
                RegisterHitEvent(player, bullet, startPoint, trace, gRifleSecondaryDamagePerShot)
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
    
    --Seconday Attack
    function Rifle:OnClientSecondaryAttackStart()
        
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

    
    function Rifle:OnClientSecondaryAttackEnd()
    
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
    
    function Rifle:OnClientSecondaryAttacking(deltaTime)

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
    
    function Rifle:GetTriggerSecondaryEffects()
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