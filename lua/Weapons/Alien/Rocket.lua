Script.Load("lua/Weapons/Projectile.lua")
Script.Load("lua/TeamMixin.lua")
Script.Load("lua/DamageMixin.lua")
Script.Load("lua/Weapons/PredictedProjectile.lua")

class 'Rocket' (PredictedProjectile)

Rocket.kMapName            = "rocket"
Rocket.kModelName          = PrecacheAsset("models/alien/babbler/babbler.model")

--local kAcidRocketHUDSlot = gAcidRocketHUDSlot
--local kAcidRocketFireDelay = gAcidRocketFireDelay
--local kAcidRocketEnergyCost = gAcidRocketEnergyCost
--local kAcidRocketDamage = gAcidRocketDamage
--local kAcidRocketRadius = gAcidRocketRadius
local kRocketRadius = gRocketRadius
local kRocketLifetime = gRocketLifeTime

local networkVars = { }

Rocket.kClearOnImpact = true
Rocket.kClearOnEnemyImpact = true
--Rocket.kRadius = kRocketRadius

AddMixinNetworkVars(BaseModelMixin, networkVars)
AddMixinNetworkVars(ModelMixin, networkVars)
AddMixinNetworkVars(TeamMixin, networkVars)

-- Blow up after a time.
local function UpdateLifetime(self)

    // in order to get the correct lifetime, 
	// we start counting our lifetime from the first UpdateLifetime rather than when
    // we were created
    if not self.endOfLife then
        self.endOfLife = Shared.GetTime() + kRocketLifetime
    end

    if self.endOfLife <= Shared.GetTime() then
    
        self:Detonate(nil)
        return false
        
    end
    
    return true
    
end

function Rocket:OnCreate()

    PredictedProjectile.OnCreate(self)
    
    InitMixin(self, BaseModelMixin)
    InitMixin(self, ModelMixin)
    InitMixin(self, TeamMixin)
    InitMixin(self, DamageMixin)
    
    if Server then
        self:AddTimedCallback(UpdateLifetime, 0.1)
        self.endOfLife = nil
    end

end

function Rocket:GetProjectileModel()
    return Rocket.kModelName
end 

function Rocket:GetDeathIconIndex()
    return kDeathMessageIcon.Babbler
end

function Rocket:GetDamageType()
    return gAcidRocketDamageType
end

function Rocket:OnAdjustModelCoords(modelCoords)
    local scale = 1.50
    local coords = modelCoords
    coords.xAxis = coords.xAxis * scale
    coords.yAxis = coords.yAxis * scale
    coords.zAxis = coords.zAxis * scale
      
    return coords
    
end
function Rocket:ProcessHit(targetHit, surface, normal, endPoint)
    if Server then
        self:Detonate(targetHit, surface)  
    end
    
end

if Server then

    function Rocket:Detonate(targetHit, surface)

        if not self:GetIsDestroyed() then
             self.stopSimulation = true
            local hitEntities = GetEntitiesWithMixinForTeamWithinRange("Live", 1, self:GetOrigin(), gAcidRocketRadius)
            // full damage on direct impact
            if targetHit then
                table.removevalue(hitEntities, targetHit)
                self:DoDamage(gAcidRocketDamage, targetHit, targetHit:GetOrigin(), GetNormalizedVector(targetHit:GetOrigin() - self:GetOrigin()), "none")
            end
            RadiusDamage(hitEntities, self:GetOrigin(), gAcidRocketRadius, gAcidRocketDamage, self)
            self:TriggerEffects("bilebomb_hit")
            DestroyEntity(self)
        end

    end

end


Shared.LinkClassToMap("Rocket", Rocket.kMapName, networkVars)
