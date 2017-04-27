function Cyst:ModifyDamageTaken(damageTable, attacker, doer, damageType, hitPoint)

    if hitPoint ~= nil and doer ~= nil and doer:isa("Minigun") then
    
        damageTable.damage = damageTable.damage * 0.7
        --self:TriggerEffects("boneshield_blocked", {effecthostcoords = Coords.GetTranslation(hitPoint)} )
        
    end

end


function Cyst:UpdateHealthScalar()
    self.healthScalar = 1 + Clamp(((self:GetDistanceToHive() - kMinCystScalingDistance) / kMaxCystScalingDistance), 0, 1)
end


Cyst.kMaxEncodedPathLength = 9999 --30

function Cyst:GetCanAutoBuild()
    return true --false
end