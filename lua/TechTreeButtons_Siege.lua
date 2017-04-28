local kTechIdToMaterialOffset = {}
kTechIdToMaterialOffset[kTechId.DropMAC] = 36
kTechIdToMaterialOffset[kTechId.AdvancedBeacon] = 1
kTechIdToMaterialOffset[kTechId.AdvBeacTech] = 1
kTechIdToMaterialOffset[kTechId.JumpPack] = 1
kTechIdToMaterialOffset[kTechId.DualFlamerExosuit] = 1
kTechIdToMaterialOffset[kTechId.DualWelderExosuit] = 1
kTechIdToMaterialOffset[kTechId.BackupLight] = 1
kTechIdToMaterialOffset[kTechId.MacSpawnOn] = 36
kTechIdToMaterialOffset[kTechId.MacSpawnOff] = 36
kTechIdToMaterialOffset[kTechId.ArcSpawnOff] = 33
kTechIdToMaterialOffset[kTechId.ArcSpawnOn] = 32
kTechIdToMaterialOffset[kTechId.MacSpawnOn] = 36


kTechIdToMaterialOffset[kTechId.ThickenedSkin] = 1
kTechIdToMaterialOffset[kTechId.Rebirth] = 34
kTechIdToMaterialOffset[kTechId.Redemption] = 1
kTechIdToMaterialOffset[kTechId.AcidRocket] = 1
kTechIdToMaterialOffset[kTechId.CommVortex] = 34
kTechIdToMaterialOffset[kTechId.CommTunnel] = 34
kTechIdToMaterialOffset[kTechId.EggBeacon] = 34
kTechIdToMaterialOffset[kTechId.PrimalScream] = 34
kTechIdToMaterialOffset[kTechId.OnoGrow] = 31
kTechIdToMaterialOffset[kTechId.Onocide] = 31
kTechIdToMaterialOffset[kTechId.Egg] = 34
kTechIdToMaterialOffset[kTechId.Egg] = 34
kTechIdToMaterialOffset[kTechId.Egg] = 34

function GetMaterialXYOffsetderp(techId)
  --Print("GetMaterialXYOffset")
    local index = nil
    
    local columns = 12
    index = kTechIdToMaterialOffset[techId]
    
    if not index then
        DebugPrint("Warning: %s did not define kTechIdToMaterialOffset ", EnumToString(kTechId, techId) )
    else
    
        local x = index % columns
        local y = math.floor(index / columns)
      
        
    end
    
    local x,y = GetMaterialXYOffset(techId)
    
    if x == nil and y == nil then
    
        local x = 2 % 12
        local y = math.floor(2 / 12)
        return x, y
     else 
      return x, y   
    end

    
end