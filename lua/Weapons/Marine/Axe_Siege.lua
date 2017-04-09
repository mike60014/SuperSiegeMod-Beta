Script.Load("lua/Weapons/Weapon.lua")

class 'AxeSiege' (Axe)

AxeSiege.kMapName = "axesiege"


Axe.kRange = gAxeRange
Axe.kFloorRange = gAxeFloorRange


function AxeSiege:GetHUDSlot()
return gAxeHUDSlot
end
function AxeSiege:OnPrimaryAttack(player)
     Axe.OnPrimaryAttack(self, player)
     
    local viewAngles = player:GetViewAngles()
    local viewCoords = viewAngles:GetCoords()
    local startPoint = player:GetEyePos() + viewCoords.zAxis * 1
    local extents = Vector(1, 1, 1) 
    local trace = Shared.TraceBox(extents, startPoint, startPoint + Vector(1,0,1) , CollisionRep.Move, PhysicsMask.Bullets,  EntityFilterOne(player))
   -- local trace = Shared.TraceRay(player:GetEyePos(), startPoint, CollisionRep.Damage, PhysicsMask.Bullets, EntityFilterOne(player))
       
         if trace.entity then
           local classname = trace.entity:GetClassName()
                   Print("Traced entity %s", classname)
         if Server and HasMixin( trace.entity, "Construct" ) and not  trace.entity:isa("CommandStation") then
           local viewAngles = player:GetViewAngles()
           local viewCoords = viewAngles:GetCoords()
           local startVelocity = viewCoords.zAxis * 15

          end
         end
         

end


function AxeSiege:GetPrimaryAttackDelay()
    //return gAxePrimaryAttackDelay
end

function AxeSiege:GetSecondaryAttackDelay()
    return gAxeSecondaryAttackDelay
end

function AxeSiege:OnSecondaryAttack(player)

    if not self.attacking then
        
        self.sprintAllowed = false
        self.secondaryAttacking = true
        
    end

end

function AxeSiege:OnSecondaryAttackEnd(player)
    self.secondaryAttacking = false
    idleTime = Shared.GetTime()
end

Shared.LinkClassToMap("AxeSiege", AxeSiege.kMapName, networkVars)