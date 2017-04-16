
Script.Load("lua/Gamerules.lua")
class "NS2GamerulesSiege" (Gamerules)

function NS2GamerulesSiege:GetWarmUpPlayerLimit()
	return 10
end

function NS2GamerulesSiege:KillEnemiesNearCommandStructureInPreGame(timePassed)
--Someday?
end

function NS2GamerulesSiege:CastVoteByPlayer(voteTechId, player)
	if voteTechId == kTechId.VoteStalemateRound then
		if self:VotingStalementVoteAllowed() then
			local team = player:GetTeam()
			if team.VoteToStalemate then
				team:VoteToStalemate(player)
			end
		end
	end
end


function NS2GamerulesSiege:VotingStalemateVoteAllowed()
    return PlayerUI_GetGameStartTime() > 0 and Shared.GetTime() - PlayerUI_GetGameStartTime() > kMinTimeBeforeStalemate
end


Shared.LinkClassToMap("VoteStalemateRound", kTechId.VoteStalemateRound, {})
