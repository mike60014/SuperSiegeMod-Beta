
function NS2Gamerules:GetWarmUpPlayerLimit()
	return 10
end

function NS2Gamerules:KillEnemiesNearCommandStructureInPreGame(timePassed)

end

function NS2Gamerules:CastVoteByPlayer(voteTechId, player)
	if voteTechId == kTechId.VoteStalemateRound then
		if self:VotingStalementVoteAllowed() then
			local team = player:GetTeam()
			if team.VoteToStalemate then
				team:VoteToStalemate(player)
			end
		end
	end
end


function NS2Gamerules:VotingStalemateVoteAllowed()
    return PlayerUI_GetGameStartTime() > 0 and Shared.GetTime() - PlayerUI_GetGameStartTime() > kMinTimeBeforeStalemate
end