local Shine = Shine

local Plugin = Plugin

function Plugin:Initialise()
self.Enabled = true
return true
end


Shine.VoteMenu:AddPage ("SpendStructures", function( self )
       local player = Client.GetLocalPlayer()
	self:AddTopButton("Classes", function()self:SetPage("SpendClasses") end)
    if player:GetTeamNumber() == 1 then
		self:AddTopButton("PhaseGate: "..gCreditStructurePhaseGateCost, function() Shared.ConsoleCommand ("sh_buy PhaseGate")  end)
		--Left Side
		self:AddSideButton("Mac: "..gCreditStructureMacCost, function() Shared.ConsoleCommand ("sh_buy Mac")  end)
		self:AddSideButton("Arc: "..gCreditStructureArcCost, function() Shared.ConsoleCommand ("sh_buy Arc")  end)
		self:AddSideButton("Observatory: "..gCreditStructureObservatoryCost, function() Shared.ConsoleCommand ("sh_buy Observatory")  end)
		self:AddSideButton("Sentry: "..gCreditStructureSentryCost, function() Shared.ConsoleCommand ("sh_buy Sentry")  end)
		self:AddSideButton("BackupBattery: "..gCreditStructureBackUpBatteryCost, function() Shared.ConsoleCommand ("sh_buy BackupBattery")  end)
		self:AddSideButton("BackupLight: "..gCreditStructureBackupLightCost, function() Shared.ConsoleCommand ("sh_buy BackupLight")  end)
		--Right Side
		self:AddSideButton("Armory: "..gCreditStructureArmoryCost, function() Shared.ConsoleCommand ("sh_buy Armory")  end)
		self:AddSideButton("InfantryPortal: "..gCreditStructureInfantryPortalCost, function() Shared.ConsoleCommand ("sh_buy InfantryPortal")  end)
		self:AddSideButton("RoboticsFactory: "..gCreditStructureRoboticsFactoryCost, function() Shared.ConsoleCommand ("sh_buy RoboticsFactory")  end)
	    --self:AddSideButton("LowerSupplyLimit: "..gCreditLowerSupplyLimit, function() Shared.ConsoleCommand ("sh_buy LowerSupplyLimit")  end)
    elseif player:GetTeamNumber() == 2 then

		if player:isa("Gorge") then
		self:AddTopButton("Tunnel@Hive: "..gCreditStructureCostTunnelToHive, function() Shared.ConsoleCommand ("sh_buycustom TunnelEntrance")  end)
		end
		--Left Side
		self:AddSideButton("Hydra: "..gCreditStructureCostHydra, function() Shared.ConsoleCommand ("sh_buy Hydra")  end)
		self:AddSideButton("SaltyEgg: "..gCreditStructureCostSaltyEgg, function() Shared.ConsoleCommand ("sh_buy SaltyEgg")  end)
		self:AddSideButton("Drifter: "..gCreditStructureCostDrifter, function() Shared.ConsoleCommand ("sh_buy Drifter")  end)
		self:AddSideButton("Clog: "..gCreditStructureCostClog, function() Shared.ConsoleCommand ("sh_buy Clog")  end)
		self:AddSideButton("Clog: "..gCreditStructureCostClog, function() Shared.ConsoleCommand ("sh_buy Clog")  end)

		--Right Side
		self:AddSideButton("Whip: "..gCreditStructureCostWhip, function() Shared.ConsoleCommand ("sh_buy Whip")  end)
		self:AddSideButton("Shift: "..gCreditStructureCostShift, function() Shared.ConsoleCommand ("sh_buy Shift")  end)
		self:AddSideButton("Shade: "..gCreditStructureCostShade, function() Shared.ConsoleCommand ("sh_buy Shade")  end)
		self:AddSideButton("Crag: "..gCreditStructureCostCrag, function() Shared.ConsoleCommand ("sh_buy Crag")  end)

		--self:AddSideButton("LowerSupplyLimit: "..gCreditLowerSupplyLimit, function() Shared.ConsoleCommand ("sh_buy LowerSupplyLimit")  end)
   end

        self:AddBottomButton("Back", function()self:SetPage("SpendCredits")end)
end)

Shine.VoteMenu:AddPage ("SpendExpenive", function( self )
       local player = Client.GetLocalPlayer()
    if player:GetTeamNumber() == 1 then
		self:AddSideButton("Extractor: "..gCreditStructureCostHarvesterExtractor, function() Shared.ConsoleCommand ("sh_buy Extractor")  end)
    elseif player:GetTeamNumber() == 2 then
		self:AddSideButton("Harvester: "..gCreditStructureCostHarvesterExtractor, function() Shared.ConsoleCommand ("sh_buy Harvester")  end)
    end
        self:AddBottomButton("Back", function()self:SetPage("SpendCredits")end)
end)


Shine.VoteMenu:AddPage ("SpendWeapons", function( self)
		self:AddTopButton("Classes", function()self:SetPage("SpendClasses") end)
		--Left Side
	    self:AddSideButton("Welder: "..gCreditWeaponCostWelder, function() Shared.ConsoleCommand ("sh_buywp Welder")  end)
	    self:AddSideButton("Cluster: "..gCreditWeaponCostGrenadeCluster, function() Shared.ConsoleCommand ("sh_buywp clustergrenade")  end)
	    self:AddSideButton("Stun: "..gCreditWeaponCostGrenadePulse, function() Shared.ConsoleCommand ("sh_buywp pulseGrenade")  end)
	    self:AddSideButton("NerveGas: "..gCreditWeaponCostGrenadeGas, function() Shared.ConsoleCommand ("sh_buywp gasgrenade")  end)
        self:AddSideButton("Mines: "..gCreditWeaponCostMines, function() Shared.ConsoleCommand ("sh_buywp Mines")  end)
        self:AddSideButton("Blank: "..gCreditAbilityCostBlank, function() Shared.ConsoleCommand ("sh_buywp Blank")  end)
		--Right Side
        self:AddSideButton("FlameThrower: "..gCreditWeaponCostFlameThrower, function() Shared.ConsoleCommand ("sh_buywp FlameThrower")  end)
        self:AddSideButton("GrenadeLauncher: "..gCreditWeaponCostGrenadeLauncher, function() Shared.ConsoleCommand ("sh_buywp GrenadeLauncher")  end)
        self:AddSideButton("Shotgun: "..gCreditWeaponCostShotGun, function() Shared.ConsoleCommand ("sh_buywp Shotgun")  end)
        self:AddSideButton("HeavyRifle: "..gCreditWeaponCostHMG, function() Shared.ConsoleCommand ("sh_buywp HeavyRifle")  end)
        self:AddSideButton("HeavyMachineGun: "..gCreditWeaponCostHMG, function() Shared.ConsoleCommand ("sh_buywp HeavyMachineGun")  end)

        self:AddBottomButton("Back", function()self:SetPage("SpendCredits")end)
end)

Shine.VoteMenu:AddPage ("SpendClasses", function( self )
	local player = Client.GetLocalPlayer()
	if player:GetTeamNumber() == 1 then
		self:AddSideButton("JetPack: "..gCreditClassCostJetPack, function() Shared.ConsoleCommand ("sh_buyclass JetPack")  end)
		self:AddSideButton("MiniGunExo: "..gCreditClassCostMiniGun, function() Shared.ConsoleCommand ("sh_buyclass MiniGun")  end)
		self:AddSideButton("RailGunExo: "..gCreditClassCostRailGun, function() Shared.ConsoleCommand ("sh_buyclass RailGun")  end)
		self:AddSideButton("WelderExo: "..gCreditClassCostWelder, function() Shared.ConsoleCommand ("sh_buyclass Welder")  end)
		self:AddSideButton("FlamerExo: "..gCreditClassCostFlamer, function() Shared.ConsoleCommand ("sh_buyclass Flamer")  end)
	elseif player:GetTeamNumber() == 2 then
		self:AddSideButton("Gorge: "..gCreditClassCostGorge, function() Shared.ConsoleCommand ("sh_buyclass Gorge")  end)
		self:AddSideButton("Lerk: "..gCreditClassCostLerk, function() Shared.ConsoleCommand ("sh_buyclass Lerk")  end)
		self:AddSideButton("Fade: "..gCreditClassCostFade, function() Shared.ConsoleCommand ("sh_buyclass Fade")  end)
		self:AddSideButton("Onos: "..gCreditClassCostOnos, function() Shared.ConsoleCommand ("sh_buyclass Onos")  end)
    end
        self:AddBottomButton("Back", function()self:SetPage("SpendCredits")end)
end)

Shine.VoteMenu:AddPage ("SpendExpenive", function( self )
        self:AddSideButton("OffensiveConcGrenade(100) (WIP)", function() Shared.ConsoleCommand ("sh_buywp OffensiveConcGrenade")  end)
             self:AddBottomButton("Back", function()self:SetPage("SpendCredits")end)

end)

Shine.VoteMenu:AddPage ("SpendFun", function( self )
        self:AddSideButton("JediConcGrenade: "..gCreditWeaponCostGrenadeJediConc, function() Shared.ConsoleCommand ("sh_buywp JediConcGrenade")  end)
		
        self:AddSideButton("OffensiveConcGrenade: "..gCreditWeaponCostGrenadeOffensiveConc, function() Shared.ConsoleCommand ("sh_buywp OffensiveConcGrenade")  end)
             self:AddBottomButton("Back", function()self:SetPage("SpendCredits")end)

end)

/*
Shine.VoteMenu:AddPage ("SpendCommAbilities", function( self )
	local player = Client.GetLocalPlayer()

	if player:GetTeamNumber() == 1 then
		self:AddSideButton ("Scan: "..gCreditAbilityCostScan, function()Shared.ConsoleCommand ("sh_buy Scan")end)
		self:AddSideButton ("Medpack: "..gCreditAbilityCostMedpack, function()Shared.ConsoleCommand ("sh_buy Medpack")end)
	else
		self:AddSideButton("NutrientMist: "..gCreditAbilityCostNutrientMist, function()Shared.ConsoleCommand ("sh_buy NutrientMist")end)
		self:AddSideButton("EnzymeCloud: "..gCreditAbilityCostEnzymeCloud, function() Shared.ConsoleCommand ("sh_buy EnzymeCloud")  end)
		self:AddSideButton("Ink: "..gCreditAbilityCostInk, function() Shared.ConsoleCommand ("sh_tbuy Ink")  end)
		self:AddSideButton("Hallucination: "..gCreditAbilityCostHallucination, function() Shared.ConsoleCommand ("sh_buy Hallucination")  end)
		self:AddSideButton("Contamination: "..gCreditAbilityCostContamination, function() Shared.ConsoleCommand ("sh_buy Contamination")  end)
	end
	self:AddBottomButton("Back", function()self:SetPage("SpendCredits")end)
end)
*/

Shine.VoteMenu:AddPage ("DestryUserSaltBuildings", function( self )
	local player = Client.GetLocalPlayer()
	self:AddSideButton ("Destroy All: ", function()Plugin:DestroyAllSaltStructFor(Player:GetClient())end)
	self:AddSideButton ("Destroy Targeted", function()Shared.ConsoleCommand ("sh_buy 1")end)
	
	self:AddBottomButton("Back", function()self:SetPage("Main")end)
end)

Shine.VoteMenu:AddPage ("Quick Salt", function( self )
       local player = Client.GetLocalPlayer()

	if player:GetTeamNumber() == 1 then

		self:AddTopButton("Structures", function()self:SetPage("SpendStructures") end)
		--Left Side
		self:AddSideButton("Welder: "..gCreditWeaponCostWelder, function() Shared.ConsoleCommand ("sh_buywp Welder")  end)
		self:AddSideButton("Scan: "..gCreditAbilityCostScan, function()Shared.ConsoleCommand ("sh_buy Scan")end)
		self:AddSideButton("Pulse Grenade: "..gCreditWeaponCostGrenadePulse, function() Shared.ConsoleCommand ("sh_buywp pulseGrenade")  end)
		self:AddSideButton("Gas Grenade: "..gCreditWeaponCostGrenadeGas, function() Shared.ConsoleCommand ("sh_buywp gasgrenade")  end)
		self:AddSideButton("GrenadeLauncher: "..gCreditWeaponCostGrenadeLauncher, function() Shared.ConsoleCommand ("sh_buywp GrenadeLauncher")  end)
		self:AddSideButton("Shotgun: "..gCreditWeaponCostShotGun, function() Shared.ConsoleCommand ("sh_buywp Shotgun")  end)

		--Right Side
		self:AddSideButton("HeavyRifle: "..gCreditWeaponCostHeavyRifle, function() Shared.ConsoleCommand ("sh_buywp HeavyRifle")  end)
		self:AddSideButton("HeavyMachineGun: "..gCreditWeaponCostHMG, function() Shared.ConsoleCommand ("sh_buywp HeavyMachineGun")  end)

		self:AddSideButton("JetPack: "..gCreditClassCostJetPack, function() Shared.ConsoleCommand ("sh_buyclass JetPack")  end)
		self:AddSideButton("MiniGunExo: "..gCreditClassCostMiniGun, function() Shared.ConsoleCommand ("sh_buyclass MiniGun")  end)
		self:AddSideButton("RailGunExo: "..gCreditClassCostRailGun, function() Shared.ConsoleCommand ("sh_buyclass RailGun")  end)
		self:AddSideButton("WelderExo: "..gCreditClassCostWelder, function() Shared.ConsoleCommand ("sh_buyclass Welder")  end)

	elseif player:GetTeamNumber() == 2 then
	if player:isa("Gorge") then
	self:AddSideButton("Tunnel@Hive: "..gCreditStructureCostTunnelToHive, function() Shared.ConsoleCommand ("sh_buycustom TunnelEntrance")  end)
	end

	self:AddTopButton("Structures", function()self:SetPage("SpendStructures") end)
	--Left Side
	self:AddSideButton("EnzymeCloud: "..gCreditAbilityCostEnzymeCloud, function() Shared.ConsoleCommand ("sh_buy EnzymeCloud")  end)
	self:AddSideButton("Ink: "..gCreditAbilityCostInk, function() Shared.ConsoleCommand ("sh_tbuy Ink")  end)
	self:AddSideButton("Hallucination: "..gCreditAbilityCostHallucination, function() Shared.ConsoleCommand ("sh_buy Hallucination")  end)
	self:AddSideButton("Contamination: "..gCreditAbilityCostContamination, function() Shared.ConsoleCommand ("sh_buy Contamination")  end)

    self:AddSideButton("Whip: "..gCreditStructureCostWhip, function() Shared.ConsoleCommand ("sh_buy Whip")  end)
    self:AddSideButton("Shift: "..gCreditStructureCostShift, function() Shared.ConsoleCommand ("sh_buy Shift")  end)
	--Right Side
    self:AddSideButton("Shade: "..gCreditStructureCostShade, function() Shared.ConsoleCommand ("sh_buy Shade")  end)
    self:AddSideButton("Crag: "..gCreditStructureCostCrag, function() Shared.ConsoleCommand ("sh_buy Crag")  end)

	self:AddSideButton("Gorge: "..gCreditClassCostGorge, function() Shared.ConsoleCommand ("sh_buyclass Gorge")  end)
	self:AddSideButton("Lerk: "..gCreditClassCostLerk, function() Shared.ConsoleCommand ("sh_buyclass Lerk")  end)
	self:AddSideButton("Fade: "..gCreditClassCostFade, function() Shared.ConsoleCommand ("sh_buyclass Fade")  end)
	self:AddSideButton("Onos: "..gCreditClassCostOnos, function() Shared.ConsoleCommand ("sh_buyclass Onos")  end)



	else


	end
	self:AddBottomButton("Back", function()self:SetPage("Main")end)
end)


Shine.VoteMenu:AddPage ("SpendCredits", function( self )
	local player = Client.GetLocalPlayer()
	self:AddBottomButton("Back", function()self:SetPage("Main") end)
	if player:GetTeamNumber() == 1 then
		self:AddSideButton("Medpack: "..gCreditAbilityCostMedpack, function()Shared.ConsoleCommand ("sh_buy Medpack") end) --left ish
		self:AddSideButton("Scan: "..gCreditAbilityCostScan, function()Shared.ConsoleCommand ("sh_buy Scan") end) --top left
		self:AddSideButton("Blank: "..gCreditAbilityCostBlank, function()Shared.ConsoleCommand ("sh_buy Blank") end) --top left
		self:AddSideButton("Blank: "..gCreditAbilityCostBlank, function()Shared.ConsoleCommand ("sh_buy Blank") end) --top left
		self:AddSideButton("Blank: "..gCreditAbilityCostBlank, function()Shared.ConsoleCommand ("sh_buy Blank") end) --top left
		
		self:AddSideButton("Classes", function()self:SetPage("SpendClasses") end)
		self:AddSideButton("Weapons", function()self:SetPage("SpendWeapons") end) --top right
		self:AddSideButton("Structures", function()self:SetPage("SpendStructures") end) --rightish
		self:AddSideButton("Expensive", function()self:SetPage("SpendExpenive") end) --left
	elseif player:GetTeamNumber() == 2 then
		--self:AddSideButton("CommAbilities", function() self:SetPage("SpendCommAbilities") end)
		self:AddSideButton("Classes", function()self:SetPage("SpendClasses") end)
		self:AddSideButton("Expensive", function()self:SetPage("SpendExpenive") end)
		self:AddSideButton("Structures", function()self:SetPage("SpendStructures") end)
		--  self:AddSideButton("Fun", function() self:SetPage("SpendFun") end)
	end

end)


Shine.VoteMenu:EditPage("Main", function( self )
self:AddSideButton("Salt", function() self:SetPage("SpendCredits") end)
self:AddSideButton("Quick Salt", function() self:SetPage("Quick Salt") end)
--self:AddBottomButton("Destroy Salt Buildings", function() self:SetPage("DestryUserSaltBuildings") end)
end)


