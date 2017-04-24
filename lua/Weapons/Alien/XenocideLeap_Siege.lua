-- ======= Copyright (c) 2003-2011, Unknown Worlds Entertainment, Inc. All rights reserved. =======
--
-- lua\Weapons\Alien\XenocideLeap.lua
--
--    Created by:   Andreas Urwalek (a_urwa@sbox.tugraz.at)
--
--    First primary attack is xenocide, every next attack is bite. Secondary is leap.
--
-- ========= For more information, visit us at http://www.unknownworlds.com =====================

--Script.Load("lua/Weapons/Alien/Ability.lua")
--Script.Load("lua/Weapons/Alien/BiteLeap.lua")
--Script.Load("lua/Weapons/Alien/XenocideLeap.lua")

function XenocideLeap:GetHUDSlot()
    return kXenocideHUDSlot
end

function XenocideLeap:GetRange()
    return kXenocidekRange
end

