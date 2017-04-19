Script.Load("lua/Additions/Functions.lua")

/*
function Rifle:OnTag(tagName)

    PROFILE("Rifle:OnTag")

    ClipWeapon.OnTag(self, tagName)
    
    if tagName == "hit" then
    
        self.shooting = false
    
        local player = self:GetParent()
        if player then
            --self:PerformMeleeAttack(player)
			self.OnSecondaryAttack(player)
        end
        
    end
    
    if tagName == "deploy_end" then
        self.skipDraw = false
    end

end


function Rifle:OnUpdateAnimationInput(modelMixin)

    PROFILE("Rifle:OnUpdateAnimationInput")
    
    ClipWeapon.OnUpdateAnimationInput(self, modelMixin)
    
    modelMixin:SetAnimationInput("gl", false)
    modelMixin:SetAnimationInput("reload_speed", 1)
    modelMixin:SetAnimationInput("skip_draw", self.skipDraw)

end

function Rifle:GetSecondaryCanInterruptReload()
    return false
end

function Rifle:OnSecondaryAttack(player)

    if not self:GetIsReloading() then
	
        if Server then
            UpdateSoundType(self, player)
        end
		
		player:TriggerEffects("rifle_alt_attack")
		ClipWeapon.OnSecondaryAttack(self, player)
		
		--[[
    local viewAngles = player:GetViewAngles()
    viewAngles.roll = NetworkRandom() * math.pi * 2

    local shootCoords = viewAngles:GetCoords()
    -- Filter ourself out of the trace so that we don't hit ourselves.
    local filter = EntityFilterTwo(player, self)
    local range = kRange
    
	
	ClipWeapon.OnSecondaryAttack(self, player)
		

    
    if GetIsVortexed(player) then
        range = gRifleSecondaryRangeWhileVortexed --5
    end
    
    local numberBullets = self:GetBulletsPerShotSecondary()
    local startPoint = player:GetEyePos()
    
    for bullet = 1, math.min(numberBullets, #self.kSecondarySpreadVectors) do
    
        if not self.kSecondarySpreadVectors[bullet] then
            break
        end    
     
        local spreadDirection = shootCoords:TransformVector(self.kSecondarySpreadVectors[bullet])

        local endPoint = startPoint + spreadDirection * range
        startPoint = player:GetEyePos() + shootCoords.xAxis * self.kSecondarySpreadVectors[bullet].x * self.kStartOffset + shootCoords.yAxis * self.kSecondarySpreadVectors[bullet].y * self.kStartOffset
        
        local targets, trace, hitPoints = GetBulletTargets(startPoint, endPoint, spreadDirection, kBulletSize, filter)
        
        local damage = GetSecondaryDamagePerShot

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

            self:ApplyBulletGameplayEffects(player, target, hitPoint - hitOffset, direction, damage, "", showTracer and i == numTargets)
            
            local client = Server and player:GetClient() or Client
            if not Shared.GetIsRunningPrediction() and client.hitRegEnabled then
                RegisterHitEvent(player, bullet, startPoint, trace, damage)
            end
        
        end
        
    end
]]--
        
    end    

end



if Client then

    function Rifle:OnClientSecondaryAttackStart()
        
        
        --CheckForDestroyedEffects(self)
        
        -- TODO re-enable the single shot, see why it was removed at all :/
        StartSoundEffectAtOrigin(kSingleShotSounds[math.ceil(self.soundType / 3)], self:GetOrigin())
		
        Shared.PlaySound(self, kLoopingSounds[self.soundType])
        self.clientSoundTypePlaying = self.soundType
        
        local player = self:GetParent()
        
        if not self.muzzleCinematic then            
           Rifle:CreateMuzzleEffect(self)                
        elseif player then
        
            local cinematicName = kMuzzleCinematics[math.ceil(self.soundType / 3)]
            local useFirstPerson = player:GetIsLocalPlayer() and player:GetIsFirstPerson()
            
            if cinematicName ~= self.activeCinematicName or self.firstPersonLoaded ~= useFirstPerson then
            
                Rifle:DestroyMuzzleEffect(self)
                Rifle:CreateMuzzleEffect(self)
                
            end
            
        end
            
        -- CreateMuzzleCinematic() can return nil in case there is no parent or the parent is invisible (for alien commander for example)
        if self.muzzleCinematic then
            --self.muzzleCinematic:SetIsVisible(true)
        end
        
        if player then
        
            local useFirstPerson = player == Client.GetLocalPlayer()
            
            if useFirstPerson ~= self.loadedFirstPersonShellEffect then
                Rifle:DestroyShellEffect(self)
            end
        
            if not self.shellsCinematic then
                Rifle:CreateShellCinematic(self)
            end
        
            self.shellsCinematic:SetIsActive(true)

        end
        
    end
    
    -- needed for first person muzzle effect since it is attached to the view model entity: view model entity gets cleaned up when the player changes (for example becoming a commander and logging out again)
    -- this results in viewmodel getting destroyed / recreated -> cinematic object gets destroyed which would result in an invalid handle.
    function Rifle:OnParentChanged(oldParent, newParent)
        
        ClipWeapon.OnParentChanged(self, oldParent, newParent)
        
        --CheckForDestroyedEffects(self)
        --Rifle:DestroyMuzzleEffect(self)
        --Rifle:DestroyShellEffect(self)
        
    end
    
    function Rifle:OnClientSecondaryAttackEnd()
    
        --CheckForDestroyedEffects(self)
    
        -- Just assume the looping sound is playing.
        --Shared.StopSound(self, kLoopingSounds[self.soundType])
        --Shared.PlaySound(self, kEndSounds[math.ceil(self.soundType / 3)])
        
        if self.muzzleCinematic then
            self.muzzleCinematic:SetIsVisible(false)
        end
        
        if self.shellsCinematic then
            self.shellsCinematic:SetIsActive(false)
        end
        
    end
	
    
	
    function Rifle:GetSecondaryEffectRate()
        return gRifleSecondaryEffectRate --0.45 --0.08
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

    if damageType = kDamageType.Puncture then
        damageTable.damage = 1.5
    end
    
    if damageType ~= kDamageType.Corrode then
        damageTable.damage = 0
    end
    
end

function Rifle:GetCanTakeDamageOverride()
    return self:GetParent() == nil
end
*/