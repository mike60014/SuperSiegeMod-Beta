Cyst.kMaxEncodedPathLength = 30
Cyst.kMapName = "cyst"
Cyst.kModelName = PrecacheAsset("models/alien/cyst/cyst.model")

Cyst.kAnimationGraph = PrecacheAsset("models/alien/cyst/cyst.animation_graph")

Cyst.kEnergyCost = 25
Cyst.kPointValue = 5
-- how fast the impulse moves
Cyst.kImpulseSpeed = 8

Cyst.kThinkInterval = 1 
Cyst.kImpulseColor = Color(1,1,0)
Cyst.kImpulseLightIntensity = 8

Cyst.kExtents = Vector(0.2, 0.1, 0.2)

Cyst.kBurstDuration = kCystBurstDuration

-- range at which we can be a parent
Cyst.kCystMaxParentRange = kCystMaxParentRange

-- size of infestation patch
Cyst.kInfestationRadius = kInfestationRadius
Cyst.kInfestationGrowthDuration = Cyst.kInfestationRadius / kCystInfestDuration

-- how many seconds before a fully mature cyst, disconnected, becomes fully immature again.
Cyst.kMaturityLossTime = 15

-- cyst infestation spreads/recedes faster
Cyst.kInfestationRateMultiplier = kCystInfestationRateMultiplier --3

function Cyst:GetMatureMaxHealth() --Cysts scale their health based on the distance to the clostest hive
    return math.max(kMatureCystHealth * self.healthScalar or 0, kMinMatureCystHealth)
end 

function Cyst:OnCreate()

    ScriptActor.OnCreate(self)
    
    InitMixin(self, TeamMixin)
    InitMixin(self, BaseModelMixin)
    InitMixin(self, ClientModelMixin)
    InitMixin(self, GameEffectsMixin)
    InitMixin(self, LiveMixin)
    InitMixin(self, FireMixin)
    InitMixin(self, UmbraMixin)
    InitMixin(self, CatalystMixin)
    InitMixin(self, CombatMixin)
    InitMixin(self, EntityChangeMixin)
    InitMixin(self, LOSMixin)
    InitMixin(self, FlinchMixin)
    InitMixin(self, SelectableMixin)
    InitMixin(self, PointGiverMixin)
    InitMixin(self, AchievementGiverMixin)
    InitMixin(self, CloakableMixin)
    InitMixin(self, ConstructMixin)
    InitMixin(self, MaturityMixin)
    InitMixin(self, DetectableMixin)
    
    if Server then
    
        InitMixin(self, SpawnBlockMixin)
        self:UpdateIncludeRelevancyMask()
        self.timeLastCystConstruction = 0
        
    elseif Client then
        InitMixin(self, CommanderGlowMixin)
        self.connectedFraction = 0
    end

    self:SetPhysicsCollisionRep(CollisionRep.Move)
    self:SetPhysicsGroup(PhysicsGroup.SmallStructuresGroup)
    
    self:SetLagCompensated(false)
    
    self.parentId = Entity.invalidId
    
end


function Cyst:ModifyDamageTaken(damageTable, attacker, doer, damageType, hitPoint)

    if hitPoint ~= nil and doer ~= nil and doer:isa("Minigun") then
    
        damageTable.damage = damageTable.damage * 0.7
        --self:TriggerEffects("boneshield_blocked", {effecthostcoords = Coords.GetTranslation(hitPoint)} )
        
    end

end

function Cyst:GetSpawnBlockDuration()
    return kCystSpawnBlockDuration
end