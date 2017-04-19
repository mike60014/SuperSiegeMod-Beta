-- ======= Copyright (c) 2003-2011, Unknown Worlds Entertainment, Inc. All rights reserved. =======
--
-- lua\Weapons\Shotgun.lua
--
--    Created by:   Charlie Cleveland (charlie@unknownworlds.com) and
--                  Max McGuire (max@unknownworlds.com)
--
-- ========= For more information, visit us at http://www.unknownworlds.com =====================

--Script.Load("lua/Weapons/Marine/Shotgun_Siege.lua")
Script.Load("lua/Balance.lua")
Script.Load("lua/LiveMixin.lua")
Script.Load("lua/Weapons/Marine/ClipWeapon.lua")
Script.Load("lua/PickupableWeaponMixin.lua")
Script.Load("lua/PointGiverMixin.lua")
Script.Load("lua/AchievementGiverMixin.lua")
Script.Load("lua/Hitreg.lua")
Script.Load("lua/ShotgunVariantMixin.lua")


class 'Shotgun' (ClipWeapon)

Shotgun.kMapName = "shotgun"

Shotgun.kModelName = PrecacheAsset("models/marine/shotgun/shotgun.model")
local kNanoshieldMaterial = PrecacheAsset("Glow/green/green.material")
local kViewModels = GenerateMarineViewModelPaths("shotgun")
local kAnimationGraph = PrecacheAsset("models/marine/shotgun/shotgun_view.animation_graph")

local kMuzzleEffect = PrecacheAsset("cinematics/marine/shotgun/muzzle_flash.cinematic")
local kMuzzleAttachPoint = "fxnode_shotgunmuzzle"

--local kBulletSize = gShotgunPrimaryBulletSize --0.016
kShotgunWeight = gShotgunWeight
kShotgunFireRate = gShotgunPrimaryAttackSpeed
kShotgunDamage = gShotgunPrimaryDamage
kShotgunDamageType = gShotgunPrimaryDamageType
--kShotgunClipSize = gShotgunClipSize
kShotgunBulletsPerShot = gShotgunPrimaryBulletsPerShot
kShotgunSecondaryBulletsPerShot = gShotgunSecondaryBulletsPerShot


local networkVars =
{
    emptyPoseParam = "private float (0 to 1 by 0.01)",
    timeAttackStarted = "time",
}

AddMixinNetworkVars(PickupableWeaponMixin, networkVars)
AddMixinNetworkVars(LiveMixin, networkVars)
AddMixinNetworkVars(PointGiverMixin, networkVars)
AddMixinNetworkVars(AchievementGiverMixin, networkVars)
AddMixinNetworkVars(ShotgunVariantMixin, networkVars)

-- higher numbers reduces the spread
local kPrimarySpreadDistance = gShotgunPrimarySpreadDistance
local kSecondarySpreadDistance = gShotgunSecondarySpreadDistance

--if kPrimarySpreadDistance == nil then kPrimarySpreadDistance = 12 end
--if kSecondarySpreadDistance == nil then kSecondarySpreadDistance = 24 end
Shotgun.kStartOffset = 0
Shotgun.kSpreadVectors =
{
    --GetNormalizedVector(Vector(-0.01, 0.01, kPrimarySpreadDistance)),
    
    GetNormalizedVector(Vector(-0.45, 0.45, kPrimarySpreadDistance)),
    GetNormalizedVector(Vector(0.45, 0.45, kPrimarySpreadDistance)),
    GetNormalizedVector(Vector(0.45, -0.45, kPrimarySpreadDistance)),
    GetNormalizedVector(Vector(-0.45, -0.45, kPrimarySpreadDistance)),
    
    GetNormalizedVector(Vector(-1, 0, kPrimarySpreadDistance)),
    GetNormalizedVector(Vector(1, 0, kPrimarySpreadDistance)),
    GetNormalizedVector(Vector(0, -1, kPrimarySpreadDistance)),
    GetNormalizedVector(Vector(0, 1, kPrimarySpreadDistance)),
    
    GetNormalizedVector(Vector(-0.35, 0, kPrimarySpreadDistance)),
    GetNormalizedVector(Vector(0.35, 0, kPrimarySpreadDistance)),
    GetNormalizedVector(Vector(0, -0.35, kPrimarySpreadDistance)),
    GetNormalizedVector(Vector(0, 0.35, kPrimarySpreadDistance)),
    
    GetNormalizedVector(Vector(-0.8, -0.8, kPrimarySpreadDistance)),
    GetNormalizedVector(Vector(-0.8, 0.8, kPrimarySpreadDistance)),
    GetNormalizedVector(Vector(0.8, 0.8, kPrimarySpreadDistance)),
    GetNormalizedVector(Vector(0.8, -0.8, kPrimarySpreadDistance)),
    
}


Shotgun.kSecondarySpreadVectors =  --Sven-Coop !
{
    GetNormalizedVector(Vector(-0.25, 0.01, kSecondarySpreadDistance)),
    GetNormalizedVector(Vector(-0.5, 0.01, kSecondarySpreadDistance)),
    GetNormalizedVector(Vector(0.5, 0.01, kSecondarySpreadDistance)),
    GetNormalizedVector(Vector(-1, 0.01, kSecondarySpreadDistance)),
    GetNormalizedVector(Vector(1, 0.01, kSecondarySpreadDistance)),
    GetNormalizedVector(Vector(-1.25, 0.01, kSecondarySpreadDistance)),
    GetNormalizedVector(Vector(-1.5, 0.02, kSecondarySpreadDistance)),
    GetNormalizedVector(Vector(1.5, 0.01, kSecondarySpreadDistance)),
    GetNormalizedVector(Vector(-2, 0.01, kSecondarySpreadDistance)),
    GetNormalizedVector(Vector(2, 0.01, kSecondarySpreadDistance)),
}
Shotgun.primaryattackLastRequested = 0
Shotgun.secondaryattackLastRequested = 0
Shotgun.ammo = gShotgunAmmoSize
Shotgun.clip = gShotgunClipSize

function Shotgun:OnCreate()

    ClipWeapon.OnCreate(self)
    
    InitMixin(self, PickupableWeaponMixin)
    InitMixin(self, LiveMixin)
    InitMixin(self, PointGiverMixin)
    InitMixin(self, AchievementGiverMixin)
    InitMixin(self, ShotgunVariantMixin)
    
    self.emptyPoseParam = 0

end

if Client then

    function Shotgun:OnInitialized()
    
        ClipWeapon.OnInitialized(self)
    
    end

end

function Shotgun:GetPrimaryMinFireDelay()
    return gShotgunPrimaryAttackSpeed
end

function Shotgun:GetSecondaryMinFireDelay()
    return gShotgunSecondaryAttackSpeed    
end

function Shotgun:GetPickupOrigin()
    return self:GetCoords():TransformPoint(Vector(0.19319871068000793, 0.0, 0.04182741045951843))
end

function Shotgun:GetAnimationGraphName()
    return ShotgunVariantMixin.kShotgunAnimationGraph
end

function Shotgun:GetViewModelName(sex, variant)
    return kViewModels[sex][variant]
end

function Shotgun:GetDeathIconIndex()
    return kDeathMessageIcon.Shotgun
end

function Shotgun:GetHUDSlot()
    return kPrimaryWeaponSlot
end

function Shotgun:GetClipSize()
    return gShotgunClipSize
end
/*
function Shotgun:GetBulletsPerShot()
    return kShotgunBulletsPerShot
end

function Shotgun:GetSecondaryBulletsPerShot()
    return kShotgunSecondaryBulletsPerShot
end
*/
function Shotgun:GetSecondaryCanInterruptReload()
    return true
end

function Shotgun:GetRange()
    return gShotgunPrimaryRange -- 100
end

-- Only play weapon effects every other bullet to avoid sonic overload
function Shotgun:GetTracerEffectFrequency()
    return 0.5
end

function Shotgun:GetBulletDamage()
    return kShotgunDamage    
end

function Shotgun:GetPrimaryCanInterruptReload()
    return true
end

function Shotgun:GetWeight()
    return gShotgunWeight --kShotgunWeight
end

function Shotgun:UpdateViewModelPoseParameters(viewModel)

    viewModel:SetPoseParam("empty", self.emptyPoseParam)
    
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
    self.emptyPoseParam = 0
end
/*
local function Shotgun:resetAmmoVars(self)
self.ammo = gShotgunAmmoSize
self.clip = gShotgunClipSize
return self

end
*/

local function LoadBullet(self)
    if self.ammo > 0 and self.clip < self:GetClipSize() then
        self.clip = self.clip + 1
        self.ammo = self.ammo - 1
    end
end

function Shotgun:OnTag(tagName)

    PROFILE("Shotgun:OnTag")
    
    local continueReloading = false
    if self:GetIsReloading() and tagName == "reload_end" then
    
        continueReloading = true
        self.reloading = false
        
    end
    
    ClipWeapon.OnTag(self, tagName)
    
    if tagName == "load_shell" then
        LoadBullet(self)
    elseif tagName == "reload_shotgun_start" then
        self:TriggerEffects("shotgun_reload_start")
    elseif tagName == "reload_shotgun_shell" then
        self:TriggerEffects("shotgun_reload_shell")
    elseif tagName == "reload_shotgun_end" then
        self:TriggerEffects("shotgun_reload_end")
    end
    
    if continueReloading then
        local player = self:GetParent()
        if player then
            player:Reload()
        end
    end
    
end

-- used for last effect
function Shotgun:GetEffectParams(tableParams)
    tableParams[kEffectFilterEmpty] = self.clip == 0 --1
end

function Shotgun:OnUpdateAnimationInput(modelMixin)
	--origanim(self, modelMixin)
	local activity = "none"
	if self.secondaryAttacking then
		activity = "primary"
		modelMixin:SetAnimationInput("activity", activity)
	elseif self.primaryAttacking then
		activity = "primary"
		modelMixin:SetAnimationInput("activity", activity)
	end
end

function Shotgun:OnProcessMove(input)
    ClipWeapon.OnProcessMove(self, input)
    self.emptyPoseParam = Clamp(Slerp(self.emptyPoseParam, ConditionalValue(self.clip == 0, 1, 0), input.time * 1), 0, 1)
end

function Shotgun:GetAmmoPackMapName()
    return ShotgunAmmo.kMapName
end    

function Shotgun:GetHasSecondary(player)
    return true
end

function Shotgun:GetSecondaryCanInterruptReload()
    return true
end

function Shotgun:GetViewModelName(sex, variant)
    return kViewModels[sex][variant]
end

function Shotgun:OnPrimaryAttackEnd(player)
    self.primaryAttacking = false
    self.secondaryAttacking = false
    self.timeprimaryAttackEnded = Shared.GetTime()
    ClipWeapon.OnPrimaryAttackEnd(self, player)
	self.emptyPoseParam = 0
	
end

function Shotgun:OnSecondaryAttackEnd(player)
    self.secondaryAttacking = false
    self.primaryAttacking = false
    self.timesecondaryAttackEnded = Shared.GetTime()
    ClipWeapon.OnSecondaryAttackEnd(self, player)
	self.emptyPoseParam = 0
	

end

function Shotgun:ModifyDamageTaken(damageTable, attacker, doer, damageType)
    if damageType ~= kDamageType.Corrode then
        damageTable.damage = 0
    end
end

function Shotgun:GetPrimaryAttacking()
    return self.primaryAttacking
end

function Shotgun:GetSecondaryAttacking()
    return self.secondaryAttacking
end

function Shotgun:OnPrimaryAttack(player)
    local attackAllowed = (not self:GetIsReloading() or self:GetSecondaryCanInterruptReload()) and (not self:GetPrimaryAttackRequiresPress() or not player:GetPrimaryAttackLastFrame())
    
    if attackAllowed and self.GetPrimaryMinFireDelay then
		--attackAllowed = (Shared.GetTime() - self.timeAttackFired) >= self:GetSecondaryMinFireDelay()
		primaryattackAllowed = (Shared.GetTime() - self.secondaryattackLastRequested) >= self:GetSecondaryMinFireDelay()
		secondaryattackAllowed = (Shared.GetTime() - self.primaryattackLastRequested) >= self:GetPrimaryMinFireDelay()
        
        if not attackAllowed and self.OnMaxFireRateExceeded then
            --self:OnMaxFireRateExceeded()
        else
		
		if self:GetIsDeployed() and primaryattackAllowed and secondaryattackAllowed and not self.secondaryAttacking then
		
			self.primaryAttacking = true
			self.primaryattackLastRequested = Shared.GetTime()
			CancelReload(self)
			self:FirePrimary(player)
			self.clip = self.clip - gShotgunPrimaryBulletsClipCost
			
		else
			self:OnPrimaryAttackEnd(player)
		end
		end
	end
	
	attackAllowed = attackAllowed and (primaryattackAllowed and secondaryattackAllowed)
    return self:GetIsDeployed() and not sprintedRecently and attackAllowed

end

function Shotgun:OnSecondaryAttack(player)
    local attackAllowed = (not self:GetIsReloading() or self:GetPrimaryCanInterruptReload()) and (not self:GetSecondaryAttackRequiresPress() or not player:GetSecondaryAttackLastFrame())
    
    if attackAllowed and self.GetSecondaryMinFireDelay then
		--attackAllowed = (Shared.GetTime() - self.timeAttackFired) >= self:GetSecondaryMinFireDelay()
		primaryattackAllowed = (Shared.GetTime() - self.secondaryattackLastRequested) >= self:GetSecondaryMinFireDelay()
		secondaryattackAllowed = (Shared.GetTime() - self.primaryattackLastRequested) >= self:GetPrimaryMinFireDelay()
        
        if not primaryattackAllowed or not secondaryattackAllowed and self.OnMaxFireRateExceeded then
            --self:OnMaxFireRateExceeded()
		else
			if self:GetIsDeployed() and primaryattackAllowed and secondaryattackAllowed and not self.primaryAttacking then
				self.secondaryAttacking = true
				self.secondaryattackLastRequested = Shared.GetTime()
				CancelReload(self)
				self:FireSecondary(player)
				self.clip = self.clip - gShotgunSecondaryBulletsClipCost
			else
				self:OnSecondaryAttackEnd(player)
			end
		end
	end
	
	attackAllowed = false
    return self:GetIsDeployed() and not sprintedRecently and attackAllowed

end

function Shotgun:FirePrimary(player)

    local viewAngles = player:GetViewAngles()
    viewAngles.roll = NetworkRandom() * math.pi * 2

    local shootCoords = viewAngles:GetCoords()

    -- Filter ourself out of the trace so that we don't hit ourselves.
    local filter = EntityFilterTwo(player, self)
    local range = gShotgunPrimaryRange --self:GetRange()
    
    if GetIsVortexed(player) then
        range = gShotgunPrimaryRangeWhileVortexed --5
    end
    
    local numberBullets = gShotgunPrimaryBulletsPerShot
    local startPoint = player:GetEyePos()
    
    self:TriggerEffects("shotgun_attack_sound")
    self:TriggerEffects("shotgun_attack")
    
    for bullet = 1, math.min(numberBullets, #self.kSpreadVectors) do
    
        if not self.kSpreadVectors[bullet] then
            break
        end    
    
        local spreadDirection = shootCoords:TransformVector(self.kSpreadVectors[bullet])

        local endPoint = startPoint + spreadDirection * range
        startPoint = player:GetEyePos() + shootCoords.xAxis * self.kSpreadVectors[bullet].x * self.kStartOffset + shootCoords.yAxis * self.kSpreadVectors[bullet].y * self.kStartOffset
        
        local targets, trace, hitPoints = GetBulletTargets(startPoint, endPoint, spreadDirection, gShotgunPrimaryBulletSize, filter)
        
        local damage = gShotgunPrimaryDamage

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

            self:ApplyBulletGameplayEffects(player, target, hitPoint - hitOffset, direction, gShotgunPrimaryDamage, "", showTracer and i == numTargets)
            
            local client = Server and player:GetClient() or Client
            if not Shared.GetIsRunningPrediction() and client.hitRegEnabled then
                RegisterHitEvent(player, bullet, startPoint, trace, gShotgunPrimaryDamage)
            end
        
        end
        
    end

end

function Shotgun:FireSecondary(player)

	local viewAngles = player:GetViewAngles()
    viewAngles.roll = NetworkRandom() * math.pi * 2

    local shootCoords = viewAngles:GetCoords()

    -- Filter ourself out of the trace so that we don't hit ourselves.
    local filter = EntityFilterTwo(player, self)
    local range = gShotgunSecondaryRange--self:GetRange()
    
    if GetIsVortexed(player) then
        range = gShotgunSecondaryRangeWhileVortexed
    end
    
    local numberBullets = gShotgunSecondaryBulletsPerShot
    local startPoint = player:GetEyePos()
    
    self:TriggerEffects("shotgun_attack_sound")
    self:TriggerEffects("shotgun_attack")
    
    for bullet = 1, math.min(numberBullets, #self.kSecondarySpreadVectors) do
    
        if not self.kSecondarySpreadVectors[bullet] then
            break
        end    
    
        local spreadDirection = shootCoords:TransformVector(self.kSecondarySpreadVectors[bullet])

        local endPoint = startPoint + spreadDirection * range
        startPoint = player:GetEyePos() + shootCoords.xAxis * self.kSecondarySpreadVectors[bullet].x * self.kStartOffset + shootCoords.yAxis * self.kSecondarySpreadVectors[bullet].y * self.kStartOffset
        
        local targets, trace, hitPoints = GetBulletTargets(startPoint, endPoint, spreadDirection, gShotgunSecondaryBulletSize, filter)
        
        local damage = gShotgunSecondaryDamage

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

            self:ApplyBulletGameplayEffects(player, target, hitPoint - hitOffset, direction, gShotgunSecondaryDamage, "", showTracer and i == numTargets)
            player.secondaryAttackLastFrame = Shared.GetTime()
            player.secondaryAttackLastFrame = Shared.GetTime()
            local client = Server and player:GetClient() or Client
            if not Shared.GetIsRunningPrediction() and client.hitRegEnabled then
                RegisterHitEvent(player, bullet, startPoint, trace, gShotgunSecondaryDamage)
            end
        
        end
        
    end
end

if Client then

    function Shotgun:GetBarrelPoint()
    
        local player = self:GetParent()
        if player then
        
            local origin = player:GetEyePos()
            local viewCoords= player:GetViewCoords()
            
            return origin + viewCoords.zAxis * 0.4 + viewCoords.xAxis * -0.18 + viewCoords.yAxis * -0.2
            
        end
        
        return self:GetOrigin()
        
    end
    
    function Shotgun:GetUIDisplaySettings()
        return { xSize = 256, ySize = 128, script = "lua/GUIShotgunDisplay.lua", variant = self:GetShotgunVariant() }
    end
	
    function Shotgun:OnUpdateRender()
        ClipWeapon.OnUpdateRender( self )
		
		if parent and parent:GetIsLocalPlayer() then
            local viewModel = parent:GetViewModelEntity()
            if viewModel and viewModel:GetRenderModel() then
                
                local clip = self:GetClip()
                local time = Shared.GetTime()
                
                if self.lightCount ~= clip and 
                    not self.lightChangeTime or self.lightChangeTime + 0.15 < time 
                then
                    self.lightCount = clip
                    self.lightChangeTime = time
                end
                
                viewModel:InstanceMaterials()
                viewModel:GetRenderModel():SetMaterialParameter("ammo", self.lightCount or gShotgunClipSize) --6 )
                
            end
        end
        local showMaterial = true --not self:GetInAttackMode()
    /*
        local model = self:GetRenderModel()
        if model then

            model:SetMaterialParameter("glowIntensity", 4)

            if showMaterial then
                
                if not self.hallucinationMaterial then
                    self.hallucinationMaterial = AddMaterial(model, kNanoshieldMaterial)
                end
                
                self:SetOpacity(0.5, "hallucination")
            
            else
            
                if self.hallucinationMaterial then
                    RemoveMaterial(model, self.hallucinationMaterial)
                    self.hallucinationMaterial = nil
                end//
                
                self:SetOpacity(1, "hallucination")
            
            end //showma
            
        end//omodel
	*/
end //up render
end -- client

function Shotgun:GetCanTakeDamageOverride()
    return self:GetParent() == nil
end

function Shotgun:GetIdleAnimations(index)
    local animations = {"idle", "idle_check", "idle_clean"}
    return animations[index]
end

Shared.LinkClassToMap("Shotgun", Shotgun.kMapName, networkVars)
--Shared.LinkClassToMap("Shotgun", Shotgun.kMapName, networkVars)