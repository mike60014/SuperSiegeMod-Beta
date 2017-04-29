if Server then 
local locorig = Location.OnTriggerEntered
 function Location:OnTriggerEntered(entity, triggerEnt)
        ASSERT(self == triggerEnt)
         locorig(self, entity, triggerEnt)
         
         
         if string.find(self.name, "siege") or string.find(self.name, "Siege") then
         ExploitCheck(entity)
         end
		 
         if GetGameStarted() then return end
                 local powerPoint = GetPowerPointForLocation(self.name)
            if powerPoint ~= nil then
                    if entity:isa("Marine") and not entity:isa("Commander") then
                         if not powerPoint:GetIsDisabled() and not powerPoint:GetIsSocketed() then 
                         powerPoint:SetInternalPowerState(PowerPoint.kPowerState.socketed)  
                         end
                    end 
            end 
                
end

function Location:AliensInSiegeRoom()

for _, entity in ipairs(self:GetEntitiesInTrigger()) do
	if entity:isa("Skulk") then
		entity:AddHealth(kAliensInSiegeRoomAddSkulkHealth)
		entity:AddArmor(kAliensInSiegeRoomAddSkulkArmor)
		entity:AddEnergy(kAliensInSiegeRoomAddSkulkEnergy)
	elseif entity:isa("Gorge") then
		entity:AddHealth(kAliensInSiegeRoomAddGorgeHealth)
		entity:AddArmor(kAliensInSiegeRoomAddGorgeArmor)
		entity:AddEnergy(kAliensInSiegeRoomAddGorgeEnergy)
	elseif entity:isa("Lerk") then
		entity:AddHealth(kAliensInSiegeRoomAddLerkHealth)
		entity:AddArmor(kAliensInSiegeRoomAddLerkArmor)
		entity:AddEnergy(kAliensInSiegeRoomAddLerkEnergy)
	elseif entity:isa("Fade") then
		entity:AddHealth(kAliensInSiegeRoomAddFadeHealth)
		entity:AddArmor(kAliensInSiegeRoomAddFadeArmor)
		entity:AddEnergy(kAliensInSiegeRoomAddFadeEnergy)
	elseif entity:isa("Onos") then
		entity:AddHealth(kAliensInSiegeRoomAddOnosHealth)
		entity:AddArmor(kAliensInSiegeRoomAddOnosArmor)
		entity:AddEnergy(kAliensInSiegeRoomAddOnosEnergy)



	end
end

end

end