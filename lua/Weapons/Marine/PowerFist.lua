--PowerFist

Script.Load("lua/Weapons/Weapon.lua")
Script.Load("lua/Weapons/Marine/Grenade.lua")
Script.Load("lua/LiveMixin.lua")

class 'Fist' (Weapon)
class 'PowerFist' (Grenade)

Fist.kMapName = "fist"
PowerFist.kMapName = "PowerFist"

Fist.kModelName = PrecacheAsset("models/marine/grenades/gr_pulse_world.model")
PowerFist.kModelName = PrecacheAsset("models/marine/grenades/gr_pulse_world.model")
Fist.kRange = 1.4
Fist.kFloorRange = 1
PowerFist.kRange = 2
PowerFist.kFloorRange = 1

local networkVars =
{
    sprintAllowed = "boolean",
}

local function EnergyDamage(hitEntities, origin, radius, damage)

    for _, entity in ipairs(hitEntities) do
    
        if entity.GetEnergy and entity.SetEnergy then
        
            local targetPoint = HasMixin(entity, "Target") and entity:GetEngagementPoint() or entity:GetOrigin()
            local energyToDrain = damage *  (1 - Clamp( (targetPoint - origin):GetLength() / radius, 0, 1))
            entity:SetEnergy(entity:GetEnergy() - energyToDrain)
        
        end
    
        if entity.SetElectrified then
            entity:SetElectrified(kElectrifiedDuration)
        end
    
    end

end

function Fist:ProcessHit(targetHit)

    if targetHit and GetAreEnemies(self, targetHit) then
    
        if Server then
            self:Detonate(targetHit)
        else
            return true
        end    
    
    end
    
    return false
    
end

if Server then
    
    --function Fist:TimedDetonateCallback()
    --    self:Detonate()
    --end
    
    function PowerFist:TimedDetonateCallback()
        self:Detonate()
    end
    
    function PowerFist:Detonate(targetHit)

        local hitEntities = GetEntitiesWithMixinWithinRange("Live", self:GetOrigin(), kPowerFistEnergyDamageRadius)
        table.removevalue(hitEntities, self)

        if targetHit then
        
            table.removevalue(hitEntities, targetHit)
            self:DoDamage(kPowerFistDamage, targetHit, targetHit:GetOrigin(), GetNormalizedVector(targetHit:GetOrigin() - self:GetOrigin()), "none")

                if targetHit.SetElectrified then
                    targetHit:SetElectrified(kElectrifiedDuration)
                end
            
        end
        
        RadiusDamage(hitEntities, self:GetOrigin(), kPowerFistDamageRadius, kPowerFistDamage, self)
        EnergyDamage(hitEntities, self:GetOrigin(), kPowerFistEnergyDamageRadius, kPowerFistEnergyDamage)

        local surface = GetSurfaceFromEntity(targetHit)
        
        if GetIsVortexed(self) then
            surface = "ethereal"
        end

        local params = { surface = surface }
        if not targetHit then
            params[kEffectHostCoords] = Coords.GetLookIn( self:GetOrigin(), self:GetCoords().zAxis)
        end
        
        self:TriggerEffects("pulse_grenade_explode", params)    
        CreateExplosionDecals(self)
        TriggerCameraShake(self, kGrenadeMinShakeIntensity, kGrenadeMaxShakeIntensity, kGrenadeCameraShakeDistance)
		PowerFist.lastDetonate = Shared.GetTime()
        DestroyEntity(self)

    end

    function PowerFist:OnUpdate(deltaTime)
    
        PredictedProjectile.OnUpdate(self, deltaTime)

        for _, enemy in ipairs( GetEntitiesForTeamWithinRange("Alien", GetEnemyTeamNumber(self:GetTeamNumber()), self:GetOrigin(), 3) ) do
        
            if enemy:GetIsAlive() then
                self:Detonate()
                break
            end
        
        end

    end
	
	

end

function PowerFist:OnCreate()

    Weapon.OnCreate(self)
    
    self.sprintAllowed = true
    
    InitMixin(self, BaseModelMixin)
    InitMixin(self, ModelMixin)
    InitMixin(self, TeamMixin)
    InitMixin(self, DamageMixin)
    
    if Server then
	
        --self:AddTimedCallback(PowerFist.TimedDetonateCallback, kLifeTime)
        self:Detonate()
    end
end

function PowerFist:OnInitialized()

    Weapon.OnInitialized(self)
	
    self:SetModel(Fist.kModelName)
    
end


function Fist:OnCreate()

    Weapon.OnCreate(self)
    
    self.sprintAllowed = true
    
    InitMixin(self, BaseModelMixin)
    InitMixin(self, ModelMixin)
    InitMixin(self, TeamMixin)
    InitMixin(self, DamageMixin)
    
    if Server then
	
        --self:AddTimedCallback(PowerFist.TimedDetonateCallback, kLifeTime)
        
    end
end

function Fist:OnInitialized()

    Weapon.OnInitialized(self)
	
    self:SetModel(Fist.kModelName)
    
end

function Fist:GetViewModelName(sex, variant)
    return kViewModels[sex][variant]
end

function Fist:GetAnimationGraphName()
    return kAnimationGraph
end

function PowerFist:GetHUDSlot()
    return 3 --kTertiaryWeaponSlot
end

function Fist:GetHUDSlot()
    return 3 --kTertiaryWeaponSlot
end

function Fist:GetRange()
	local player = self:GetParent()
	local floorAim = player and player:GetViewCoords().zAxis.y or 0
	floorAim = floorAim * floorAim
    return Fist.kRange + Clamp(floorAim,0,1) * Fist.kFloorRange
end

function PowerFist:GetRange()
	local player = self:GetParent()
	local floorAim = player and player:GetViewCoords().zAxis.y or 0
	floorAim = floorAim * floorAim
    return Fist.kRange + Clamp(floorAim,0,1) * Fist.kFloorRange
end

function PowerFist:GetShowDamageIndicator()
    return true
end

function PowerFist:GetSprintAllowed()
    return self.sprintAllowed
end

function Fist:GetShowDamageIndicator()
    return true
end

function Fist:GetSprintAllowed()
    return self.sprintAllowed
end


function Fist:GetIdleAnimations(index)
    local animations = {"idle", "idle_toss", "idle_toss"}
    return animations[index]
end

function PowerFist:OnDraw(player, previousWeaponMapName)

    Weapon.OnDraw(self, player, previousWeaponMapName)
    
    -- Attach weapon to parent's hand
    self:SetAttachPoint(Weapon.kHumanAttachPoint)
    
    idleTime = Shared.GetTime()
    
end

function Fist:OnDraw(player, previousWeaponMapName)

    Weapon.OnDraw(self, player, previousWeaponMapName)
    
    -- Attach weapon to parent's hand
    self:SetAttachPoint(Weapon.kHumanAttachPoint)
    
    idleTime = Shared.GetTime()
    
end

function Fist:OnHolster(player)

    Weapon.OnHolster(self, player)
    
    self.sprintAllowed = true
    self.primaryAttacking = false
    
end

function PowerFist:OnPrimaryAttack(player)
    if not self.attacking and true then
        self.sprintAllowed = false
        self.secondaryAttacking = true
    end
end

function PowerFist:OnSecondaryAttackEnd(player)
    self.secondaryAttacking = false
    idleTime = Shared.GetTime()
end

function Fist:OnPrimaryAttack(player)

    if not self.attacking then
        
        self.sprintAllowed = false
        self.primaryAttacking = true
        
    end

end

function Fist:OnPrimaryAttackEnd(player)
    self.primaryAttacking = false
    idleTime = Shared.GetTime()
end

function Fist:OnTag(tagName)

    PROFILE("Fist:OnTag")

    if tagName == "swipe_sound" then
    
        local player = self:GetParent()
        if player then
            player:TriggerEffects("axe_attack")
        end
        
    elseif tagName == "powerhit" then
         Fist:Detonate()
		 
    elseif tagName == "hit" then
    
        local player = self:GetParent()
        if player then
            AttackMeleeCapsule(self, player, kFistDamage, self:GetRange())
        end
        
    elseif tagName == "attack_end" then
        self.sprintAllowed = true
    elseif tagName == "deploy_end" then
        self.sprintAllowed = true
    elseif tagName == "idle_toss_start" then
        --self:TriggerEffects("axe_idle_toss")
    elseif tagName == "idle_fiddle_start" then
        --self:TriggerEffects("axe_idle_fiddle")
    end
    
end

function Fist:OnUpdateAnimationInput(modelMixin)

    PROFILE("Fist:OnUpdateAnimationInput")
    
    local player = self:GetParent()
    if player and player:GetIsIdle() then
        local totalTime = math.round(Shared.GetTime() - idleTime)
        if totalTime >= animFrequency*3 then
            idleTime = Shared.GetTime()
        elseif totalTime >= animFrequency*2 and self:GetIdleAnimations(3) then
            modelMixin:SetAnimationInput("idleName", self:GetIdleAnimations(3))
        elseif totalTime >= animFrequency and self:GetIdleAnimations(2) then
            modelMixin:SetAnimationInput("idleName", self:GetIdleAnimations(2))
        elseif totalTime < animFrequency then
            modelMixin:SetAnimationInput("idleName", self:GetIdleAnimations(1))
        end
        
    else
        idleTime = Shared.GetTime()
        modelMixin:SetAnimationInput("idleName", "idle")
    end
    
    local activity = "none"
    if self.primaryAttacking then
        activity = "primary"
    end
    if self.secondaryAttacking then
        activity = "secondary"
    end
    modelMixin:SetAnimationInput("activity", activity)
    
end

function Fist:UseLandIntensity()
    return true
end


function PowerFist:GetDeathIconIndex()
    return kDeathMessageIcon.PulseGrenade
end

function Fist:GetDeathIconIndex()
    return kDeathMessageIcon.Axe
end

Shared.LinkClassToMap("PowerFist", PowerFist.kMapName, networkVars)
Shared.LinkClassToMap("Fist", Fist.kMapName, networkVars)