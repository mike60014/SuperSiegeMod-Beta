-- ======= Copyright (c) 2003-2011, Unknown Worlds Entertainment, Inc. All rights reserved. =======
--
-- lua\Weapons\Alien\XenocideLeap.lua
--
--    Created by:   Andreas Urwalek (a_urwa@sbox.tugraz.at)
--
--    First primary attack is xenocide, every next attack is bite. Secondary is leap.
--
-- ========= For more information, visit us at http://www.unknownworlds.com =====================

Script.Load("lua/Weapons/Alien/Ability.lua")
Script.Load("lua/Weapons/Alien/BiteLeap.lua")

--local kRange = 1.4

class 'XenocideLeapSiege' (BiteLeap)

XenocideLeap.kMapName = "xenocidesiege"

-- after kDetonateTime seconds the skulk goes 'boom!'
local kDetonateTime = gSkulkXenocideDetonateTime
local kXenocideSoundName = PrecacheAsset("sound/NS2.fev/alien/common/xenocide_start")
local kSkulkXenocideDistanceFraction = gSkulkXenocideDistanceFraction
local kXenocideDamage = gSkulkXenocidePlayerDamage
local kXenocideRange = gSkulkXenocideRadiusRange

local networkVars = { }

local function CheckForDestroyedEffects(self)
    if self.XenocideSoundName and not IsValid(self.XenocideSoundName) then
        self.XenocideSoundName = nil
    end
end

local function TriggerXenocide(self, player)

    if Server then
        CheckForDestroyedEffects( self )

        if not self.XenocideSoundName then
            self.XenocideSoundName = Server.CreateEntity(SoundEffect.kMapName)
            self.XenocideSoundName:SetAsset(kXenocideSoundName)
            self.XenocideSoundName:SetParent(self)
            self.XenocideSoundName:Start()
        else
            self.XenocideSoundName:Start()
        end
        --StartSoundEffectOnEntity(kXenocideSoundName, player)
        self.xenocideTimeLeft = kDetonateTime

    elseif Client and Client.GetLocalPlayer() == player then

        if not self.xenocideGui then
            self.xenocideGui = GetGUIManager():CreateGUIScript("GUIXenocideFeedback")
        end

        self.xenocideGui:TriggerFlash(kDetonateTime)
        player:SetCameraShake(.01, 15, kDetonateTime)

    end

end

local function CleanUI(self)

    if self.xenocideGui ~= nil then

        GetGUIManager():DestroyGUIScript(self.xenocideGui)
        self.xenocideGui = nil

    end

end

function XenocideLeap_Siege:OnDestroy()

    BiteLeap.OnDestroy(self)

    if Client then
        CleanUI(self)
    end

end

function XenocideLeap_Siege:GetDeathIconIndex()
    return kDeathMessageIcon.Xenocide
end

function XenocideLeap_Siege:GetEnergyCost(player)

    if not self.xenociding then
        return kXenocideEnergyCost
    else
        return BiteLeap.GetEnergyCost(self, player)
    end

end

function XenocideLeap_Siege:GetHUDSlot()
    return gSkulkXenocideLeapGetHUDSlot
end

function XenocideLeap_Siege:GetRange()
    return gSkulkXenocideRadiusRange
end

function XenocideLeap_Siege:OnPrimaryAttack(player)

    if player:GetEnergy() >= self:GetEnergyCost() then

        if not self.xenociding then

            TriggerXenocide(self, player)
            self.xenociding = true

        else

            if self.xenocideTimeLeft and self.xenocideTimeLeft < kDetonateTime * 0.8 then
                BiteLeap.OnPrimaryAttack(self, player)
            end

        end

    end

end

local function StopXenocide(self)

    CleanUI(self)

    self.xenociding = false

end

function XenocideLeap_Siege:OnProcessMove(input)

    BiteLeap.OnProcessMove(self, input)

    local player = self:GetParent()
    if self.xenociding then

        if player:isa("Commander") then
            StopXenocide(self)
        elseif Server then

            CheckForDestroyedEffects( self )

            self.xenocideTimeLeft = math.max(self.xenocideTimeLeft - input.time, 0)

            if self.xenocideTimeLeft == 0 and player:GetIsAlive() then

                player:TriggerEffects("xenocide", {effecthostcoords = Coords.GetTranslation(player:GetOrigin())})
				
				local kXenocideDamage = gSkulkXenocidePlayerDamage
                local hitEntities = GetEntitiesWithMixinWithinRange("Live", player:GetOrigin(), 1) --kXenocideRange
                
				RadiusDamage(hitEntities, player:GetOrigin(), 1, kXenocideDamage, self, false) --Errors when trying to add ,kSkulkXenocideDistanceFraction

                player.spawnReductionTime = 4

                player:SetBypassRagdoll(true)

                player:Kill()

                if self.XenocideSoundName then
                    self.XenocideSoundName:Stop()
                    self.XenocideSoundName = nil
                end
            end
            if Server and not player:GetIsAlive() and self.XenocideSoundName and self.XenocideSoundName:GetIsPlaying() == true then
                self.XenocideSoundName:Stop()
                self.XenocideSoundName = nil
            end

        elseif Client and not player:GetIsAlive() and self.xenocideGui then
            CleanUI(self)
        end

    end

end

if Server then

    function XenocideLeap_Siege:GetDamageType()

        if self.xenocideTimeLeft == 0 then
            return kXenocideDamageType
        else
            return kBiteDamageType
        end

    end

end

Shared.LinkClassToMap("XenocideLeap_Siege", XenocideLeap.kMapName, networkVars)