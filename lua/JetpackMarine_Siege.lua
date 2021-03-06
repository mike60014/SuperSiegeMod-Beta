JetpackMarine.kFuelReplenishDelay = kJetpackFuelReplenishDelay -- 30% deduction of .4


/*
3.24 untested
*/
/*
function JetpackMarine:OnProcessMove(input)
     Marine.OnProcessMove(self, input)
     if Server then
        if self.poisoned then
          self:SetFuel( self:GetFuel() - kJetpackWeightLiftForce)
        end
     end
end
*/


function JetpackMarine:GetFuel()

    local dt = Shared.GetTime() - self.timeJetpackingChanged

    --overwrote to not apply weapon weight
    local weightFactor = math.max( kJetpackWeightLiftForce, kMinWeightJetpackFuelFactor )
    local rate = -kJetpackUseFuelRate * weightFactor
    
    if not self.jetpacking then
        rate = kJetpackReplenishFuelRate
        dt = math.max(0, dt - JetpackMarine.kFuelReplenishDelay)
    end
    
    if self:GetDarwinMode() then
        return 1
    else
        return Clamp(self.jetpackFuelOnChange + rate * dt, 0, 1)
    end
    
end