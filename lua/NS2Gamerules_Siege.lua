
Script.Load("lua/NS2Gamerules.lua")
--class "NS2GamerulesSiege" (Gamerules)

local networkVars = {}

function NS2Gamerules:GetWarmUpPlayerLimit()
	return 10
end

function NS2Gamerules:KillEnemiesNearCommandStructureInPreGame(timePassed)
--Someday?
end

if Server then

    function NS2Gamerules:UpdateStalemateSequence()
        local seq = GetStalemateSequence()
        if seq then
            seq:UpdateStalemateSequence()
        end
    end
	
	
end


class "VoteStalemateRound" (Gamerules)

VoteStalemateRound.kMapName = "VoteStalemateRound"

function VoteStalemateRound:CastVoteByPlayer(voteTechId, player)
	if voteTechId == kTechId.VoteStalemateRound then
		if self:VotingStalemateVoteAllowed() then
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
