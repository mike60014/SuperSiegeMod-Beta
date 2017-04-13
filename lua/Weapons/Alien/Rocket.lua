//
// lua\Weapons\Alien\Rocket.lua
//DoDamage(damage, target, point, direction, surface, altMode, showtracer)
//TakeDamage(damage, attacker, doer, point, direction, armorUsed, healthUsed, damageType, preventAlert)
//RadiusDamage(entities, centerOrigin, radius, fullDamage, doer, ignoreLOS, fallOffFunc)

Script.Load("lua/Weapons/Projectile.lua")
Script.Load("lua/TeamMixin.lua")
Script.Load("lua/DamageMixin.lua")
Script.Load("lua/Weapons/PredictedProjectile.lua")

class 'Rocket' (PredictedProjectile)

// The max amount of time a Rocket can last for


local kAcidRocketHUDSlot = gAcidRocketHUDSlot
local kAcidRocketFireDelay = gAcidRocketFireDelay
local kAcidRocketEnergyCost = gAcidRocketEnergyCost
local kAcidRocketDamage = gAcidRocketDamage
local kAcidRocketRadius = gAcidRocketRadius
local kRocketLifetime = gRocketLifeTime
local ignoreLOS = gAcidRocketignoreLOS

local networkVars = { }


Rocket.kMapName            = "rocket"
Rocket.kModelName          = PrecacheAsset("models/alien/babbler/babbler.model")
Rocket.kClearOnImpact = true
Rocket.kClearOnEnemyImpact = true
Rocket.kRadius = gRocketRadius


AddMixinNetworkVars(BaseModelMixin, networkVars)
AddMixinNetworkVars(ModelMixin, networkVars)
AddMixinNetworkVars(TeamMixin, networkVars)


function Rocket:OnCreate()

    PredictedProjectile.OnCreate(self)

    InitMixin(self, BaseModelMixin)
    InitMixin(self, ModelMixin)
    InitMixin(self, TeamMixin)
    InitMixin(self, DamageMixin)

    if Server then
        self:AddTimedCallback(UpdateLifetime, 0.1)
		--UpdateLifetime(self)
        self.endOfLife = nil
    end

end

function self:SetFallOffFunc(fallOffFunc)
    self.fallOffFunc = 3
end

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

function Rocket:GetProjectileModel()
    return Rocket.kModelName
end

function Rocket:GetDeathIconIndex()
    return kDeathMessageIcon.Babbler
end

function Rocket:GetDamageType()
    return kAcidRocketDamageType
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
            local hitEntities = GetEntitiesWithMixinForTeamWithinRange("Live", 1, self:GetOrigin(), kAcidRocketRadius)
            // full damage on direct impact
            if targetHit then
                table.removevalue(hitEntities, targetHit)
                self:DoDamage(kAcidRocketDamage, targetHit, targetHit:GetOrigin(), GetNormalizedVector(targetHit:GetOrigin() - self:GetOrigin()), "none")
				
            end
				
		--RadiusDamage(hitEntities, self:GetOrigin(), kAcidRocketRadius, kAcidRocketDamage, self)

		assert(HasMixin(doer, "Damage"))
	-- Do damage to every target in range33
		for index, target in hitEntities do
			-- Find most representative point to hit
			local targetOrigin = GetTargetOrigin(target)
			-- Trace line to each target to make sure it's not blocked by a wall
			local wallBetween = false
			local distanceFromTarget = (targetOrigin - centerOrigin):GetLength()
			if not ignoreLOS then
				wallBetween = GetWallBetween(centerOrigin, targetOrigin, target)
			end

			if (ignoreLOS or not wallBetween) and (distanceFromTarget <= kradius) then

				-- Damage falloff
				local piFraction = Clamp(distanceFraction, 0, 1) * math.pi / 2
				local distanceFraction = math.cos(piFraction + math.pi) + 1  --distanceFromTarget / kradius
				
				if self.fallOffFunc then
					distanceFraction = self.fallOffFunc(distanceFraction)
				end

				distanceFraction = Clamp(distanceFraction, 0, 1)
				local damage = kAcidRocketDamage * (1 - distanceFraction)

				local damageDirection = targetOrigin - centerOrigin
				damageDirection:Normalize()

				-- we can't hit world geometry, so don't pass any surface params and let DamageMixin decide
				self:DoDamage(damage, target, target:GetOrigin(), damageDirection, "none")

			end

		end

		self:TriggerEffects("bilebomb_hit")
		DestroyEntity(self)
	end

    end

end


Shared.LinkClassToMap("Rocket", Rocket.kMapName, networkVars)