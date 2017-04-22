local Shine = Shine

local Plugin = Plugin

function Plugin:Initialise()
self.Enabled = true
return true
end

Shine.VoteMenu:AddPage ("SpendStructures", function( self )
       local player = Client.GetLocalPlayer()
    if player:GetTeamNumber() == 1 then 
    self:AddSideButton("Mac(50)", function() Shared.ConsoleCommand ("sh_buy Mac")  end)
    self:AddSideButton("Arc(200)", function() Shared.ConsoleCommand ("sh_buy Arc")  end)
    self:AddSideButton("Observatory(100)", function() Shared.ConsoleCommand ("sh_buy Observatory")  end)
    self:AddSideButton("Sentry(80)", function() Shared.ConsoleCommand ("sh_buy Sentry")  end)
    self:AddSideButton("BackupBattery(60)", function() Shared.ConsoleCommand ("sh_buy BackupBattery")  end)
    self:AddSideButton("BackupLight(40)", function() Shared.ConsoleCommand ("sh_buy BackupLight")  end)
    self:AddSideButton("Armory(120)", function() Shared.ConsoleCommand ("sh_buy Armory")  end)
    self:AddSideButton("PhaseGate(150)", function() Shared.ConsoleCommand ("sh_buy PhaseGate")  end)
    self:AddSideButton("InfantryPortal(150)", function() Shared.ConsoleCommand ("sh_buy InfantryPortal")  end)
    self:AddSideButton("RoboticsFactory(100)", function() Shared.ConsoleCommand ("sh_buy RoboticsFactory")  end)
   // self:AddSideButton("LowerSupplyLimit(50)", function() Shared.ConsoleCommand ("sh_buy LowerSupplyLimit")  end)
    elseif player:GetTeamNumber() == 2 then
    self:AddSideButton("Hydra(10)", function() Shared.ConsoleCommand ("sh_buy Hydra")  end)
    self:AddSideButton("SaltyEgg(150)", function() Shared.ConsoleCommand ("sh_buy SaltyEgg")  end)
    --self:AddSideButton("Drifter(50)", function() Shared.ConsoleCommand ("sh_buy Drifter")  end)
    self:AddSideButton("Shade(100)", function() Shared.ConsoleCommand ("sh_buy Shade")  end)
    self:AddSideButton("Crag(100)", function() Shared.ConsoleCommand ("sh_buy Crag")  end)
    self:AddSideButton("Whip(100)", function() Shared.ConsoleCommand ("sh_buy Whip")  end)
    self:AddSideButton("Shift(100)", function() Shared.ConsoleCommand ("sh_buy Shift")  end)
   -- self:AddSideButton("Clog(20)", function() Shared.ConsoleCommand ("sh_buy Clog")  end)
      if player:isa("Gorge") then
    self:AddSideButton("Tunnel@Hive(40)", function() Shared.ConsoleCommand ("sh_buycustom TunnelEntrance")  end)
      end
    //self:AddSideButton("LowerSupplyLimit(50)", function() Shared.ConsoleCommand ("sh_buy LowerSupplyLimit")  end)
   end

        self:AddBottomButton("Back", function()self:SetPage("SpendCredits")end) 
end)
Shine.VoteMenu:AddPage ("SpendExpenive", function( self )
       local player = Client.GetLocalPlayer()
    if player:GetTeamNumber() == 1 then 
            self:AddSideButton("Extractor(1500)", function() Shared.ConsoleCommand ("sh_buy Extractor")  end)
    elseif  player:GetTeamNumber() == 2 then
      self:AddSideButton("Harvester(1500)", function() Shared.ConsoleCommand ("sh_buy Harvester")  end)
    end
        self:AddBottomButton("Back", function()self:SetPage("SpendCredits")end) 
end)


Shine.VoteMenu:AddPage ("SpendWeapons", function( self )

        self:AddSideButton("Mines(15)", function() Shared.ConsoleCommand ("sh_buywp Mines")  end)
        self:AddSideButton("HeavyMachineGun(50)", function() Shared.ConsoleCommand ("sh_buywp HeavyMachineGun")  end)
        self:AddSideButton("Shotgun(20)", function() Shared.ConsoleCommand ("sh_buywp Shotgun")  end)
        self:AddSideButton("FlameThrower(30)", function() Shared.ConsoleCommand ("sh_buywp FlameThrower")  end)
        self:AddSideButton("GrenadeLauncher(30)", function() Shared.ConsoleCommand ("sh_buywp GrenadeLauncher")  end)
	    self:AddSideButton("Welder(1)", function() Shared.ConsoleCommand ("sh_buywp Welder")  end)
	    self:AddSideButton("Cluster(1)", function() Shared.ConsoleCommand ("sh_buywp Welder")  end)
	    self:AddSideButton("Stun(1)", function() Shared.ConsoleCommand ("sh_give ^ StunGrenade")  end)
	    self:AddSideButton("NerveGas(1)", function() Shared.ConsoleCommand ("sh_give ^ NerveGas")  end)
        self:AddBottomButton("Back", function()self:SetPage("SpendCredits")end) 
end)
Shine.VoteMenu:AddPage ("SpendClasses", function( self )
       local player = Client.GetLocalPlayer()
    if player:GetTeamNumber() == 1 then 
    self:AddSideButton("JetPack(80)", function() Shared.ConsoleCommand ("sh_buyclass JetPack")  end)
    self:AddSideButton("MiniGunExo(300)", function() Shared.ConsoleCommand ("sh_buyclass MiniGun")  end)
    self:AddSideButton("RailGunExo(290)", function() Shared.ConsoleCommand ("sh_buyclass RailGun")  end)
    self:AddSideButton("WelderExo(250)", function() Shared.ConsoleCommand ("sh_buyclass Welder")  end)
    self:AddSideButton("FlamerExo(270)", function() Shared.ConsoleCommand ("sh_buyclass Flamer")  end)
        elseif player:GetTeamNumber() == 2 then
      self:AddSideButton("Gorge(90)", function() Shared.ConsoleCommand ("sh_buyclass Gorge")  end)
      self:AddSideButton("Lerk(120)", function() Shared.ConsoleCommand ("sh_buyclass Lerk")  end)
      self:AddSideButton("Fade(200)", function() Shared.ConsoleCommand ("sh_buyclass Fade")  end)
      self:AddSideButton("Onos(250)", function() Shared.ConsoleCommand ("sh_buyclass Onos")  end)
    end
        self:AddBottomButton("Back", function()self:SetPage("SpendCredits")end) 
end)

Shine.VoteMenu:AddPage ("SpendExpenive", function( self )
        self:AddSideButton("OffensiveConcGrenade(100) (WIP)", function() Shared.ConsoleCommand ("sh_buywp OffensiveConcGrenade")  end)
             self:AddBottomButton("Back", function()self:SetPage("SpendCredits")end) 

end)

Shine.VoteMenu:AddPage ("SpendFun", function( self )
        self:AddSideButton("JediConcGrenade(5) (WIP)", function() Shared.ConsoleCommand ("sh_buywp JediConcGrenade")  end)
             self:AddBottomButton("Back", function()self:SetPage("SpendCredits")end) 
        self:AddSideButton("OffensiveConcGrenade(100) (WIP)", function() Shared.ConsoleCommand ("sh_buywp OffensiveConcGrenade")  end)
             self:AddBottomButton("Back", function()self:SetPage("SpendCredits")end) 

end)
/*
Shine.VoteMenu:AddPage ("SpendCommAbilities", function( self )
       local player = Client.GetLocalPlayer()
	   
           if player:GetTeamNumber() == 1 then 
                  self:AddSideButton ("Scan(10)", function()Shared.ConsoleCommand ("sh_buy Scan")end)
                  self:AddSideButton ("Medpack(5)", function()Shared.ConsoleCommand ("sh_buy Medpack")end)
           else
       self:AddSideButton ("NutrientMist(1)", function()Shared.ConsoleCommand ("sh_buy NutrientMist")end)
       self:AddSideButton("EnzymeCloud(15)", function() Shared.ConsoleCommand ("sh_buy EnzymeCloud")  end)
       self:AddSideButton("Ink(500)", function() Shared.ConsoleCommand ("sh_tbuy Ink")  end)
       self:AddSideButton("Hallucination(17)", function() Shared.ConsoleCommand ("sh_buy Hallucination")  end)
       self:AddSideButton("Contamination(10)", function() Shared.ConsoleCommand ("sh_buy Contamination")  end)
     end
     self:AddBottomButton("Back", function()self:SetPage("SpendCredits")end) 
end)
*/

Shine.VoteMenu:AddPage ("SpendCredits", function( self )
	local player = Client.GetLocalPlayer()
	self:AddTopButton("Classes", function()self:SetPage("SpendClasses") end)
	self:AddBottomButton("Back", function()self:SetPage("Main") end)
	if player:GetTeamNumber() == 1 then
		self:AddSideButton("Scan(10)", function()Shared.ConsoleCommand ("sh_buy Scan") end) --top left
		self:AddSideButton("Weapons", function()self:SetPage("SpendWeapons") end) --top right
		self:AddSideButton("Medpack(5)", function()Shared.ConsoleCommand ("sh_buy Medpack") end) --left ish
		self:AddSideButton("Structures", function()self:SetPage("SpendStructures") end) --rightish
		self:AddSideButton("Expensive", function()self:SetPage("SpendExpenive") end) --left
	elseif player:GetTeamNumber() == 2 then
		--self:AddSideButton("CommAbilities", function() self:SetPage("SpendCommAbilities") end)
		self:AddSideButton("Expensive", function()self:SetPage("SpendExpenive") end)
		self:AddSideButton("Structures", function()self:SetPage("SpendStructures") end)
		--  self:AddSideButton("Fun", function() self:SetPage("SpendFun") end)
	end
	
	end)


Shine.VoteMenu:EditPage("Main", function( self ) 
self:AddSideButton("Salt", function() self:SetPage("SpendCredits") end)
end)


