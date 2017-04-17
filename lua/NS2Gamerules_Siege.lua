
--Script.Load("lua/Gamerules.lua")
--class "NS2GamerulesSiege" (Gamerules)

local networkVars = {}

function NS2Gamerules:GetWarmUpPlayerLimit()
	return 10
end

function NS2Gamerules:KillEnemiesNearCommandStructureInPreGame(timePassed)
--Someday?
end



/*
class "VoteStalemateRound" (Gamerules)

VoteStalemateRound.kMapName = "VoteStalemateRound"

function VoteStalemateRound:CastVoteByPlayer(voteTechId, player)
	if voteTechId == kTechId.VoteStalemateRound then
		if self:VotingStalementVoteAllowed() then
			local team = player:GetTeam()
			if team.VoteToStalemate then
				team:VoteToStalemate(player)
			end
		end
	end
end

function VoteStalemateRound:VotingStalemateVoteAllowed()
    return PlayerUI_GetGameStartTime() > 0 and Shared.GetTime() - PlayerUI_GetGameStartTime() > kMinTimeBeforeStalemate
end


Shared.LinkClassToMap("VoteStalemateRound", VoteStalemateRound.kMapName, networkVars)
--Shared.LinkClassToMap("VoteStalemateRound", kTechId.VoteStalemateRound, {})
*/