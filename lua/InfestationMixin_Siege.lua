function InfestationMixin:UpdateInfestation(deltaTime)
    
    PROFILE("InfestationMixin:UpdateInfestation")
    local hasInfestation = not HasMixin(self, "Construct") or self:GetIsBuilt()
    
    if hasInfestation and not self.infestationGenerated then
        CreateInfestation(self)
        self.desiredInfestationRadius = self:GetInfestationMaxRadius()
    end
    
    local playerIsEnemy = Client and GetAreEnemies(self, Client.GetLocalPlayer()) or false
    local cloakFraction = (playerIsEnemy and HasMixin(self, "Cloakable")) and self:GetCloakFraction() or 0
    local radius = self:GetCurrentInfestationRadius()
    local isOverHead = Client and PlayerUI_IsOverhead()
    local visible = self:GetIsVisible()
    
    -- update infestation patches
    for i = 1, #self.infestationPatches do
    
        local infestation = self.infestationPatches[i]

        infestation:SetRadius(radius)
        
        if Client then
            infestation:SetCloakFraction(cloakFraction)
            infestation:SetIsVisible(true) --visible and (not isOverHead or infestation.coords.yAxis.y > 0.55))
        end
    
    end
    
    if not self:GetIsAlive() and radius == 0 then        
        self.allowDestruction = true
    end
    
    self.currentInfestationRadius = radius
    -- if we have reached our full radius, we can update less often
    return radius == self.desiredInfestationRadius and kUpdateInterval or kGrowingUpdateInterval
end