-- buffed speed on doors
local kWelderPointsPerScore = gWelderPointsPerScore
local kWelderScoreAddedPerPoints = gWelderScoreAddedPerPoints
kExoWelderStructureWeldRateBreakableDoor = gExoWelderStructureWeldRateBreakableDoor
local kLevelScoreAdded = gLevelScoreAdded

local originit = Welder.GetRepairRate
function Welder:GetRepairRate(repairedEntity)

    local repairRate = gWelderPlayerArmorRate
    if repairedEntity:isa("BreakableDoor") then
        repairRate = gExoWelderStructureWeldRateBreakableDoor
    end
    
    return repairRate
    
end

local origweld = Welder.PerformWeld
function Welder:PerformWeld(player)
    local attackDirection = player:GetViewCoords().zAxis
    // prioritize friendlies
    local didHit, target, endPoint, direction, surface = CheckMeleeCapsule(self, player, 0, self:GetRange(), nil, true, 1, PrioritizeDamagedFriends, nil, PhysicsMask.Flame)
    
    if didHit and target and HasMixin(target, "Live") then
           
        if ( target.GetIsBuilt and target:GetIsBuilt() ) and player:GetTeamNumber() == target:GetTeamNumber() and HasMixin(target, "Weldable") and  HasMixin(target, "Levels") and target:GetLevel() ~= target:GetMaxLevel() then
                 local prevlevel = target.level
                target:AddXP(target:GetAddXPAmount())
                local success = false
                success = prevlevel ~= target.level
                   if success then
                   local addAmount = (target.level - prevlevel)
                   local kAmountLeveledForPoints = kWelderPointsPerScore
                   local kScoreAddedPerAmount = kWelderScoreAddedPerPoints
                   player:AddContinuousScore("WeldHealth", addAmount, kAmountLeveledForPoints, kLevelScoreAdded)
                   end     
       end
    end
        return origweld(self, player)
    
end

function Welder:OnPrimaryAttack(player)

    if GetIsVortexed(player) or not self.deployed then
        //return
    end
    
    PROFILE("Welder:OnPrimaryAttack")
    
    if not self.welding then
    
        self:TriggerEffects("welder_start")
        self.timeWeldStarted = Shared.GetTime()
        
        if Server then
            //self.loopingFireSound:Start()
        end
        
    end
    
    self.welding = true
    local hitPoint = nil
    
    if self.timeLastWeld + kWelderFireDelay < Shared.GetTime () then
    
        hitPoint = self:PerformWeld(player)
        self.timeLastWeld = Shared.GetTime()
        
    end
    
    if not self.timeLastWeldEffect or self.timeLastWeldEffect + kWelderFireDelay < Shared.GetTime() then
    
        self:TriggerEffects("welder_muzzle")
        self.timeLastWeldEffect = Shared.GetTime()
        
    end
    
end